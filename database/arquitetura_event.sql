/*
 Navicat Premium Data Transfer

 Source Server         : MyConnectPostgres
 Source Server Type    : PostgreSQL
 Source Server Version : 150000 (150000)
 Source Host           : localhost:5432
 Source Catalog        : arquitetura_event
 Source Schema         : arquitetura_event

 Target Server Type    : PostgreSQL
 Target Server Version : 150000 (150000)
 File Encoding         : 65001

 Date: 08/12/2022 20:36:35
*/


-- ----------------------------
-- Table structure for _prisma_migrations
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_event"."_prisma_migrations";
CREATE TABLE "arquitetura_event"."_prisma_migrations" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "checksum" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "finished_at" timestamptz(6),
  "migration_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "logs" text COLLATE "pg_catalog"."default",
  "rolled_back_at" timestamptz(6),
  "started_at" timestamptz(6) NOT NULL DEFAULT now(),
  "applied_steps_count" int4 NOT NULL DEFAULT 0
)
;

INSERT INTO "arquitetura_event"."_prisma_migrations" VALUES ('29cbd8eb-1ba1-4d00-92f6-ee749cf4f407', 'd8f801067c1e515dd5ca970f91ec74e858041daa23f4fb3aaf87380f65efed8b', '2022-12-08 20:32:43.205248+00', '20221205110711_banco_event', NULL, NULL, '2022-12-08 20:32:43.191031+00', 1);
INSERT INTO "arquitetura_event"."_prisma_migrations" VALUES ('c6fcea5e-924f-49d4-8199-6e7f6daa1280', '462cc0dfb42f299eebe839e138235bc34e331e7ead2809b16f8f43acbdecdeb8', '2022-12-08 20:32:43.207807+00', '20221207141224_banco', NULL, NULL, '2022-12-08 20:32:43.20561+00', 1);
INSERT INTO "arquitetura_event"."_prisma_migrations" VALUES ('91fc38de-30db-4679-b5f9-85ef452594c6', '4f6da21ff1ecd219e5686a5ae161072ac02bb29976a41ae0c108c0310d1b661e', '2022-12-08 20:32:43.210566+00', '90220614134353_carga_inicial', NULL, NULL, '2022-12-08 20:32:43.208153+00', 1);

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

INSERT INTO "arquitetura_event"."collectors" VALUES ('eb1333bf-a80e-4989-89eb-700900f16173', 'Collector address', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('ac56ef21-a7f3-4e25-bd6e-f8ecdea2481e', 'Collector address', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('a8d3af00-142a-4c00-a258-dba01f2ec156', 'Collector address', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('c4c1f45d-0c5b-4c7b-97c8-9bda2cacec02', 'Collector address', 'A');

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

DROP TABLE IF EXISTS "arquitetura_event"."events";
CREATE TABLE "arquitetura_event"."events" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "active" bool NOT NULL DEFAULT true
)
;


INSERT INTO "arquitetura_event"."events" VALUES ('1ccccdaa-cf75-4f75-9dfb-3fec4a2183ce', 'Event #1', 't');
INSERT INTO "arquitetura_event"."events" VALUES ('0461b100-b3c7-4e92-b3a2-49a6ffbad54f', 'Event #2', 't');
INSERT INTO "arquitetura_event"."events" VALUES ('e40761c0-a564-4179-85d3-1abe2210ce9c', 'Event #3', 't');
INSERT INTO "arquitetura_event"."events" VALUES ('56188422-678e-452b-996f-dfd0ee2722b3', 'Event #4', 't');

ALTER TABLE "arquitetura_event"."_prisma_migrations" ADD CONSTRAINT "_prisma_migrations_pkey" PRIMARY KEY ("id");

ALTER TABLE "arquitetura_event"."collectors" ADD CONSTRAINT "collectors_pkey" PRIMARY KEY ("id");


ALTER TABLE "arquitetura_event"."event_records" ADD CONSTRAINT "event_records_pkey" PRIMARY KEY ("id");

CREATE UNIQUE INDEX "events_name_key" ON "arquitetura_event"."events" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);


ALTER TABLE "arquitetura_event"."events" ADD CONSTRAINT "events_pkey" PRIMARY KEY ("id");


ALTER TABLE "arquitetura_event"."event_records" ADD CONSTRAINT "event_records_collector_id_fkey" FOREIGN KEY ("collector_id") REFERENCES "arquitetura_event"."collectors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "arquitetura_event"."event_records" ADD CONSTRAINT "event_records_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "arquitetura_event"."events" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
