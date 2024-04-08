-- AlterTable
ALTER TABLE `Invoice` ADD COLUMN `createdFrom` VARCHAR(191) NULL,
    ADD COLUMN `meta` JSON NULL;

-- AlterTable
ALTER TABLE `InvoiceLine` ADD COLUMN `meta` JSON NULL;
