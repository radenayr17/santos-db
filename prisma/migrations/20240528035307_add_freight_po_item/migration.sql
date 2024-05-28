-- AlterTable
ALTER TABLE `POItem` ADD COLUMN `freight` DECIMAL(10, 4) NULL;

-- AlterTable
ALTER TABLE `POVersionItem` ADD COLUMN `freight` DECIMAL(10, 4) NULL;
