/*
  Warnings:

  - You are about to alter the column `freightCondition` on the `invoiceline` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Decimal(10,4)`.

*/
UPDATE `InvoiceLine` set `freightCondition` = 0;

ALTER TABLE `InvoiceLine` ADD COLUMN `lineOrderReference` VARCHAR(191) NULL,
    ADD COLUMN `poServiceLineNo` VARCHAR(191) NULL,
    MODIFY `freightCondition` DECIMAL(10, 4) NULL;
