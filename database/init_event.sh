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
    
    CREATE TABLE "arquitetura_event"."collectors" (
    "id" text COLLATE "pg_catalog"."default" NOT NULL,
    "address" text COLLATE "pg_catalog"."default" NOT NULL,
    "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'A'::text
    );


    CREATE TABLE "arquitetura_event"."event_records" (
    "id" text COLLATE "pg_catalog"."default" NOT NULL,
    "collector_id" text COLLATE "pg_catalog"."default" NOT NULL,
    "event_id" text COLLATE "pg_catalog"."default" NOT NULL,
    "registration_date" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "description" text COLLATE "pg_catalog"."default" NOT NULL,
    "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'O'::text,
    "close_date" timestamp(3) NOT NULL
    );

    DROP TABLE IF EXISTS "arquitetura_event"."events";
    CREATE TABLE "arquitetura_event"."events" (
    "id" text COLLATE "pg_catalog"."default" NOT NULL,
    "name" text COLLATE "pg_catalog"."default" NOT NULL,
    "active" bool NOT NULL DEFAULT true
    );


    ALTER TABLE "arquitetura_event"."collectors" ADD CONSTRAINT "collectors_pkey" PRIMARY KEY ("id");


    ALTER TABLE "arquitetura_event"."event_records" ADD CONSTRAINT "event_records_pkey" PRIMARY KEY ("id");

    CREATE UNIQUE INDEX "events_name_key" ON "arquitetura_event"."events" USING btree (
    "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
    );


    ALTER TABLE "arquitetura_event"."events" ADD CONSTRAINT "events_pkey" PRIMARY KEY ("id");


    ALTER TABLE "arquitetura_event"."event_records" ADD CONSTRAINT "event_records_collector_id_fkey" FOREIGN KEY ("collector_id") REFERENCES "arquitetura_event"."collectors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
    ALTER TABLE "arquitetura_event"."event_records" ADD CONSTRAINT "event_records_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "arquitetura_event"."events" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

EOSQL