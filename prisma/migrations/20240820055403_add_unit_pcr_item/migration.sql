-- AlterTable
ALTER TABLE `PODocument` ADD COLUMN `procurementDetail` JSON NULL;

-- AlterTable
ALTER TABLE `PORItem` ADD COLUMN `unit` VARCHAR(191) NOT NULL DEFAULT '';

-- AlterTable
ALTER TABLE `POVersion` ADD COLUMN `procurementDetail` JSON NULL;
