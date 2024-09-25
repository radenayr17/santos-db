-- CreateTable
CREATE TABLE `ReadReceipt` (
    `uuid` VARCHAR(191) NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `lastReadAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `relatedId` VARCHAR(191) NOT NULL,
    `userUuid` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
