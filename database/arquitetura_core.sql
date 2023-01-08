/*
 Navicat Premium Data Transfer

 Source Server         : MyConnectPostgres
 Source Server Type    : PostgreSQL
 Source Server Version : 150000 (150000)
 Source Host           : localhost:5432
 Source Catalog        : arquitetura_core
 Source Schema         : arquitetura_core

 Target Server Type    : PostgreSQL
 Target Server Version : 150000 (150000)
 File Encoding         : 65001

 Date: 08/12/2022 20:36:14
*/


-- ----------------------------
-- Table structure for _prisma_migrations
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_core"."_prisma_migrations";
CREATE TABLE "arquitetura_core"."_prisma_migrations" (
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

-- ----------------------------
-- Records of _prisma_migrations
-- ----------------------------
INSERT INTO "arquitetura_core"."_prisma_migrations" VALUES ('7dffba90-abec-4805-b614-39a3ae3e5b89', 'bf3c7f11a49dca3cc40a1af699e35b207cb21be196f2c238559300340a3286ba', '2022-12-08 20:31:57.912614+00', '20220614134353_create_table_collectors', NULL, NULL, '2022-12-08 20:31:57.907796+00', 1);
INSERT INTO "arquitetura_core"."_prisma_migrations" VALUES ('325801c6-419e-4f65-a491-7edc4571cf65', 'e2aa7a374344ff2c97fe02cf6c1423c9080b5ac27ea7a1e42fff631a0b205357', '2022-12-08 20:31:57.917521+00', '20220614134353_create_table_events', NULL, NULL, '2022-12-08 20:31:57.913018+00', 1);
INSERT INTO "arquitetura_core"."_prisma_migrations" VALUES ('1f8f8bad-d9c6-4bd1-b20a-47cf539c8191', '43b8a40b5d460609791e5c87b1fa474366afcee00eb1d511cab7d8b0779ebc12', '2022-12-08 20:31:57.922291+00', '25220614134353_create_table_stores', NULL, NULL, '2022-12-08 20:31:57.917918+00', 1);
INSERT INTO "arquitetura_core"."_prisma_migrations" VALUES ('5a1bd5d2-5379-4948-ba45-bbb048049694', '8634fdf89a86721b601c69746144e65df4d0254db8dd181a359b98528ecbbcef', '2022-12-08 20:31:57.927885+00', '40220614134353_create_table_categories', NULL, NULL, '2022-12-08 20:31:57.922829+00', 1);
INSERT INTO "arquitetura_core"."_prisma_migrations" VALUES ('e1894ee1-4337-4bd5-9887-172b5e020a86', 'abaa378b644660996a3fc5a5bdbc57817f1e94df23555577aec64e43c55d1203', '2022-12-08 20:31:57.931813+00', '50220614134353_create_table_store_categories', NULL, NULL, '2022-12-08 20:31:57.928271+00', 1);
INSERT INTO "arquitetura_core"."_prisma_migrations" VALUES ('69356419-bced-4421-b001-fa801a7c124b', '41881e6e0cd1e330a255361c9dd9d8f1fb0cf997c3f669357e30c4d3c299e326', '2022-12-08 20:31:57.939755+00', '60220614134353_create_table_event_records', NULL, NULL, '2022-12-08 20:31:57.932166+00', 1);
INSERT INTO "arquitetura_core"."_prisma_migrations" VALUES ('9e8ecb80-72da-4307-bf1d-1867e8bff5dc', 'bdcc41c002586e3cb4c90928bffbd27e1e2536e28954ce443c07e2622767c851', '2022-12-08 20:31:57.944303+00', '90220614134353_carga_inicial', NULL, NULL, '2022-12-08 20:31:57.940385+00', 1);
INSERT INTO "arquitetura_core"."_prisma_migrations" VALUES ('94ccc8d3-6930-4538-aa19-f8a0383b6404', '919cd9699a93fe04241afac4afa9559370bd17f5c50508b9c0ead50ae3df0cc0', '2022-12-08 20:32:06.352671+00', '20221208203206_banco', NULL, NULL, '2022-12-08 20:32:06.348694+00', 1);

-- ----------------------------
-- Table structure for categories
-- ----------------------------


DROP TABLE IF EXISTS "arquitetura_core"."categories";
CREATE TABLE "arquitetura_core"."categories" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "active" bool NOT NULL DEFAULT true
)
;


