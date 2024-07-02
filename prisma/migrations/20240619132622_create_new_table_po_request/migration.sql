-- DropForeignKey
ALTER TABLE `APMessage` DROP FOREIGN KEY `APMessage_code_fkey`;

-- AlterTable
ALTER TABLE `APMessage` MODIFY `code` VARCHAR(191) NULL;

-- CreateTable
CREATE TABLE `PORequest` (
    `uuid` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL DEFAULT 'PENDING',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `poUuid` VARCHAR(191) NOT NULL,
    `createdBy` VARCHAR(191) NOT NULL,
    `updatedBy` VARCHAR(191) NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PORItem` (
    `uuid` VARCHAR(191) NOT NULL,
    `price` DECIMAL(10, 4) NOT NULL,
    `quantity` DECIMAL(10, 4) NOT NULL,
    `deleted` BOOLEAN NOT NULL DEFAULT false,
    `deliveryCompleted` BOOLEAN NULL DEFAULT false,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `porUuid` VARCHAR(191) NOT NULL,
    `poItemUuid` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `APMessage` ADD CONSTRAINT `APMessage_code_fkey` FOREIGN KEY (`code`) REFERENCES `Supplier`(`accountNumber`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PORequest` ADD CONSTRAINT `PORequest_poUuid_fkey` FOREIGN KEY (`poUuid`) REFERENCES `PODocument`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PORequest` ADD CONSTRAINT `PORequest_createdBy_fkey` FOREIGN KEY (`createdBy`) REFERENCES `User`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PORequest` ADD CONSTRAINT `PORequest_updatedBy_fkey` FOREIGN KEY (`updatedBy`) REFERENCES `User`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PORItem` ADD CONSTRAINT `PORItem_porUuid_fkey` FOREIGN KEY (`porUuid`) REFERENCES `PORequest`(`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PORItem` ADD CONSTRAINT `PORItem_poItemUuid_fkey` FOREIGN KEY (`poItemUuid`) REFERENCES `POItem`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;
