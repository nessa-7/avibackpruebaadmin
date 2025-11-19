/*
  Warnings:

  - The primary key for the `aspirante` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `idAMBIENTE` on the `aspirante` table. All the data in the column will be lost.
  - The primary key for the `preguntas` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `preguntas` table. All the data in the column will be lost.
  - The primary key for the `respuestas` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `respuestas` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[ambienteId]` on the table `Programa_de_formacion` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[TEST_idTEST]` on the table `REPORTE` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `centroId` to the `AMBIENTE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `reporteId` to the `Area` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idASPIRANTE` to the `Aspirante` table without a default value. This is not possible if the table is not empty.
  - Added the required column `redesid` to the `CATEGORIA` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idPREGUNTAS` to the `preguntas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `testId` to the `preguntas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ambienteId` to the `Programa_de_formacion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `areaId` to the `Programa_de_formacion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `categoriaId` to the `Programa_de_formacion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `aspiranteId` to the `REPORTE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idRESPUESTAS` to the `respuestas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `preguntaId` to the `respuestas` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `ambiente` ADD COLUMN `centroId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `area` ADD COLUMN `reporteId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `aspirante` DROP PRIMARY KEY,
    DROP COLUMN `idAMBIENTE`,
    ADD COLUMN `idASPIRANTE` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`idASPIRANTE`);

-- AlterTable
ALTER TABLE `categoria` ADD COLUMN `redesid` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `preguntas` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    ADD COLUMN `idPREGUNTAS` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `testId` INTEGER NOT NULL,
    ADD PRIMARY KEY (`idPREGUNTAS`);

-- AlterTable
ALTER TABLE `programa_de_formacion` ADD COLUMN `ambienteId` INTEGER NOT NULL,
    ADD COLUMN `areaId` INTEGER NOT NULL,
    ADD COLUMN `categoriaId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `reporte` ADD COLUMN `aspiranteId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `respuestas` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    ADD COLUMN `idRESPUESTAS` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `preguntaId` INTEGER NOT NULL,
    ADD PRIMARY KEY (`idRESPUESTAS`);

-- CreateIndex
CREATE UNIQUE INDEX `Programa_de_formacion_ambienteId_key` ON `Programa_de_formacion`(`ambienteId`);

-- CreateIndex
CREATE UNIQUE INDEX `REPORTE_TEST_idTEST_key` ON `REPORTE`(`TEST_idTEST`);

-- AddForeignKey
ALTER TABLE `Programa_de_formacion` ADD CONSTRAINT `Programa_de_formacion_categoriaId_fkey` FOREIGN KEY (`categoriaId`) REFERENCES `CATEGORIA`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Programa_de_formacion` ADD CONSTRAINT `Programa_de_formacion_ambienteId_fkey` FOREIGN KEY (`ambienteId`) REFERENCES `AMBIENTE`(`idAMBIENTE`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Programa_de_formacion` ADD CONSTRAINT `Programa_de_formacion_areaId_fkey` FOREIGN KEY (`areaId`) REFERENCES `Area`(`id_area`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Area` ADD CONSTRAINT `Area_reporteId_fkey` FOREIGN KEY (`reporteId`) REFERENCES `REPORTE`(`idREPORTE`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AMBIENTE` ADD CONSTRAINT `AMBIENTE_centroId_fkey` FOREIGN KEY (`centroId`) REFERENCES `CENTRO`(`idCENTRO`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CATEGORIA` ADD CONSTRAINT `CATEGORIA_redesid_fkey` FOREIGN KEY (`redesid`) REFERENCES `Redes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `REPORTE` ADD CONSTRAINT `REPORTE_TEST_idTEST_fkey` FOREIGN KEY (`TEST_idTEST`) REFERENCES `TEST`(`idTEST`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `REPORTE` ADD CONSTRAINT `REPORTE_aspiranteId_fkey` FOREIGN KEY (`aspiranteId`) REFERENCES `Aspirante`(`idASPIRANTE`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `preguntas` ADD CONSTRAINT `preguntas_testId_fkey` FOREIGN KEY (`testId`) REFERENCES `TEST`(`idTEST`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `respuestas` ADD CONSTRAINT `respuestas_preguntaId_fkey` FOREIGN KEY (`preguntaId`) REFERENCES `preguntas`(`idPREGUNTAS`) ON DELETE RESTRICT ON UPDATE CASCADE;
