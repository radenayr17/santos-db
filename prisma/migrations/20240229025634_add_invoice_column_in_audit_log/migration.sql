-- AlterTable
ALTER TABLE `POAuditLog` ADD COLUMN `invoiceUuid` VARCHAR(191) NULL;

-- AddForeignKey
ALTER TABLE `POAuditLog` ADD CONSTRAINT `POAuditLog_invoiceUuid_fkey` FOREIGN KEY (`invoiceUuid`) REFERENCES `Invoice`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;
