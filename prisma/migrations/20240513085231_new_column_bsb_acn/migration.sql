/*
  Warnings:

  - Made the column `remitToCode` on table `invoice` required. This step will fail if there are existing NULL values in that column.

*/
-- Modify Records
UPDATE `Invoice` set `remitToCode` = '' WHERE `remitToCode` IS NULL;

ALTER TABLE `Invoice` ADD COLUMN `acn` VARCHAR(191) NOT NULL DEFAULT '',
    ADD COLUMN `bsb` VARCHAR(191) NOT NULL DEFAULT '',
    MODIFY `remitToCode` VARCHAR(191) NOT NULL DEFAULT '';
