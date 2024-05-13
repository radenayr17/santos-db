/*
  Warnings:

  - A unique constraint covering the columns `[invoiceNo,creditNoteNo]` on the table `Invoice` will be added. If there are existing duplicate values, this will fail.
  - Made the column `creditNoteNo` on table `invoice` required. This step will fail if there are existing NULL values in that column.

*/
-- DropIndex
DROP INDEX `Invoice_invoiceNo_key` ON `Invoice`;

-- Update
UPDATE `Invoice` SET `creditNoteNo` = '' WHERE `creditNoteNo` IS NULL;

-- AlterTable
ALTER TABLE `Invoice` MODIFY `creditNoteNo` VARCHAR(191) NOT NULL DEFAULT '';

-- AlterTable
ALTER TABLE `InvoiceLine` MODIFY `itemNo` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Invoice_invoiceNo_creditNoteNo_key` ON `Invoice`(`invoiceNo`, `creditNoteNo`);
