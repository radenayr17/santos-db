-- AlterTable
ALTER TABLE `Notification` ADD COLUMN `invoiceUuid` VARCHAR(191) NULL;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_invoiceUuid_fkey` FOREIGN KEY (`invoiceUuid`) REFERENCES `Invoice`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;
