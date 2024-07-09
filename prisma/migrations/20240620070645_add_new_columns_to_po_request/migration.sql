/*
  Warnings:

  - Added the required column `action` to the `PORequest` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `PORequest` ADD COLUMN `action` VARCHAR(191) NOT NULL,
    ADD COLUMN `rejectReason` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `PORItem` ADD COLUMN `dueDate` DATETIME(3) NULL;
