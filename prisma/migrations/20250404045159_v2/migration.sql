/*
  Warnings:

  - You are about to drop the column `content` on the `Comment` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAT` on the `Comment` table. All the data in the column will be lost.
  - You are about to drop the column `createAt` on the `Like` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAT` on the `Like` table. All the data in the column will be lost.
  - You are about to drop the column `content` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the column `description` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAT` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the column `createdAT` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAT` on the `User` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[userId,postId]` on the table `Like` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `text` to the `Comment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Comment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Post` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Comment" DROP COLUMN "content",
DROP COLUMN "updatedAT",
ADD COLUMN     "text" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Like" DROP COLUMN "createAt",
DROP COLUMN "updatedAT",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "Post" DROP COLUMN "content",
DROP COLUMN "description",
DROP COLUMN "updatedAT",
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "url" TEXT;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "createdAT",
DROP COLUMN "updatedAT",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Like_userId_postId_key" ON "Like"("userId", "postId");
