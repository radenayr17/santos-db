-- AlterTable
ALTER TABLE `PODocument` ADD COLUMN `pfsTick` BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE `POVersion` ADD COLUMN `pfsTick` BOOLEAN NOT NULL DEFAULT false;

-- CreateTable
CREATE TABLE `EmailWhitelist` (
    `uuid` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `EmailWhitelist_email_key`(`email`),
    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EmailWhitelistAuditLog` (
    `uuid` VARCHAR(191) NOT NULL,
    `event` VARCHAR(191) NOT NULL,
    `userUuid` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `EmailWhitelistAuditLog` ADD CONSTRAINT `EmailWhitelistAuditLog_userUuid_fkey` FOREIGN KEY (`userUuid`) REFERENCES `User`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;
