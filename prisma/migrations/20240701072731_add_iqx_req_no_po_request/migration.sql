-- AlterTable
ALTER TABLE `Invoice` ADD COLUMN `amount` DECIMAL(65, 30) NULL,
    ADD COLUMN `billingDocType` VARCHAR(191) NULL,
    ADD COLUMN `plantDescription` VARCHAR(191) NULL,
    ADD COLUMN `plantId` VARCHAR(191) NULL,
    ADD COLUMN `submittedDate` DATETIME(3) NULL,
    ADD COLUMN `supplierId` VARCHAR(191) NULL,
    ADD COLUMN `supplierInvoiceNo` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `PORequest` ADD COLUMN `iqxReqNo` VARCHAR(191) NULL,
    ADD COLUMN `lastUpdate` DATETIME(3) NULL;
