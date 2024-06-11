-- CreateTable
CREATE TABLE `APMessage` (
    `uuid` VARCHAR(191) NOT NULL,
    `messageId` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `attachments` VARCHAR(191) NOT NULL,
    `subject` VARCHAR(191) NOT NULL,
    `sender` VARCHAR(191) NOT NULL,
    `code` VARCHAR(191) NOT NULL,
    `account` VARCHAR(191) NOT NULL,
    `receivedDate` DATETIME(3) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `APMessage_messageId_key`(`messageId`),
    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
