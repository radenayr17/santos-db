-- DropForeignKey
ALTER TABLE `PORItem` DROP FOREIGN KEY `PORItem_poItemUuid_fkey`;

-- AddForeignKey
ALTER TABLE `PORItem` ADD CONSTRAINT `PORItem_poItemUuid_fkey` FOREIGN KEY (`poItemUuid`) REFERENCES `POItem`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;
