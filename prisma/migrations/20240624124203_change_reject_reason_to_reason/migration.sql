/*
  Warnings:

  - You are about to drop the column `rejectReason` on the `porequest` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `PORequest` DROP COLUMN `rejectReason`,
    ADD COLUMN `reason` VARCHAR(191) NULL;
