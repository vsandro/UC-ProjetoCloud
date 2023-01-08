-- CreateTable
CREATE TABLE "event_records" (
    "id" TEXT NOT NULL,
    "collector_id" TEXT NOT NULL,
    "event_id" TEXT NOT NULL,
    "registration_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "description" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'O',
    "close_date" timestamp(3) NOT NULL,

    CONSTRAINT "event_records_pkey" PRIMARY KEY ("id")
);

ALTER TABLE "event_records" ADD CONSTRAINT "event_records_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events" ("id");
ALTER TABLE "event_records" ADD CONSTRAINT "event_records_collector_id_fkey" FOREIGN KEY ("collector_id") REFERENCES "collectors" ("id");

