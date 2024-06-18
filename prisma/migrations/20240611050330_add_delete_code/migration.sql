-- AlterTable
ALTER TABLE `PODocument` ADD COLUMN `deleteCode` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `POVersion` ADD COLUMN `deleteCode` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `User` ADD COLUMN `firstLogin` DATETIME(3) NULL;