INSERT INTO "arquitetura_core"."categories" VALUES ('1ccccdaa-cf75-4f75-9dfb-3fec4a2183ce', 'Roupas', 't');
INSERT INTO "arquitetura_core"."categories" VALUES ('0461b100-b3c7-4e92-b3a2-49a6ffbad54f', 'Calçados', 't');
INSERT INTO "arquitetura_core"."categories" VALUES ('e40761c0-a564-4179-85d3-1abe2210ce9c', 'Brinquedos', 't');
INSERT INTO "arquitetura_core"."categories" VALUES ('56188422-678e-452b-996f-dfd0ee2722b3', 'Texteis do lar', 't');


DROP TABLE IF EXISTS "arquitetura_core"."collectors";
CREATE TABLE "arquitetura_core"."collectors" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "latitude" int4 NOT NULL,
  "longitude" int4 NOT NULL,
  "address" text COLLATE "pg_catalog"."default" NOT NULL,
  "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'A'::text
)
;


INSERT INTO "arquitetura_core"."collectors" VALUES ('eb1333bf-a80e-4989-89eb-700900f16173', 10, 10, 'Collector address', 'A');
INSERT INTO "arquitetura_core"."collectors" VALUES ('ac56ef21-a7f3-4e25-bd6e-f8ecdea2481e', 20, 20, 'Collector address', 'A');
INSERT INTO "arquitetura_core"."collectors" VALUES ('a8d3af00-142a-4c00-a258-dba01f2ec156', 30, 30, 'Collector address', 'A');
INSERT INTO "arquitetura_core"."collectors" VALUES ('c4c1f45d-0c5b-4c7b-97c8-9bda2cacec02', 40, 40, 'Collector address', 'A');


DROP TABLE IF EXISTS "arquitetura_core"."event_records";
CREATE TABLE "arquitetura_core"."event_records" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "collector_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "event_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "registration_date" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'O'::text,
  "close_date" timestamp(3) NOT NULL
)
;


DROP TABLE IF EXISTS "arquitetura_core"."events";
CREATE TABLE "arquitetura_core"."events" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "active" bool NOT NULL DEFAULT true
)
;


INSERT INTO "arquitetura_core"."events" VALUES ('1ccccdaa-cf75-4f75-9dfb-3fec4a2183ce', 'Event #1', 't');
INSERT INTO "arquitetura_core"."events" VALUES ('0461b100-b3c7-4e92-b3a2-49a6ffbad54f', 'Event #2', 't');
INSERT INTO "arquitetura_core"."events" VALUES ('e40761c0-a564-4179-85d3-1abe2210ce9c', 'Event #3', 't');
INSERT INTO "arquitetura_core"."events" VALUES ('56188422-678e-452b-996f-dfd0ee2722b3', 'Event #4', 't');


DROP TABLE IF EXISTS "arquitetura_core"."store_categories";
CREATE TABLE "arquitetura_core"."store_categories" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "store_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "category_id" text COLLATE "pg_catalog"."default" NOT NULL
)
;


