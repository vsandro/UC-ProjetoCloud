#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
    CREATE DATABASE arquitetura_core;
    \c arquitetura_core;
    CREATE SCHEMA arquitetura_core;
	GRANT ALL PRIVILEGES ON DATABASE arquitetura_core TO postgres;
EOSQL

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "arquitetura_core" <<-EOSQL
    \c arquitetura_core; 

    DROP TABLE IF EXISTS "arquitetura_core"."categories";
    CREATE TABLE "arquitetura_core"."categories" (
    "id" text COLLATE "pg_catalog"."default" NOT NULL,
    "name" text COLLATE "pg_catalog"."default" NOT NULL,
    "active" bool NOT NULL DEFAULT true
    );


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


    DROP TABLE IF EXISTS "arquitetura_core"."items";
    CREATE TABLE "arquitetura_core"."items" (
    "id" text COLLATE "pg_catalog"."default" NOT NULL,
    "description" text COLLATE "pg_catalog"."default" NOT NULL,
    "category_id" text COLLATE "pg_catalog"."default" NOT NULL,
    "active" bool NOT NULL DEFAULT true,
    "reserved" bool NOT NULL DEFAULT false
    );

 

    CREATE UNIQUE INDEX "categories_name_key" ON "arquitetura_core"."categories" USING btree (
    "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
    );


    ALTER TABLE "arquitetura_core"."categories" ADD CONSTRAINT "categories_pkey" PRIMARY KEY ("id");

    ALTER TABLE "arquitetura_core"."collectors" ADD CONSTRAINT "collectors_pkey" PRIMARY KEY ("id");

    ALTER TABLE "arquitetura_core"."event_records" ADD CONSTRAINT "event_records_pkey" PRIMARY KEY ("id");

    ALTER TABLE "arquitetura_core"."items" ADD CONSTRAINT "items_pkey" PRIMARY KEY ("id");
    ALTER TABLE "arquitetura_core"."items" ADD CONSTRAINT "item_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "arquitetura_core"."categories" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
    
    CREATE UNIQUE INDEX "items_description_key" ON "arquitetura_core"."items" USING btree (
    "description" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
    );
    
    CREATE UNIQUE INDEX "events_name_key" ON "arquitetura_core"."events" USING btree (
    "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
    );


    ALTER TABLE "arquitetura_core"."events" ADD CONSTRAINT "events_pkey" PRIMARY KEY ("id");

    ALTER TABLE "arquitetura_core"."store_categories" ADD CONSTRAINT "store_categories_pkey" PRIMARY KEY ("id");


    ALTER TABLE "arquitetura_core"."stores" ADD CONSTRAINT "stores_pkey" PRIMARY KEY ("id");

    ALTER TABLE "arquitetura_core"."event_records" ADD CONSTRAINT "event_records_collector_id_fkey" FOREIGN KEY ("collector_id") REFERENCES "arquitetura_core"."collectors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
    ALTER TABLE "arquitetura_core"."event_records" ADD CONSTRAINT "event_records_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "arquitetura_core"."events" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

EOSQL


