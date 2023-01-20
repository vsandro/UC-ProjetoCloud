#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
	CREATE DATABASE arquitetura_event;
    \c arquitetura_event;
    CREATE SCHEMA arquitetura_event;
	GRANT ALL PRIVILEGES ON DATABASE arquitetura_event TO postgres;
 
EOSQL

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "arquitetura_event" <<-EOSQL
	\c arquitetura_event; 
    
/*
 Navicat Premium Data Transfer

 Source Server         : Database
 Source Server Type    : PostgreSQL
 Source Server Version : 150001 (150001)
 Source Host           : localhost:5432
 Source Catalog        : arquitetura_event
 Source Schema         : arquitetura_event

 Target Server Type    : PostgreSQL
 Target Server Version : 150001 (150001)
 File Encoding         : 65001

 Date: 17/01/2023 14:46:21
*/


-- ----------------------------
-- Table structure for collectors
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_event"."collectors";
CREATE TABLE "arquitetura_event"."collectors" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "address" text COLLATE "pg_catalog"."default" NOT NULL,
  "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'A'::text
)
;

-- ----------------------------
-- Records of collectors
-- ----------------------------

-- ----------------------------
-- Table structure for event_records
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_event"."event_records";
CREATE TABLE "arquitetura_event"."event_records" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "collector_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "event_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "registration_date" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'O'::text,
  "close_date" timestamp(3) NOT NULL
)
;

-- ----------------------------
-- Records of event_records
-- ----------------------------

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_event"."events";
CREATE TABLE "arquitetura_event"."events" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "active" bool NOT NULL DEFAULT true
)
;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO "arquitetura_event"."events" VALUES ('c0486ad4-8bba-441f-b859-5f635b171f2b', 'Contentor cheio', 't');
INSERT INTO "arquitetura_event"."events" VALUES ('025a4c9c-5d37-4587-944f-b8715b196fde', 'Contentor precisa de manutenção', 't');
INSERT INTO "arquitetura_event"."events" VALUES ('76b00a9a-eb6c-4eee-ba10-7a55dee1a6a8', 'Aviso', 't');
INSERT INTO "arquitetura_event"."events" VALUES ('709667bd-803e-473f-acde-0e588cf52bfe', 'Informação', 't');

-- ----------------------------
-- Primary Key structure for table collectors
-- ----------------------------
ALTER TABLE "arquitetura_event"."collectors" ADD CONSTRAINT "collectors_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table event_records
-- ----------------------------
ALTER TABLE "arquitetura_event"."event_records" ADD CONSTRAINT "event_records_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table events
-- ----------------------------
CREATE UNIQUE INDEX "events_name_key" ON "arquitetura_event"."events" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table events
-- ----------------------------
ALTER TABLE "arquitetura_event"."events" ADD CONSTRAINT "events_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table event_records
-- ----------------------------
ALTER TABLE "arquitetura_event"."event_records" ADD CONSTRAINT "event_records_collector_id_fkey" FOREIGN KEY ("collector_id") REFERENCES "arquitetura_event"."collectors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "arquitetura_event"."event_records" ADD CONSTRAINT "event_records_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "arquitetura_event"."events" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

EOSQL