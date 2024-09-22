-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
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


-- Volcando estructura de base de datos para patentamientos0724
CREATE DATABASE IF NOT EXISTS `patentamientos0724` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `patentamientos0724`;

-- Volcando estructura para tabla patentamientos0724.base
CREATE TABLE IF NOT EXISTS `base` (
  `base_cod` mediumint(9) NOT NULL AUTO_INCREMENT,
  `tramite_tipo` varchar(255) DEFAULT NULL,
  `tramite_fecha` varchar(255) DEFAULT NULL,
  `fecha_inscripcion_inicial` varchar(255) DEFAULT NULL,
  `registro_seccional_codigo` varchar(255) DEFAULT NULL,
  `registro_seccional_descripcion` varchar(255) DEFAULT NULL,
  `registro_seccional_provincia` tinyint(4) DEFAULT NULL,
  `automotor_origen` varchar(255) DEFAULT NULL,
  `automotor_anio_modelo` varchar(255) DEFAULT NULL,
  `automotor_tipo_codigo` tinyint(4) DEFAULT NULL,
  `automotor_marca_codigo` smallint(6) DEFAULT NULL,
  `automotor_modelo_codigo` smallint(6) DEFAULT NULL,
  `automotor_uso_codigo` varchar(255) DEFAULT NULL,
  `automotor_uso_descripcion` varchar(255) DEFAULT NULL,
  `titular_tipo_persona` varchar(255) DEFAULT NULL,
  `titular_domicilio_localidad` varchar(255) DEFAULT NULL,
  `titular_domicilio_provincia` tinyint(4) DEFAULT NULL,
  `titular_genero` tinyint(4) DEFAULT NULL,
  `titular_anio_nacimiento` varchar(255) DEFAULT NULL,
  `titular_pais_nacimiento` varchar(255) DEFAULT NULL,
  `titular_porcentaje_titularidad` varchar(255) DEFAULT NULL,
  `titular_domicilio_provincia_id` varchar(255) DEFAULT NULL,
  `titular_pais_nacimiento_id` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=43305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
