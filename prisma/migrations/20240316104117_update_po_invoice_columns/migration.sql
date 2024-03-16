-- AlterTable
ALTER TABLE `Invoice` ADD COLUMN `exportedBy` VARCHAR(191) NULL,
    ADD COLUMN `exportedDate` BOOLEAN NULL,
    ADD COLUMN `paymentDate` DATETIME(3) NULL;

-- AlterTable
ALTER TABLE `PODocument` MODIFY `paymentTerms` VARCHAR(191) NULL;
