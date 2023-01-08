-- CreateTable
CREATE TABLE "stores" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "latitude" INTEGER NOT NULL,
    "longitude" INTEGER NOT NULL,    
    "active" BOOLEAN NOT NULL,

    CONSTRAINT "stores_pkey" PRIMARY KEY ("id")
);

-- AlterTable
ALTER TABLE "stores" ALTER COLUMN "active" SET DEFAULT true;

