-- AlterTable
ALTER TABLE `Invoice` ADD COLUMN `dueDate` DATETIME(3) NULL,
    ADD COLUMN `iqxRequestNo` VARCHAR(191) NULL,
    ADD COLUMN `lastUpdateDate` DATETIME(3) NULL,
    ADD COLUMN `rejectComment` VARCHAR(191) NULL,
    ADD COLUMN `remitAmount` DECIMAL(65, 30) NULL,
    ADD COLUMN `sapBillingNo` VARCHAR(191) NULL;
