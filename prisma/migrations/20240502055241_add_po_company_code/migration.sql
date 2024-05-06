-- AlterTable
ALTER TABLE `PODocument` ADD COLUMN `companyCode` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `POVersion` ADD COLUMN `companyCode` VARCHAR(191) NULL;
