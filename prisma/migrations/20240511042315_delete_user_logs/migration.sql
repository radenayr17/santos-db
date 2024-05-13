-- AlterTable
ALTER TABLE `User` ADD COLUMN `deletedAt` DATETIME(3) NULL,
    ADD COLUMN `isDeleted` BOOLEAN NOT NULL DEFAULT false;

-- CreateTable
CREATE TABLE `AuditLog` (
    `uuid` VARCHAR(191) NOT NULL,
    `model` VARCHAR(191) NOT NULL,
    `event` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `userUuid` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `AuditLog` ADD CONSTRAINT `AuditLog_userUuid_fkey` FOREIGN KEY (`userUuid`) REFERENCES `User`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;
