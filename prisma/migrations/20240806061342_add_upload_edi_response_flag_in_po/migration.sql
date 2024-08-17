-- AlterTable
ALTER TABLE `PODocument` ADD COLUMN `uploadEdiResponse` VARCHAR(191) NULL DEFAULT '';

-- AlterTable
ALTER TABLE `POVersion` ADD COLUMN `uploadEdiResponse` VARCHAR(191) NULL DEFAULT '';
