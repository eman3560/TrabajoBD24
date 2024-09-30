-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.5.2-MariaDB-ubu2404 - mariadb.org binary distribution
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para pat24
CREATE DATABASE IF NOT EXISTS `pat24` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `pat24`;

-- Volcando estructura para tabla pat24.automotor_marca_descrip
CREATE TABLE IF NOT EXISTS `automotor_marca_descrip` (
  `cod_marca_desc` smallint(6) NOT NULL AUTO_INCREMENT,
  `marca_cod` varchar(4) DEFAULT NULL,
  `marca_desc` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_marca_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla pat24.automotor_modelo_descrip
CREATE TABLE IF NOT EXISTS `automotor_modelo_descrip` (
  `cod_modelo_desc` smallint(6) NOT NULL AUTO_INCREMENT,
  `modelo_cod` varchar(4) DEFAULT NULL,
  `modelo_desc` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_modelo_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=1209 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla pat24.automotor_tipo_descrip
CREATE TABLE IF NOT EXISTS `automotor_tipo_descrip` (
  `cod_tipo_desc` tinyint(4) NOT NULL AUTO_INCREMENT,
  `tipo_cod` varchar(2) DEFAULT NULL,
  `tipo_desc` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_tipo_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla pat24.base
CREATE TABLE IF NOT EXISTS `base` (
  `base_cod` mediumint(9) NOT NULL AUTO_INCREMENT,
  `tramite_tipo` varchar(60) DEFAULT NULL,
  `tramite_fecha` date DEFAULT NULL,
  `fecha_inscripcion_inicial` date DEFAULT NULL,
  `registro_seccional_codigo` varchar(5) DEFAULT NULL,
  `registro_seccional_descripcion` varchar(50) DEFAULT NULL,
  `registro_seccional_provincia` tinyint(4) DEFAULT NULL,
  `automotor_origen` varchar(12) DEFAULT NULL,
  `automotor_anio_modelo` varchar(5) DEFAULT NULL,
  `automotor_tipo_codigo` tinyint(4) DEFAULT NULL,
  `automotor_marca_codigo` smallint(6) DEFAULT NULL,
  `automotor_modelo_codigo` smallint(6) DEFAULT NULL,
  `automotor_uso_codigo` varchar(1) DEFAULT NULL,
  `automotor_uso_descripcion` varchar(7) DEFAULT NULL,
  `titular_tipo_persona` varchar(9) DEFAULT NULL,
  `titular_domicilio_localidad` varchar(42) DEFAULT NULL,
  `titular_domicilio_provincia` tinyint(4) DEFAULT NULL,
  `titular_genero` tinyint(4) DEFAULT NULL,
  `titular_anio_nacimiento` varchar(5) DEFAULT NULL,
  `titular_pais_nacimiento` varchar(20) DEFAULT NULL,
  `titular_porcentaje_titularidad` varchar(3) DEFAULT NULL,
  `titular_domicilio_provincia_id` varchar(2) DEFAULT NULL,
  `titular_pais_nacimiento_id` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`base_cod`),
  KEY `fk_genero` (`titular_genero`),
  KEY `fk_tipo` (`automotor_tipo_codigo`),
  KEY `fk_marca` (`automotor_marca_codigo`),
  KEY `fk_modelo` (`automotor_modelo_codigo`),
  KEY `fk_prov_secc` (`registro_seccional_provincia`),
  KEY `fk_prov_mod` (`titular_domicilio_provincia`),
  CONSTRAINT `fk_genero` FOREIGN KEY (`titular_genero`) REFERENCES `genero` (`cod_titular_gen`),
  CONSTRAINT `fk_marca` FOREIGN KEY (`automotor_marca_codigo`) REFERENCES `automotor_marca_descrip` (`cod_marca_desc`),
  CONSTRAINT `fk_modelo` FOREIGN KEY (`automotor_modelo_codigo`) REFERENCES `automotor_modelo_descrip` (`cod_modelo_desc`),
  CONSTRAINT `fk_prov_mod` FOREIGN KEY (`titular_domicilio_provincia`) REFERENCES `provincia` (`prov_cod`),
  CONSTRAINT `fk_prov_secc` FOREIGN KEY (`registro_seccional_provincia`) REFERENCES `provincia` (`prov_cod`),
  CONSTRAINT `fk_tipo` FOREIGN KEY (`automotor_tipo_codigo`) REFERENCES `automotor_tipo_descrip` (`cod_tipo_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=65536 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla pat24.genero
CREATE TABLE IF NOT EXISTS `genero` (
  `cod_titular_gen` tinyint(4) NOT NULL AUTO_INCREMENT,
  `titular_gen` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_titular_gen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para vista pat24.generos
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `generos` (
	`titular_gen` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Totales` BIGINT(21) NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista pat24.InscripcionEdad
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `InscripcionEdad` (
	`titular_anio_nacimiento` VARCHAR(1) NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Totales` BIGINT(21) NOT NULL,
	`Edad` DOUBLE(17,0) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista pat24.InscripcionSF10
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `InscripcionSF10` (
	`titular_domicilio_localidad` VARCHAR(1) NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`totales` BIGINT(21) NOT NULL,
	`prov_nom` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_uca1400_ai_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista pat24.MarcaModelo
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `MarcaModelo` (
	`modelo_desc` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`marca_desc` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Totales` BIGINT(21) NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista pat24.ModelosEdad
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `ModelosEdad` (
	`modelo_desc` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`marca_desc` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Totales` BIGINT(21) NOT NULL,
	`Edad` DOUBLE(17,0) NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla pat24.provincia
CREATE TABLE IF NOT EXISTS `provincia` (
  `prov_cod` tinyint(4) NOT NULL AUTO_INCREMENT,
  `prov_nom` varchar(50) NOT NULL,
  PRIMARY KEY (`prov_cod`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para vista pat24.TotalMarcas
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `TotalMarcas` (
	`marca_desc` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Totales` BIGINT(21) NOT NULL
) ENGINE=MyISAM;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `generos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `generos` AS select `genero`.`titular_gen` AS `titular_gen`,count(0) AS `Totales` from (`genero` join `base`) where `base`.`titular_genero` = `genero`.`cod_titular_gen` group by `genero`.`titular_gen` order by count(0) desc;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `InscripcionEdad`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `InscripcionEdad` AS select `base`.`titular_anio_nacimiento` AS `titular_anio_nacimiento`,count(0) AS `Totales`,year(curdate()) - round(avg(`base`.`titular_anio_nacimiento`),0) AS `Edad` from `base` where `base`.`titular_tipo_persona` <> 'Jurídica' and `base`.`automotor_uso_descripcion` = 'Privado' and `base`.`titular_anio_nacimiento` < '2011' group by `base`.`titular_anio_nacimiento`;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `InscripcionSF10`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `InscripcionSF10` AS select `base`.`titular_domicilio_localidad` AS `titular_domicilio_localidad`,count(`base`.`titular_domicilio_localidad`) AS `totales`,`provincia`.`prov_nom` AS `prov_nom` from (`base` join `provincia`) where `base`.`titular_domicilio_provincia` = `provincia`.`prov_cod` and `provincia`.`prov_nom` = 'SANTA FE' group by `base`.`titular_domicilio_localidad`,`provincia`.`prov_nom` order by count(`base`.`titular_domicilio_localidad`) desc limit 10;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `MarcaModelo`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `MarcaModelo` AS select `automotor_modelo_descrip`.`modelo_desc` AS `modelo_desc`,`automotor_marca_descrip`.`marca_desc` AS `marca_desc`,count(0) AS `Totales` from ((`base` join `automotor_modelo_descrip`) join `automotor_marca_descrip`) where `base`.`automotor_marca_codigo` = `automotor_marca_descrip`.`cod_marca_desc` and `base`.`automotor_modelo_codigo` = `automotor_modelo_descrip`.`cod_modelo_desc` group by `automotor_modelo_descrip`.`modelo_desc`,`automotor_marca_descrip`.`marca_desc` order by count(0) desc;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `ModelosEdad`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `ModelosEdad` AS select `automotor_modelo_descrip`.`modelo_desc` AS `modelo_desc`,`automotor_marca_descrip`.`marca_desc` AS `marca_desc`,count(0) AS `Totales`,year(curdate()) - round(avg(`base`.`titular_anio_nacimiento`),0) AS `Edad` from ((`base` join `automotor_modelo_descrip`) join `automotor_marca_descrip`) where `base`.`automotor_marca_codigo` = `automotor_marca_descrip`.`cod_marca_desc` and `base`.`automotor_modelo_codigo` = `automotor_modelo_descrip`.`cod_modelo_desc` and `base`.`titular_tipo_persona` <> 'Jurídica' group by `automotor_modelo_descrip`.`modelo_desc`,`automotor_marca_descrip`.`marca_desc` order by count(0) desc;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `TotalMarcas`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `TotalMarcas` AS select `automotor_marca_descrip`.`marca_desc` AS `marca_desc`,count(0) AS `Totales` from (`automotor_marca_descrip` join `base`) where `base`.`automotor_marca_codigo` = `automotor_marca_descrip`.`cod_marca_desc` group by `automotor_marca_descrip`.`marca_desc` order by count(0) desc;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
