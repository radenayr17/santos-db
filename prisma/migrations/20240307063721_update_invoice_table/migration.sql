-- AlterTable
ALTER TABLE `Invoice` ADD COLUMN `type` VARCHAR(191) NOT NULL DEFAULT 'invoice',
    ADD COLUMN `updatedByUuid` VARCHAR(191) NULL;

-- AddForeignKey
ALTER TABLE `Invoice` ADD CONSTRAINT `Invoice_updatedByUuid_fkey` FOREIGN KEY (`updatedByUuid`) REFERENCES `User`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;
