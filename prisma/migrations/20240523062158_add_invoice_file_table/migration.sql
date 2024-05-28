-- CreateTable
CREATE TABLE `InvoiceFile` (
    `uuid` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `mimeType` VARCHAR(191) NOT NULL,
    `bucket` VARCHAR(191) NOT NULL,
    `key` VARCHAR(191) NOT NULL,
    `invoiceUuid` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `InvoiceFile` ADD CONSTRAINT `InvoiceFile_invoiceUuid_fkey` FOREIGN KEY (`invoiceUuid`) REFERENCES `Invoice`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;
