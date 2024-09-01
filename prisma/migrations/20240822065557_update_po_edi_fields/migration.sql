/*
  Warnings:

  - You are about to drop the column `uploadEdiResponse` on the `PODocument` table. All the data in the column will be lost.
  - You are about to drop the column `uploadEdiResponse` on the `POVersion` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `PODocument` DROP COLUMN `uploadEdiResponse`,
    ADD COLUMN `ediUploadResponse` VARCHAR(191) NULL DEFAULT '',
    ADD COLUMN `ediUploadStatus` VARCHAR(191) NULL DEFAULT '';

-- AlterTable
ALTER TABLE `POVersion` DROP COLUMN `uploadEdiResponse`,
    ADD COLUMN `ediUploadResponse` VARCHAR(191) NULL DEFAULT '',
    ADD COLUMN `ediUploadStatus` VARCHAR(191) NULL DEFAULT '';

-- AlterTable
ALTER TABLE `Settings` ADD COLUMN `exportPORetryCount` INTEGER NOT NULL DEFAULT 3;
