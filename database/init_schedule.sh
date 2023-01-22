#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
    CREATE DATABASE arquitetura_schedule;
    \c arquitetura_schedule;
    CREATE SCHEMA arquitetura_schedule;
	GRANT ALL PRIVILEGES ON DATABASE arquitetura_schedule TO postgres;    
EOSQL

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "arquitetura_schedule" <<-EOSQL
    \c arquitetura_schedule; 


/*
 Navicat Premium Data Transfer

 Source Server         : Database
 Source Server Type    : PostgreSQL
 Source Server Version : 150001 (150001)
 Source Host           : localhost:5432
 Source Catalog        : arquitetura_schedule
 Source Schema         : arquitetura_schedule

 Target Server Type    : PostgreSQL
 Target Server Version : 150001 (150001)
 File Encoding         : 65001

 Date: 22/01/2023 13:57:38
*/


-- ----------------------------
-- Table structure for schedules
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_schedule"."schedules";
CREATE TABLE "arquitetura_schedule"."schedules" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "address" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "status" varchar(1) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "registration_date" timestamp(6) DEFAULT now(),
  "scheduled_date" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of schedules
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_schedule"."users";
CREATE TABLE "arquitetura_schedule"."users" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "profile_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "username" text COLLATE "pg_catalog"."default" NOT NULL,
  "password" text COLLATE "pg_catalog"."default" NOT NULL,
  "blocked" bool NOT NULL DEFAULT false,
  "failed" int4 NOT NULL DEFAULT 0,
  "name" text COLLATE "pg_catalog"."default",
  "address" text COLLATE "pg_catalog"."default",
  "phone" text COLLATE "pg_catalog"."default",
  "email" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Indexes structure for table users
-- ----------------------------
CREATE UNIQUE INDEX "users_email_key" ON "arquitetura_schedule"."users" USING btree (
  "email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "users_username_key" ON "arquitetura_schedule"."users" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "arquitetura_schedule"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table schedules
-- ----------------------------
ALTER TABLE "arquitetura_schedule"."schedules" ADD CONSTRAINT "schedules_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "arquitetura_schedule"."users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
  
EOSQL


