/*
  Warnings:

  - A unique constraint covering the columns `[remitToCode,supplierUuid]` on the table `BankingData` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX `BankingData_accountNumber_supplierUuid_key` ON `BankingData`;

-- AlterTable
ALTER TABLE `AuditLog` ADD COLUMN `supplierUuid` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `Settings` ADD COLUMN `suppliersCanCreateInvoiceInPortal` BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE `Supplier` ADD COLUMN `configCreateInvoice` ENUM('DoNotOverride', 'AllowToCreate', 'DoNotAllowToCreate') NULL;

-- CreateIndex
CREATE UNIQUE INDEX `BankingData_remitToCode_supplierUuid_key` ON `BankingData`(`remitToCode`, `supplierUuid`);

-- AddForeignKey
ALTER TABLE `AuditLog` ADD CONSTRAINT `AuditLog_supplierUuid_fkey` FOREIGN KEY (`supplierUuid`) REFERENCES `Supplier`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;
