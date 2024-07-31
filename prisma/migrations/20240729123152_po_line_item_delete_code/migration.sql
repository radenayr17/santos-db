-- AlterTable
ALTER TABLE `POItem` ADD COLUMN `deleteCode` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `POVersionItem` ADD COLUMN `deleteCode` VARCHAR(191) NULL;
