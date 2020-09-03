-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.2.14-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para fiscal_db
CREATE DATABASE IF NOT EXISTS `fiscal_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `fiscal_db`;

-- Volcando estructura para tabla fiscal_db.op_cab_fiscal
DROP TABLE IF EXISTS `op_cab_fiscal`;
CREATE TABLE IF NOT EXISTS `op_cab_fiscal` (
  `op_id` int(11) DEFAULT NULL,
  `op_fecha` datetime DEFAULT NULL,
  `op_cod_cliente` varchar(30) NOT NULL,
  `op_nom_cliente` varchar(250) DEFAULT NULL,
  `op_nip_cliente` varchar(45) NOT NULL,
  `op_dir_cliente` varchar(250) DEFAULT NULL,
  `op_tel_cliente` varchar(50) DEFAULT NULL,
  `op_tipo` int(11) DEFAULT NULL,
  `op_num_corre` int(11) DEFAULT NULL,
  `op_num_rel` char(23) DEFAULT NULL,
  `op_subtotal` decimal(20,4) DEFAULT 0.0000,
  `op_itbms` decimal(20,4) DEFAULT 0.0000,
  `op_total` decimal(20,4) DEFAULT 0.0000,
  `emp_imp1` decimal(20,2) DEFAULT 0.00,
  `emp_imp2` decimal(20,2) DEFAULT 0.00,
  `emp_imp3` decimal(20,2) DEFAULT 0.00,
  `emp_imp4` decimal(20,2) DEFAULT 0.00,
  `u_id` int(11) DEFAULT NULL,
  `op_manejo` decimal(20,2) DEFAULT 0.00,
  `op_observ` mediumtext DEFAULT NULL,
  `op_desc` decimal(20,4) DEFAULT 0.0000,
  `op_subtotalneto` decimal(20,4) DEFAULT 0.0000,
  `op_contado` decimal(20,4) DEFAULT 0.0000,
  `op_credito` decimal(20,4) DEFAULT 0.0000,
  `op_pagado` decimal(20,3) DEFAULT NULL,
  `op_vuelto` decimal(20,3) DEFAULT 0.000,
  `op_forma_1` decimal(20,4) DEFAULT 0.0000,
  `op_forma_2` decimal(20,4) DEFAULT 0.0000,
  `op_forma_3` decimal(20,4) DEFAULT 0.0000,
  `op_forma_4` decimal(20,4) DEFAULT 0.0000,
  `op_forma_5` decimal(20,3) DEFAULT 0.000,
  `op_forma_6` decimal(20,3) DEFAULT 0.000,
  `op_forma_7` decimal(20,3) DEFAULT 0.000,
  `op_forma_8` decimal(20,3) DEFAULT 0.000,
  `op_forma_9` decimal(20,3) DEFAULT 0.000,
  `op_forma_10` decimal(20,3) DEFAULT 0.000,
  `op_forma_11` decimal(20,3) DEFAULT 0.000,
  `op_forma_12` decimal(20,3) DEFAULT 0.000,
  `op_forma_13` decimal(20,3) DEFAULT 0.000,
  `op_forma_14` decimal(20,3) DEFAULT 0.000,
  `op_forma_15` decimal(20,3) DEFAULT 0.000,
  `op_forma_16` decimal(20,3) DEFAULT 0.000,
  `op_forma_17` decimal(20,3) DEFAULT 0.000,
  `op_forma_18` decimal(20,3) DEFAULT 0.000,
  `op_forma_19` decimal(20,3) DEFAULT 0.000,
  `op_forma_20` decimal(20,3) DEFAULT 0.000,
  `op_totitems` int(4) DEFAULT 0,
  `op_v_id` int(11) DEFAULT 0,
  `op_num_nco` varchar(20) DEFAULT NULL,
  `op_num_ncf` char(23) DEFAULT NULL,
  `op_numserie_if` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla fiscal_db.op_cab_fiscal: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `op_cab_fiscal` DISABLE KEYS */;
INSERT INTO `op_cab_fiscal` (`op_id`, `op_fecha`, `op_cod_cliente`, `op_nom_cliente`, `op_nip_cliente`, `op_dir_cliente`, `op_tel_cliente`, `op_tipo`, `op_num_corre`, `op_num_rel`, `op_subtotal`, `op_itbms`, `op_total`, `emp_imp1`, `emp_imp2`, `emp_imp3`, `emp_imp4`, `u_id`, `op_manejo`, `op_observ`, `op_desc`, `op_subtotalneto`, `op_contado`, `op_credito`, `op_pagado`, `op_vuelto`, `op_forma_1`, `op_forma_2`, `op_forma_3`, `op_forma_4`, `op_forma_5`, `op_forma_6`, `op_forma_7`, `op_forma_8`, `op_forma_9`, `op_forma_10`, `op_forma_11`, `op_forma_12`, `op_forma_13`, `op_forma_14`, `op_forma_15`, `op_forma_16`, `op_forma_17`, `op_forma_18`, `op_forma_19`, `op_forma_20`, `op_totitems`, `op_v_id`, `op_num_nco`, `op_num_ncf`, `op_numserie_if`) VALUES
	(220000003, '2019-05-05 19:26:54', '1', 'CLIENTE CONTADO', '000-000-000', '.', '', 2, 3, '', 200.0000, 5.6700, 167.6700, 5.67, 0.00, 0.00, 0.00, 1, 20.00, 'NOTAS DE JOHNN\r\n', 38.0000, 162.0000, 187.6700, 0.0000, 250.000, 62.330, 135.6700, 10.0000, 10.0000, 10.0000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 10.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 10.000, 0.000, 0, 80, '00000939', '00000939', 'TFDM110000830');
/*!40000 ALTER TABLE `op_cab_fiscal` ENABLE KEYS */;

-- Volcando estructura para tabla fiscal_db.op_det_fiscal
DROP TABLE IF EXISTS `op_det_fiscal`;
CREATE TABLE IF NOT EXISTS `op_det_fiscal` (
  `Prod_id` int(10) DEFAULT 0,
  `Prod_Op_Id` int(11) DEFAULT 0,
  `Prod_Codigo` varchar(20) DEFAULT NULL,
  `Prod_Descrip` text DEFAULT NULL,
  `Prod_Cant` decimal(41,3) DEFAULT NULL,
  `Prod_Precio` decimal(20,5) DEFAULT 0.00000,
  `Prod_total` decimal(34,2) DEFAULT NULL,
  `Prod_Itbms` decimal(20,3) DEFAULT 0.000,
  `Prod_Desc1` decimal(20,4) DEFAULT 0.0000,
  `Prod_Desc2` decimal(20,4) DEFAULT 0.0000,
  `Prod_Garant_Dias` int(11) DEFAULT 0,
  `Prod_Garant_Text` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla fiscal_db.op_det_fiscal: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `op_det_fiscal` DISABLE KEYS */;
INSERT INTO `op_det_fiscal` (`Prod_id`, `Prod_Op_Id`, `Prod_Codigo`, `Prod_Descrip`, `Prod_Cant`, `Prod_Precio`, `Prod_total`, `Prod_Itbms`, `Prod_Desc1`, `Prod_Desc2`, `Prod_Garant_Dias`, `Prod_Garant_Text`) VALUES
	(7, 220000003, '101', 'PRODUCTO DE PRUEBAS', 2.000, 100.00000, 100.00, 0.000, 10.0000, 9.0000, 0, '');
/*!40000 ALTER TABLE `op_det_fiscal` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
