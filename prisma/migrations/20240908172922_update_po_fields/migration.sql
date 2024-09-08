-- AlterTable
ALTER TABLE `POItem` MODIFY `extendedPrice` DECIMAL(65, 30) NULL,
    MODIFY `requisition` INTEGER NULL;

-- AlterTable
ALTER TABLE `POVersionItem` MODIFY `extendedPrice` DECIMAL(65, 30) NULL,
    MODIFY `requisition` INTEGER NULL;