INSERT INTO "arquitetura_core"."store_categories" VALUES ('53ebe6e8-f3e6-44af-86fa-ea078fcb8a2f', '1ccccdaa-cf75-4f75-9dfb-3fec4a2183ce', 'eb1333bf-a80e-4989-89eb-700900f16173');
INSERT INTO "arquitetura_core"."store_categories" VALUES ('0eff6024-d9a1-4981-aa75-163ccd200544', '0461b100-b3c7-4e92-b3a2-49a6ffbad54f', 'eb1333bf-a80e-4989-89eb-700900f16173');
INSERT INTO "arquitetura_core"."store_categories" VALUES ('dedf6857-3c75-4e7f-8084-ff430352f8c7', '1ccccdaa-cf75-4f75-9dfb-3fec4a2183ce', 'ac56ef21-a7f3-4e25-bd6e-f8ecdea2481e');
INSERT INTO "arquitetura_core"."store_categories" VALUES ('dcd851e8-760b-436d-8086-3f88faabb18f', '0461b100-b3c7-4e92-b3a2-49a6ffbad54f', 'ac56ef21-a7f3-4e25-bd6e-f8ecdea2481e');
INSERT INTO "arquitetura_core"."store_categories" VALUES ('c501d3d5-0870-49fa-bb24-ec1b176c83ff', 'e40761c0-a564-4179-85d3-1abe2210ce9c', 'ac56ef21-a7f3-4e25-bd6e-f8ecdea2481e');
INSERT INTO "arquitetura_core"."store_categories" VALUES ('6584ff5c-41e2-4c07-bda9-1f238c1a8eea', '56188422-678e-452b-996f-dfd0ee2722b3', 'ac56ef21-a7f3-4e25-bd6e-f8ecdea2481e');


DROP TABLE IF EXISTS "arquitetura_core"."stores";
CREATE TABLE "arquitetura_core"."stores" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "address" text COLLATE "pg_catalog"."default" NOT NULL,
  "latitude" int4 NOT NULL,
  "longitude" int4 NOT NULL,
  "active" bool NOT NULL DEFAULT true
)
;


INSERT INTO "arquitetura_core"."stores" VALUES ('eb1333bf-a80e-4989-89eb-700900f16173', 'Stores #1', 'Store address', 10, 10, 't');
INSERT INTO "arquitetura_core"."stores" VALUES ('ac56ef21-a7f3-4e25-bd6e-f8ecdea2481e', 'Stores #2', 'Store address', 10, 10, 't');
INSERT INTO "arquitetura_core"."stores" VALUES ('a8d3af00-142a-4c00-a258-dba01f2ec156', 'Stores #3', 'Store address', 10, 10, 't');
INSERT INTO "arquitetura_core"."stores" VALUES ('c4c1f45d-0c5b-4c7b-97c8-9bda2cacec02', 'Stores #4', 'Store address', 10, 10, 't');





CREATE UNIQUE INDEX "categories_name_key" ON "arquitetura_core"."categories" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);


ALTER TABLE "arquitetura_core"."categories" ADD CONSTRAINT "categories_pkey" PRIMARY KEY ("id");

ALTER TABLE "arquitetura_core"."collectors" ADD CONSTRAINT "collectors_pkey" PRIMARY KEY ("id");

ALTER TABLE "arquitetura_core"."event_records" ADD CONSTRAINT "event_records_pkey" PRIMARY KEY ("id");


CREATE UNIQUE INDEX "events_name_key" ON "arquitetura_core"."events" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);


ALTER TABLE "arquitetura_core"."events" ADD CONSTRAINT "events_pkey" PRIMARY KEY ("id");

ALTER TABLE "arquitetura_core"."store_categories" ADD CONSTRAINT "store_categories_pkey" PRIMARY KEY ("id");


ALTER TABLE "arquitetura_core"."stores" ADD CONSTRAINT "stores_pkey" PRIMARY KEY ("id");

ALTER TABLE "arquitetura_core"."event_records" ADD CONSTRAINT "event_records_collector_id_fkey" FOREIGN KEY ("collector_id") REFERENCES "arquitetura_core"."collectors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "arquitetura_core"."event_records" ADD CONSTRAINT "event_records_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "arquitetura_core"."events" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
