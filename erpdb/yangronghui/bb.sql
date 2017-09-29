/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.5.28-enterprise-commercial-advanced-log : Database - xiangmu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`xiangmu` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `xiangmu`;

/*Table structure for table `caigouruku` */

DROP TABLE IF EXISTS `caigouruku`;

CREATE TABLE `caigouruku` (
  `BillNo` varchar(20) NOT NULL,
  `CustID` varchar(20) NOT NULL,
  `CustAddress` varchar(20) NOT NULL,
  `SaleClassID` varchar(20) NOT NULL,
  `WareID` varchar(20) NOT NULL,
  `PriceofTex` varchar(20) NOT NULL,
  `BillDate` date NOT NULL,
  `CurrID` varchar(20) NOT NULL,
  `FixedRate` float NOT NULL,
  `HasForeignTrade` varchar(20) NOT NULL,
  `SalesID` varchar(20) NOT NULL,
  `DepartID` varchar(20) NOT NULL,
  `Maker` varchar(20) NOT NULL,
  `Permitter` varchar(20) NOT NULL,
  `fuhezt` varchar(20) DEFAULT NULL,
  `updatesj` date DEFAULT NULL,
  `fuhesj` date DEFAULT NULL,
  PRIMARY KEY (`BillNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `caigouruku` */

insert  into `caigouruku`(`BillNo`,`CustID`,`CustAddress`,`SaleClassID`,`WareID`,`PriceofTex`,`BillDate`,`CurrID`,`FixedRate`,`HasForeignTrade`,`SalesID`,`DepartID`,`Maker`,`Permitter`,`fuhezt`,`updatesj`,`fuhesj`) values ('20170928001','1','北大青鸟','1','1','1','2017-09-26','1',1,'1','1','1','1','1',NULL,NULL,NULL);

/*Table structure for table `caigourukumingxi` */

DROP TABLE IF EXISTS `caigourukumingxi`;

CREATE TABLE `caigourukumingxi` (
  `SerNo` varchar(20) NOT NULL,
  `ProdID` varchar(20) NOT NULL,
  `ProdName` varchar(20) NOT NULL,
  `ProdSize` varchar(20) NOT NULL,
  `SUnit` varchar(20) NOT NULL,
  `SQuantity` varchar(20) NOT NULL,
  `OldPrice` varchar(20) NOT NULL,
  `Discount` varchar(20) NOT NULL,
  `SPrice` varchar(20) NOT NULL,
  `Amount` varchar(20) NOT NULL,
  `TaxAmt` varchar(20) NOT NULL,
  `TaxRate` varchar(20) NOT NULL,
  `AmountATax` varchar(20) NOT NULL,
  `HaveBatch` varchar(20) DEFAULT NULL,
  `IsGift` varchar(20) DEFAULT NULL,
  `HasIny` varchar(20) DEFAULT NULL,
  `ItemRemark` varchar(20) DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `FromNo` varchar(20) DEFAULT NULL,
  `MLAppFare` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SerNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `caigourukumingxi` */

/*Table structure for table `jiliang` */

DROP TABLE IF EXISTS `jiliang`;

CREATE TABLE `jiliang` (
  `UnitID` varchar(20) NOT NULL,
  `UnitName` varchar(20) DEFAULT NULL,
  `EngName` varchar(20) DEFAULT NULL,
  `Memo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jiliang` */

/*Table structure for table `wuliaoleibie` */

DROP TABLE IF EXISTS `wuliaoleibie`;

CREATE TABLE `wuliaoleibie` (
  `ClassID` varchar(20) NOT NULL,
  `ClassName` varchar(20) NOT NULL,
  `EngName` varchar(20) DEFAULT NULL,
  `AccInventoryID` varchar(20) NOT NULL,
  `AccSaleID` varchar(20) NOT NULL,
  `AccSaleCostID` varchar(20) NOT NULL,
  `SendOutWareID` varchar(20) NOT NULL,
  `GiftExpenseID` varchar(20) NOT NULL,
  `OtherIncomeID` varchar(20) DEFAULT NULL,
  `OtherExpenseID` varchar(20) DEFAULT NULL,
  `OtherCostID` varchar(20) DEFAULT NULL,
  `Memo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wuliaoleibie` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
