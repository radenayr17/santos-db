/*
  Warnings:

  - A unique constraint covering the columns `[invoiceAPId]` on the table `Invoice` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `invoiceAPId` to the `Invoice` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Invoice` ADD COLUMN `invoiceAPId` VARCHAR(191) NOT NULL;

UPDATE `Invoice` SET `invoiceAPId` = `uuid`;

-- CreateIndex
CREATE UNIQUE INDEX `Invoice_invoiceAPId_key` ON `Invoice`(`invoiceAPId`);
