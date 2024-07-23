-- AddForeignKey
ALTER TABLE `APMessage` ADD CONSTRAINT `APMessage_code_fkey` FOREIGN KEY (`code`) REFERENCES `Supplier`(`accountNumber`) ON DELETE RESTRICT ON UPDATE CASCADE;
