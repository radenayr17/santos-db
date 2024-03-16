/*
  Warnings:

  - You are about to drop the column `exportedDate` on the `Invoice` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `Invoice` DROP COLUMN `exportedDate`,
    ADD COLUMN `exported` BOOLEAN NULL DEFAULT false;
