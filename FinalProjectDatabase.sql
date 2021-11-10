-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.4-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for comp5120
CREATE DATABASE IF NOT EXISTS `comp5120` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `comp5120`;

-- Dumping structure for table comp5120.db_book
CREATE TABLE IF NOT EXISTS `db_book` (
  `BookID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `UnitPrice` decimal(20,2) unsigned NOT NULL,
  `Author` varchar(50) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `SubjectID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`BookID`),
  KEY `FK_db_book_db_supplier` (`SupplierID`),
  CONSTRAINT `FK_db_book_db_supplier` FOREIGN KEY (`SupplierID`) REFERENCES `db_supplier` (`SupplierID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table comp5120.db_customer
CREATE TABLE IF NOT EXISTS `db_customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table comp5120.db_employee
CREATE TABLE IF NOT EXISTS `db_employee` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table comp5120.db_order
CREATE TABLE IF NOT EXISTS `db_order` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `OrderDate` varchar(50) NOT NULL,
  `ShipperDate` varchar(50) DEFAULT NULL,
  `ShipperID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_db_order_db_customer` (`CustomerID`),
  KEY `FK_db_order_db_employee` (`EmployeeID`),
  KEY `FK_db_order_db_shipper` (`ShipperID`),
  CONSTRAINT `FK_db_order_db_customer` FOREIGN KEY (`CustomerID`) REFERENCES `db_customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_db_order_db_employee` FOREIGN KEY (`EmployeeID`) REFERENCES `db_employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_db_order_db_shipper` FOREIGN KEY (`ShipperID`) REFERENCES `db_shipper` (`shipperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table comp5120.db_order_detail
CREATE TABLE IF NOT EXISTS `db_order_detail` (
  `BookID` int(11) DEFAULT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  KEY `FK_db_order_detail_db_book` (`BookID`),
  KEY `FK_db_order_detail_db_order` (`OrderID`),
  CONSTRAINT `FK_db_order_detail_db_book` FOREIGN KEY (`BookID`) REFERENCES `db_book` (`BookID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_db_order_detail_db_order` FOREIGN KEY (`OrderID`) REFERENCES `db_order` (`OrderID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table comp5120.db_shipper
CREATE TABLE IF NOT EXISTS `db_shipper` (
  `shipperID` int(11) NOT NULL AUTO_INCREMENT,
  `shipperName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shipperID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table comp5120.db_subject
CREATE TABLE IF NOT EXISTS `db_subject` (
  `SubjectID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table comp5120.db_supplier
CREATE TABLE IF NOT EXISTS `db_supplier` (
  `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(50) NOT NULL,
  `ContactLastName` varchar(50) NOT NULL,
  `ContactFirstName` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) NOT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
