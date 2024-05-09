/*
  Warnings:

  - Added the required column `poEmail` to the `SupplierAddress` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `PODocument` ADD COLUMN `supplierReference` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `POItem` ADD COLUMN `supplierReference` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `POVersion` ADD COLUMN `supplierReference` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `POVersionItem` ADD COLUMN `supplierReference` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `SupplierAddress` ADD COLUMN `poEmail` VARCHAR(191) NOT NULL;
