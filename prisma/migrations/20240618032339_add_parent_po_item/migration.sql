-- AlterTable
ALTER TABLE `POItem` ADD COLUMN `parentPoItemUuid` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `POVersionItem` ADD COLUMN `parentPoVersionItemUuid` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `Settings` ADD COLUMN `masterVendorEmail` VARCHAR(191) NOT NULL DEFAULT 'vendor.records@santos.com';

-- AddForeignKey
ALTER TABLE `POItem` ADD CONSTRAINT `POItem_parentPoItemUuid_fkey` FOREIGN KEY (`parentPoItemUuid`) REFERENCES `POItem`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `POVersionItem` ADD CONSTRAINT `POVersionItem_parentPoVersionItemUuid_fkey` FOREIGN KEY (`parentPoVersionItemUuid`) REFERENCES `POVersionItem`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;
