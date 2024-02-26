-- AlterTable
ALTER TABLE `Comment` ADD COLUMN `invoiceUuid` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `Invoice` MODIFY `unansweredComments` BOOLEAN NULL;

-- AddForeignKey
ALTER TABLE `Comment` ADD CONSTRAINT `Comment_invoiceUuid_fkey` FOREIGN KEY (`invoiceUuid`) REFERENCES `Invoice`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;
