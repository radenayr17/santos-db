/*
  Warnings:

  - Added the required column `revision` to the `PORequest` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `POAuditLog` ADD COLUMN `description` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `PORequest` ADD COLUMN `revision` VARCHAR(191) NOT NULL;
