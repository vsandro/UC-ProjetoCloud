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


    DROP TABLE IF EXISTS "arquitetura_core"."collectors";
    CREATE TABLE "arquitetura_core"."collectors" (
    "id" text COLLATE "pg_catalog"."default" NOT NULL,
    "latitude" int4 NOT NULL,
    "longitude" int4 NOT NULL,
    "address" text COLLATE "pg_catalog"."default" NOT NULL,
    "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'A'::text
    );


    DROP TABLE IF EXISTS "arquitetura_core"."event_records";
    CREATE TABLE "arquitetura_core"."event_records" (
    "id" text COLLATE "pg_catalog"."default" NOT NULL,
    "collector_id" text COLLATE "pg_catalog"."default" NOT NULL,
    "event_id" text COLLATE "pg_catalog"."default" NOT NULL,
    "registration_date" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "description" text COLLATE "pg_catalog"."default" NOT NULL,
    "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'O'::text,
    "close_date" timestamp(3) NOT NULL
    );


    DROP TABLE IF EXISTS "arquitetura_core"."events";
    CREATE TABLE "arquitetura_core"."events" (
    "id" text COLLATE "pg_catalog"."default" NOT NULL,
    "name" text COLLATE "pg_catalog"."default" NOT NULL,
    "active" bool NOT NULL DEFAULT true
    )
    ;

    DROP TABLE IF EXISTS "arquitetura_core"."store_categories";
    CREATE TABLE "arquitetura_core"."store_categories" (
    "id" text COLLATE "pg_catalog"."default" NOT NULL,
    "store_id" text COLLATE "pg_catalog"."default" NOT NULL,
    "category_id" text COLLATE "pg_catalog"."default" NOT NULL
    );


    DROP TABLE IF EXISTS "arquitetura_core"."stores";
    CREATE TABLE "arquitetura_core"."stores" (
    "id" text COLLATE "pg_catalog"."default" NOT NULL,
    "name" text COLLATE "pg_catalog"."default" NOT NULL,
    "address" text COLLATE "pg_catalog"."default" NOT NULL,
    "latitude" int4 NOT NULL,
    "longitude" int4 NOT NULL,
    "active" bool NOT NULL DEFAULT true
    );



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


