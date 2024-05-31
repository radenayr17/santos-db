-- AlterTable
ALTER TABLE `invoice` ADD COLUMN `remitDate` DATETIME(3) NULL,
    ADD COLUMN `remitNo` VARCHAR(191) NULL,
    ADD COLUMN `remitStatus` VARCHAR(191) NULL;
