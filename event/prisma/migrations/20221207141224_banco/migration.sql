/*
  Warnings:

  - Made the column `close_date` on table `event_records` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "event_records" DROP CONSTRAINT "event_records_collector_id_fkey";

-- DropForeignKey
ALTER TABLE "event_records" DROP CONSTRAINT "event_records_event_id_fkey";


