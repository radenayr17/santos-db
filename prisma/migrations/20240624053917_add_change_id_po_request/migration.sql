/*
  Warnings:

  - A unique constraint covering the columns `[changeId]` on the table `PORequest` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `changeId` to the `PORequest` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `PORequest` ADD COLUMN `changeId` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `PORequest_changeId_key` ON `PORequest`(`changeId`);
