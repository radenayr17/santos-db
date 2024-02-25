-- CreateTable
CREATE TABLE `User` (
    `uuid` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `cognitoId` VARCHAR(191) NOT NULL,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `department` VARCHAR(191) NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `phoneNumber` VARCHAR(191) NULL,
    `commentNotifications` BOOLEAN NOT NULL DEFAULT true,
    `emailNotifications` BOOLEAN NOT NULL DEFAULT true,
    `notifSettings` JSON NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `roleUuid` VARCHAR(191) NOT NULL,
    `supplierUuid` VARCHAR(191) NULL,
    `lastLogin` DATETIME(3) NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    UNIQUE INDEX `User_cognitoId_key`(`cognitoId`),
    UNIQUE INDEX `User_username_key`(`username`),
    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Role` (
    `uuid` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `privileges` JSON NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Role_name_key`(`name`),
    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Supplier` (
    `uuid` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `tradingName` VARCHAR(191) NULL,
    `accountNumber` VARCHAR(191) NOT NULL,
    `ABN` VARCHAR(191) NULL,
    `streetAddress` VARCHAR(191) NULL,
    `suburb` VARCHAR(191) NULL,
    `city` VARCHAR(191) NULL,
    `state` VARCHAR(191) NULL,
    `postCode` VARCHAR(191) NULL,
    `countryCode` VARCHAR(191) NULL,
    `country` VARCHAR(191) NULL,
    `postingBlockStatus` BOOLEAN NOT NULL,
    `paymentBlockStatus` BOOLEAN NOT NULL,
    `isActive` BOOLEAN NOT NULL,
    `ACN` VARCHAR(191) NULL,
    `paymentTerms` VARCHAR(191) NULL,
    `POEmail` VARCHAR(191) NULL,
    `remittanceEmail` VARCHAR(191) NULL,
    `generalEmail` VARCHAR(191) NULL,
    `shipping` VARCHAR(191) NULL,
    `taxCountryRegion` VARCHAR(191) NULL,
    `companyCode` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Supplier_accountNumber_key`(`accountNumber`),
    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SupplierAddress` (
    `uuid` VARCHAR(191) NOT NULL,
    `orderingSiteId` VARCHAR(191) NOT NULL,
    `city` VARCHAR(191) NOT NULL,
    `state` VARCHAR(191) NOT NULL,
    `countryCode` VARCHAR(191) NOT NULL,
    `postCode` VARCHAR(191) NOT NULL,
    `streetAddress` VARCHAR(191) NOT NULL,
    `isActive` BOOLEAN NOT NULL,
    `supplierUuid` VARCHAR(191) NULL,

    UNIQUE INDEX `SupplierAddress_orderingSiteId_key`(`orderingSiteId`),
    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BankingData` (
    `uuid` VARCHAR(191) NOT NULL,
    `remitToCode` VARCHAR(191) NOT NULL,
    `BSB` VARCHAR(191) NULL,
    `accountNumber` VARCHAR(191) NOT NULL,
    `accountHolderName` VARCHAR(191) NOT NULL,
    `validToDate` DATETIME(3) NOT NULL,
    `isActive` BOOLEAN NOT NULL,
    `supplierUuid` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `BankingData_accountNumber_supplierUuid_key`(`accountNumber`, `supplierUuid`),
    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Comment` (
    `uuid` VARCHAR(191) NOT NULL,
    `authorUuid` VARCHAR(191) NOT NULL,
    `message` VARCHAR(191) NOT NULL,
    `visibility` VARCHAR(191) NOT NULL DEFAULT 'internal',
    `POUuid` VARCHAR(191) NULL,
    `revision` VARCHAR(191) NULL DEFAULT '',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Attachment` (
    `uuid` VARCHAR(191) NOT NULL,
    `commentUuid` VARCHAR(191) NOT NULL,
    `fileName` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Notification` (
    `uuid` VARCHAR(191) NOT NULL,
    `message` VARCHAR(191) NULL,
    `category` VARCHAR(191) NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `PODocumentUuid` VARCHAR(191) NULL,
    `commentUuid` VARCHAR(191) NULL,
    `fileUuid` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserGotNotification` (
    `uuid` VARCHAR(191) NOT NULL,
    `read` BOOLEAN NOT NULL,
    `notificationUuid` VARCHAR(191) NOT NULL,
    `userUuid` VARCHAR(191) NOT NULL,
    `tagged` BOOLEAN NULL,
    `removed` BOOLEAN NOT NULL DEFAULT false,
    `readAt` DATETIME(3) NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PODocument` (
    `uuid` VARCHAR(191) NOT NULL,
    `orderType` VARCHAR(191) NOT NULL,
    `purchasingEntity` VARCHAR(191) NOT NULL,
    `purchasingPlant` VARCHAR(191) NOT NULL,
    `supplierShipTo` VARCHAR(191) NOT NULL,
    `pickUpInformation` VARCHAR(191) NOT NULL,
    `billToName` VARCHAR(191) NOT NULL,
    `billToEmail` VARCHAR(191) NOT NULL,
    `orderNo` VARCHAR(191) NOT NULL,
    `revision` VARCHAR(191) NOT NULL,
    `PODate` DATETIME(3) NOT NULL,
    `revisionDate` DATETIME(3) NULL,
    `currency` VARCHAR(191) NOT NULL,
    `procurementContact` VARCHAR(191) NOT NULL,
    `requester` VARCHAR(191) NOT NULL,
    `agreementNo` VARCHAR(191) NOT NULL,
    `paymentTerms` DATETIME(3) NULL,
    `incoterms` VARCHAR(191) NOT NULL,
    `additionalInfo` VARCHAR(191) NULL,
    `totalExcludeTax` DECIMAL(65, 30) NOT NULL,
    `supplierAccountNo` VARCHAR(191) NULL,
    `status` VARCHAR(191) NULL DEFAULT 'Unacknowledged',
    `reminder` BOOLEAN NOT NULL DEFAULT false,
    `executionArn` VARCHAR(191) NULL,
    `updatedAt` DATETIME(3) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `PODocument_orderNo_key`(`orderNo`),
    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `POItem` (
    `uuid` VARCHAR(191) NOT NULL,
    `itemNo` INTEGER NOT NULL,
    `materialNumber` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `manufacturersPartNumber` VARCHAR(191) NULL,
    `costElements` JSON NOT NULL,
    `quantity` INTEGER NOT NULL,
    `unit` VARCHAR(191) NOT NULL,
    `unitPrice` DECIMAL(65, 30) NOT NULL,
    `discount` DECIMAL(65, 30) NOT NULL,
    `extendedPrice` DECIMAL(65, 30) NOT NULL,
    `finalDestination` VARCHAR(191) NOT NULL,
    `supplierDueDate` DATETIME(3) NOT NULL,
    `requisition` INTEGER NOT NULL,
    `PODocumentUuid` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `POADocument` (
    `uuid` VARCHAR(191) NOT NULL,
    `orderNo` VARCHAR(191) NOT NULL,
    `revision` VARCHAR(191) NOT NULL,
    `acknowledgeDate` DATETIME(3) NOT NULL,
    `supplierAccountNo` VARCHAR(191) NULL,
    `poDocumentUuid` VARCHAR(191) NULL,
    `rejectReason` VARCHAR(191) NULL,
    `userUuid` VARCHAR(191) NULL,
    `status` VARCHAR(191) NOT NULL DEFAULT 'active',
    `csvResult` VARCHAR(191) NULL DEFAULT '',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `POAItem` (
    `uuid` VARCHAR(191) NOT NULL,
    `itemNo` INTEGER NOT NULL,
    `supplierDueDate` DATETIME(3) NULL,
    `quantity` INTEGER NOT NULL,
    `unitPrice` DECIMAL(65, 30) NOT NULL,
    `unit` VARCHAR(191) NOT NULL,
    `changesReason` VARCHAR(191) NOT NULL,
    `pOADocumentUuid` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Invoice_PODocumet` (
    `uuid` VARCHAR(191) NOT NULL,
    `pOADocumentUuid` VARCHAR(191) NOT NULL,
    `invoiceUuid` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Invoice` (
    `uuid` VARCHAR(191) NOT NULL,
    `invoiceNo` VARCHAR(191) NOT NULL,
    `orderNo` VARCHAR(191) NOT NULL,
    `createdDate` DATETIME(3) NOT NULL,
    `receivedDate` DATETIME(3) NULL,
    `status` VARCHAR(191) NOT NULL,
    `unansweredComments` BOOLEAN NOT NULL,
    `disputeReason` VARCHAR(191) NULL,
    `supplierAccountNumber` VARCHAR(191) NULL,
    `applicableWHT` BOOLEAN NULL,

    UNIQUE INDEX `Invoice_invoiceNo_key`(`invoiceNo`),
    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `InvoiceLine` (
    `uuid` VARCHAR(191) NOT NULL,
    `itemNo` INTEGER NOT NULL,
    `description` VARCHAR(191) NULL,
    `supplierPartNumber` VARCHAR(191) NULL,
    `unit` VARCHAR(191) NULL,
    `netWeight` VARCHAR(191) NULL,
    `priceWeight` VARCHAR(191) NULL,
    `quantity` DECIMAL(65, 30) NULL,
    `total` DECIMAL(65, 30) NULL,
    `poLine` VARCHAR(191) NULL,
    `reviewReason` VARCHAR(191) NULL,
    `serviceTimeSheetLine` VARCHAR(191) NULL,
    `POItemUuid` VARCHAR(191) NULL,
    `invoiceUuid` VARCHAR(191) NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Settings` (
    `uuid` VARCHAR(191) NOT NULL,
    `senderEmail` VARCHAR(191) NOT NULL DEFAULT '',
    `maxRetryCount` INTEGER NOT NULL DEFAULT 3,
    `techSupportEmails` JSON NULL,
    `businessNotifications` JSON NULL,
    `priceTolerance` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `quantityTolerance` INTEGER NOT NULL DEFAULT 0,
    `defaultNotificationsLength` INTEGER NOT NULL DEFAULT 10,
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TableSettings` (
    `uuid` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `table` VARCHAR(191) NOT NULL,
    `viewSettings` JSON NOT NULL,
    `filterSettings` JSON NULL,
    `userUuid` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `POAuditLog` (
    `uuid` VARCHAR(191) NOT NULL,
    `event` VARCHAR(191) NOT NULL,
    `userUuid` VARCHAR(191) NULL,
    `poUuid` VARCHAR(191) NULL,
    `revision` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `POFile` (
    `uuid` VARCHAR(191) NOT NULL,
    `file` VARCHAR(191) NOT NULL,
    `poUuid` VARCHAR(191) NULL,
    `revision` VARCHAR(191) NULL,
    `type` VARCHAR(191) NOT NULL DEFAULT 'xml',
    `poaUuid` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `POVersion` (
    `uuid` VARCHAR(191) NOT NULL,
    `poUuid` VARCHAR(191) NOT NULL,
    `orderType` VARCHAR(191) NOT NULL,
    `purchasingEntity` VARCHAR(191) NOT NULL,
    `purchasingPlant` VARCHAR(191) NOT NULL,
    `supplierShipTo` VARCHAR(191) NOT NULL,
    `pickUpInformation` VARCHAR(191) NOT NULL,
    `billToName` VARCHAR(191) NOT NULL,
    `billToEmail` VARCHAR(191) NOT NULL,
    `orderNo` VARCHAR(191) NOT NULL,
    `revision` VARCHAR(191) NOT NULL,
    `PODate` DATETIME(3) NOT NULL,
    `revisionDate` DATETIME(3) NULL,
    `currency` VARCHAR(191) NOT NULL,
    `procurementContact` VARCHAR(191) NOT NULL,
    `requester` VARCHAR(191) NOT NULL,
    `agreementNo` VARCHAR(191) NOT NULL,
    `paymentTerms` DATETIME(3) NULL,
    `incoterms` VARCHAR(191) NOT NULL,
    `additionalInfo` VARCHAR(191) NULL,
    `totalExcludeTax` DECIMAL(65, 30) NOT NULL,
    `supplierAccountNo` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `POVersionItem` (
    `uuid` VARCHAR(191) NOT NULL,
    `poVersionUuid` VARCHAR(191) NOT NULL,
    `itemNo` INTEGER NOT NULL,
    `materialNumber` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `manufacturersPartNumber` VARCHAR(191) NULL,
    `costElements` JSON NOT NULL,
    `quantity` INTEGER NOT NULL,
    `unit` VARCHAR(191) NOT NULL,
    `unitPrice` DECIMAL(65, 30) NOT NULL,
    `discount` DECIMAL(65, 30) NOT NULL,
    `extendedPrice` DECIMAL(65, 30) NOT NULL,
    `finalDestination` VARCHAR(191) NOT NULL,
    `supplierDueDate` DATETIME(3) NOT NULL,
    `requisition` INTEGER NOT NULL,

    PRIMARY KEY (`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_supplierUuid_fkey` FOREIGN KEY (`supplierUuid`) REFERENCES `Supplier`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_roleUuid_fkey` FOREIGN KEY (`roleUuid`) REFERENCES `Role`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SupplierAddress` ADD CONSTRAINT `SupplierAddress_supplierUuid_fkey` FOREIGN KEY (`supplierUuid`) REFERENCES `Supplier`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BankingData` ADD CONSTRAINT `BankingData_supplierUuid_fkey` FOREIGN KEY (`supplierUuid`) REFERENCES `Supplier`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Comment` ADD CONSTRAINT `Comment_authorUuid_fkey` FOREIGN KEY (`authorUuid`) REFERENCES `User`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Comment` ADD CONSTRAINT `Comment_POUuid_fkey` FOREIGN KEY (`POUuid`) REFERENCES `PODocument`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Attachment` ADD CONSTRAINT `Attachment_commentUuid_fkey` FOREIGN KEY (`commentUuid`) REFERENCES `Comment`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_commentUuid_fkey` FOREIGN KEY (`commentUuid`) REFERENCES `Comment`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_PODocumentUuid_fkey` FOREIGN KEY (`PODocumentUuid`) REFERENCES `PODocument`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_fileUuid_fkey` FOREIGN KEY (`fileUuid`) REFERENCES `POFile`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserGotNotification` ADD CONSTRAINT `UserGotNotification_notificationUuid_fkey` FOREIGN KEY (`notificationUuid`) REFERENCES `Notification`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserGotNotification` ADD CONSTRAINT `UserGotNotification_userUuid_fkey` FOREIGN KEY (`userUuid`) REFERENCES `User`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PODocument` ADD CONSTRAINT `PODocument_supplierAccountNo_fkey` FOREIGN KEY (`supplierAccountNo`) REFERENCES `Supplier`(`accountNumber`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `POItem` ADD CONSTRAINT `POItem_PODocumentUuid_fkey` FOREIGN KEY (`PODocumentUuid`) REFERENCES `PODocument`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `POADocument` ADD CONSTRAINT `POADocument_poDocumentUuid_fkey` FOREIGN KEY (`poDocumentUuid`) REFERENCES `PODocument`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `POADocument` ADD CONSTRAINT `POADocument_userUuid_fkey` FOREIGN KEY (`userUuid`) REFERENCES `User`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `POADocument` ADD CONSTRAINT `POADocument_supplierAccountNo_fkey` FOREIGN KEY (`supplierAccountNo`) REFERENCES `Supplier`(`accountNumber`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `POAItem` ADD CONSTRAINT `POAItem_pOADocumentUuid_fkey` FOREIGN KEY (`pOADocumentUuid`) REFERENCES `POADocument`(`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Invoice_PODocumet` ADD CONSTRAINT `Invoice_PODocumet_pOADocumentUuid_fkey` FOREIGN KEY (`pOADocumentUuid`) REFERENCES `POADocument`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Invoice_PODocumet` ADD CONSTRAINT `Invoice_PODocumet_invoiceUuid_fkey` FOREIGN KEY (`invoiceUuid`) REFERENCES `Invoice`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Invoice` ADD CONSTRAINT `Invoice_supplierAccountNumber_fkey` FOREIGN KEY (`supplierAccountNumber`) REFERENCES `Supplier`(`accountNumber`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InvoiceLine` ADD CONSTRAINT `InvoiceLine_POItemUuid_fkey` FOREIGN KEY (`POItemUuid`) REFERENCES `POItem`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InvoiceLine` ADD CONSTRAINT `InvoiceLine_invoiceUuid_fkey` FOREIGN KEY (`invoiceUuid`) REFERENCES `Invoice`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TableSettings` ADD CONSTRAINT `TableSettings_userUuid_fkey` FOREIGN KEY (`userUuid`) REFERENCES `User`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `POAuditLog` ADD CONSTRAINT `POAuditLog_userUuid_fkey` FOREIGN KEY (`userUuid`) REFERENCES `User`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `POAuditLog` ADD CONSTRAINT `POAuditLog_poUuid_fkey` FOREIGN KEY (`poUuid`) REFERENCES `PODocument`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `POFile` ADD CONSTRAINT `POFile_poUuid_fkey` FOREIGN KEY (`poUuid`) REFERENCES `PODocument`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `POFile` ADD CONSTRAINT `POFile_poaUuid_fkey` FOREIGN KEY (`poaUuid`) REFERENCES `POADocument`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `POVersion` ADD CONSTRAINT `POVersion_supplierAccountNo_fkey` FOREIGN KEY (`supplierAccountNo`) REFERENCES `Supplier`(`accountNumber`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `POVersion` ADD CONSTRAINT `POVersion_poUuid_fkey` FOREIGN KEY (`poUuid`) REFERENCES `PODocument`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `POVersionItem` ADD CONSTRAINT `POVersionItem_poVersionUuid_fkey` FOREIGN KEY (`poVersionUuid`) REFERENCES `POVersion`(`uuid`) ON DELETE RESTRICT ON UPDATE CASCADE;
