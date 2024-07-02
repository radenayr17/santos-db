-- AlterTable
ALTER TABLE `PORequest` ADD COLUMN `response` VARCHAR(191) NOT NULL DEFAULT 'PENDING',
    ADD COLUMN `responseFile` VARCHAR(191) NULL;

-- CreateTable
CREATE TABLE `PCRHistory` (
    `uuid` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `filename` VARCHAR(191) NOT NULL,
    `action` ENUM('Request', 'Withdrawn', 'Response', 'ChangeStatus') NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `userUuid` VARCHAR(191) NULL,
    `porUuid` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `PCRHistory` ADD CONSTRAINT `PCRHistory_userUuid_fkey` FOREIGN KEY (`userUuid`) REFERENCES `User`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PCRHistory` ADD CONSTRAINT `PCRHistory_porUuid_fkey` FOREIGN KEY (`porUuid`) REFERENCES `PORequest`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;
