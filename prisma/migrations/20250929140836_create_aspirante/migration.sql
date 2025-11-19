-- CreateTable
CREATE TABLE `Aspirante` (
    `idASPIRANTE` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre_completo` VARCHAR(50) NOT NULL,
    `correo` VARCHAR(50) NOT NULL,
    `telefono` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`idASPIRANTE`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
