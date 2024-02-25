/*
  Warnings:

  - You are about to drop the column `supplierAccountNumber` on the `invoice` table. All the data in the column will be lost.
  - You are about to drop the `invoice_podocumet` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[poUuid]` on the table `Invoice` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `currency` to the `Invoice` table without a default value. This is not possible if the table is not empty.
  - Added the required column `netTotal` to the `Invoice` table without a default value. This is not possible if the table is not empty.
  - Added the required column `taxCode` to the `Invoice` table without a default value. This is not possible if the table is not empty.
  - Added the required column `total` to the `Invoice` table without a default value. This is not possible if the table is not empty.
  - Added the required column `totalTax` to the `Invoice` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Invoice` table without a default value. This is not possible if the table is not empty.
  - Added the required column `price` to the `InvoiceLine` table without a default value. This is not possible if the table is not empty.
  - Added the required column `taxValue` to the `InvoiceLine` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Invoice` DROP FOREIGN KEY `Invoice_supplierAccountNumber_fkey`;

-- DropForeignKey
ALTER TABLE `Invoice_PODocumet` DROP FOREIGN KEY `Invoice_PODocumet_invoiceUuid_fkey`;

-- DropForeignKey
ALTER TABLE `Invoice_PODocumet` DROP FOREIGN KEY `Invoice_PODocumet_pOADocumentUuid_fkey`;

-- AlterTable
ALTER TABLE `Invoice` DROP COLUMN `supplierAccountNumber`,
    ADD COLUMN `addCharges` DECIMAL(65, 30) NULL,
    ADD COLUMN `addChargesCurrency` VARCHAR(191) NULL,
    ADD COLUMN `addChargesTax` DECIMAL(65, 30) NULL,
    ADD COLUMN `channel` VARCHAR(191) NULL,
    ADD COLUMN `costProvided` BOOLEAN NULL,
    ADD COLUMN `currency` VARCHAR(191) NOT NULL,
    ADD COLUMN `freight` VARCHAR(191) NULL,
    ADD COLUMN `freightCurrency` VARCHAR(191) NULL,
    ADD COLUMN `freightTax` VARCHAR(191) NULL,
    ADD COLUMN `freightTaxCode` VARCHAR(191) NULL,
    ADD COLUMN `invoiceDate` DATETIME(3) NULL,
    ADD COLUMN `netTotal` DECIMAL(65, 30) NOT NULL,
    ADD COLUMN `orgInvDate` DATETIME(3) NULL,
    ADD COLUMN `orgInvNo` VARCHAR(191) NULL,
    ADD COLUMN `poUuid` VARCHAR(191) NULL,
    ADD COLUMN `remitToCode` VARCHAR(191) NULL,
    ADD COLUMN `sesProvided` BOOLEAN NULL,
    ADD COLUMN `settlementDate` DATETIME(3) NULL,
    ADD COLUMN `submittedby` VARCHAR(191) NULL,
    ADD COLUMN `taxCode` VARCHAR(191) NOT NULL,
    ADD COLUMN `total` DECIMAL(65, 30) NOT NULL,
    ADD COLUMN `totalTax` DECIMAL(65, 30) NOT NULL,
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL,
    ADD COLUMN `vendorNo` VARCHAR(191) NULL,
    ADD COLUMN `whtAmount` DECIMAL(65, 30) NULL,
    ADD COLUMN `whtBase` DECIMAL(65, 30) NULL,
    ADD COLUMN `whtCountry` VARCHAR(191) NULL,
    ADD COLUMN `whtTaxCode` VARCHAR(191) NULL,
    ADD COLUMN `whtTaxCodeDesc` VARCHAR(191) NULL,
    ADD COLUMN `whtTaxType` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `InvoiceLine` ADD COLUMN `imrNo` VARCHAR(191) NULL,
    ADD COLUMN `price` DECIMAL(65, 30) NOT NULL,
    ADD COLUMN `taxCode` VARCHAR(191) NULL,
    ADD COLUMN `taxValue` DECIMAL(65, 30) NOT NULL;

-- DropTable
DROP TABLE `Invoice_PODocumet`;

-- CreateIndex
CREATE UNIQUE INDEX `Invoice_poUuid_key` ON `Invoice`(`poUuid`);

-- AddForeignKey
ALTER TABLE `Invoice` ADD CONSTRAINT `Invoice_poUuid_fkey` FOREIGN KEY (`poUuid`) REFERENCES `PODocument`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;
