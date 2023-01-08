-- CreateTable
CREATE TABLE "collectors" (
    "id" TEXT NOT NULL,
    "latitude" INTEGER NOT NULL,
    "longitude" INTEGER NOT NULL,
    "address" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'A',

    CONSTRAINT "collectors_pkey" PRIMARY KEY ("id")
);

-- AlterTable
ALTER TABLE "collectors" ALTER COLUMN "status" SET DEFAULT 'A';


