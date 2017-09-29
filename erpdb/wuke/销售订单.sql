/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.5.28-enterprise-commercial-advanced-log : Database - xiaoshou
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`xiaoshou` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `xiaoshou`;

/*Table structure for table `priceadjustment` */

DROP TABLE IF EXISTS `priceadjustment`;

CREATE TABLE `priceadjustment` (
  `BillDate` date NOT NULL COMMENT '单据日期',
  `BillNo` varchar(20) NOT NULL COMMENT '单据编号',
  `DocumentNumber` varchar(20) DEFAULT NULL COMMENT '凭证编号',
  `ArrangeMode` varchar(20) NOT NULL DEFAULT '按单价' COMMENT '调整方式',
  `Maker` varchar(20) NOT NULL COMMENT '制单人员',
  `Permitter` varchar(20) DEFAULT NULL COMMENT '复核人员',
  `ReviewTime` date DEFAULT NULL COMMENT '复核时间',
  PRIMARY KEY (`BillNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `priceadjustment` */

insert  into `priceadjustment`(`BillDate`,`BillNo`,`DocumentNumber`,`ArrangeMode`,`Maker`,`Permitter`,`ReviewTime`) values ('2017-09-29','20170929001',NULL,'按单价','admin','admin','2017-09-29');

/*Table structure for table `priceadjustmentdetail` */

DROP TABLE IF EXISTS `priceadjustmentdetail`;

CREATE TABLE `priceadjustmentdetail` (
  `Serno` int(11) NOT NULL AUTO_INCREMENT,
  `ProdId` varchar(50) NOT NULL COMMENT '物料编号，主键外键 主表',
  `Inventory` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `AverageCost` float NOT NULL COMMENT '平均成本',
  `Sprice` float NOT NULL COMMENT '单价',
  `PriceAdjustment` float DEFAULT NULL COMMENT '调价金额',
  `Itemremark` varchar(50) DEFAULT NULL COMMENT '分录备注',
  PRIMARY KEY (`ProdId`),
  UNIQUE KEY `Serno` (`Serno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `priceadjustmentdetail` */

insert  into `priceadjustmentdetail`(`Serno`,`ProdId`,`Inventory`,`AverageCost`,`Sprice`,`PriceAdjustment`,`Itemremark`) values (1,'AC-#AQ28965-QA',10,4000,5000,500,NULL);

/*Table structure for table `salesorder` */

DROP TABLE IF EXISTS `salesorder`;

CREATE TABLE `salesorder` (
  `CustomerId` varchar(50) NOT NULL COMMENT '销售订单客户（客户表',
  `BillDate` date NOT NULL COMMENT '单据日期',
  `BillNo` varchar(20) NOT NULL COMMENT '单据号码（联合主键）',
  `CustAddress` varchar(50) DEFAULT NULL COMMENT '送货地址',
  `CustBillNo` varchar(20) DEFAULT NULL COMMENT '客户订单',
  `PriceOfTax` varchar(50) NOT NULL DEFAULT '未税' COMMENT '单价是否含税',
  `BillStatus` varchar(20) DEFAULT '未结案' COMMENT '单况',
  `CurrId` int(11) NOT NULL COMMENT '人民币',
  `CurFixedRate` float NOT NULL COMMENT '汇率',
  `SalesId` int(11) NOT NULL COMMENT '业务人员（人员表）',
  `DepartId` int(11) NOT NULL COMMENT '所属部门（部门表）和人员表有关联',
  `Maker` varchar(50) NOT NULL COMMENT '制单人员',
  `Permitter` varchar(50) NOT NULL COMMENT '复核人员',
  `ReviewTime` date DEFAULT NULL COMMENT '复核时间',
  `ReviewStatus` varchar(20) DEFAULT NULL COMMENT '复核状态',
  `ProjectName` varchar(50) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`BillNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `salesorder` */

insert  into `salesorder`(`CustomerId`,`BillDate`,`BillNo`,`CustAddress`,`CustBillNo`,`PriceOfTax`,`BillStatus`,`CurrId`,`CurFixedRate`,`SalesId`,`DepartId`,`Maker`,`Permitter`,`ReviewTime`,`ReviewStatus`,`ProjectName`) values ('1','2017-09-29','20170929001',NULL,NULL,'未税','未结案',1,1,1,1,'admin','admin','2017-09-29','已结案',NULL);

/*Table structure for table `salesorderdetail` */

DROP TABLE IF EXISTS `salesorderdetail`;

CREATE TABLE `salesorderdetail` (
  `SerNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏号（联合主键）',
  `ProdId` varchar(100) NOT NULL COMMENT '物料编号(物料表)',
  `Num` int(11) NOT NULL COMMENT '数量',
  `CustRateOfPrice` float NOT NULL COMMENT '折扣前单价',
  `CustRateOfDiscount` float NOT NULL COMMENT '折数',
  `Sprice` float NOT NULL COMMENT '单价',
  `Amount` float NOT NULL COMMENT '金额',
  `TaxRate` float NOT NULL COMMENT '税率',
  `EnPrdWareInDay` date NOT NULL COMMENT '预出库日',
  `IsGift` varchar(50) DEFAULT NULL COMMENT '赠品',
  `Trantype` varchar(50) NOT NULL COMMENT '来源单别',
  `Fromno` varchar(50) NOT NULL COMMENT '来源单号',
  PRIMARY KEY (`SerNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `salesorderdetail` */

insert  into `salesorderdetail`(`SerNo`,`ProdId`,`Num`,`CustRateOfPrice`,`CustRateOfDiscount`,`Sprice`,`Amount`,`TaxRate`,`EnPrdWareInDay`,`IsGift`,`Trantype`,`Fromno`) values (1,'A-C#250A-AC',1,4000,100,4000,4000,17,'2017-10-03',NULL,'20170929001 ','采购询价单');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
