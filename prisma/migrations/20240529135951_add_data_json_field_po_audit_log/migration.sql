/*
  Warnings:

  - You are about to drop the column `dueDate` on the `invoice` table. All the data in the column will be lost.
  - You are about to drop the column `iqxRequest` on the `invoice` table. All the data in the column will be lost.
  - You are about to drop the column `remitDate` on the `invoice` table. All the data in the column will be lost.
  - You are about to drop the column `remitNo` on the `invoice` table. All the data in the column will be lost.
  - You are about to drop the column `remitStatus` on the `invoice` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `Invoice` DROP COLUMN `dueDate`,
    DROP COLUMN `iqxRequest`,
    DROP COLUMN `remitDate`,
    DROP COLUMN `remitNo`,
    DROP COLUMN `remitStatus`;

-- AlterTable
ALTER TABLE `POAuditLog` ADD COLUMN `data` JSON NULL;
