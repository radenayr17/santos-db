-- DropForeignKey
ALTER TABLE `Comment` DROP FOREIGN KEY `Comment_authorUuid_fkey`;

-- AlterTable
ALTER TABLE `Comment` ADD COLUMN `externalAuthor` VARCHAR(191) NULL,
    MODIFY `authorUuid` VARCHAR(191) NULL;

-- AddForeignKey
ALTER TABLE `Comment` ADD CONSTRAINT `Comment_authorUuid_fkey` FOREIGN KEY (`authorUuid`) REFERENCES `User`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Invoice` ADD CONSTRAINT `Invoice_supplierId_fkey` FOREIGN KEY (`supplierId`) REFERENCES `Supplier`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;
