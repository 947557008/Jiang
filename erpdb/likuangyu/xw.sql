/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.5.28-enterprise-commercial-advanced-log : Database - demo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`demo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `demo`;

/*Table structure for table `xs_funddetail` */

DROP TABLE IF EXISTS `xs_funddetail`;

CREATE TABLE `xs_funddetail` (
  `fundBillNo` varchar(20) NOT NULL COMMENT '预收款主单单据编号',
  `serNo` varchar(20) NOT NULL COMMENT '栏号',
  `origAddPerpay` decimal(10,0) NOT NULL COMMENT '预收金额',
  `billClassNoFrom` varchar(20) NOT NULL COMMENT '来源单别',
  `billNoFrom` varchar(20) NOT NULL COMMENT '来源单号',
  `hLocalCurPreRecv` decimal(10,0) NOT NULL COMMENT '预收金额',
  `abstract` varchar(20) DEFAULT NULL COMMENT '摘要',
  PRIMARY KEY (`fundBillNo`,`serNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xs_funddetail` */

/*Table structure for table `xs_fundmain` */

DROP TABLE IF EXISTS `xs_fundmain`;

CREATE TABLE `xs_fundmain` (
  `fundBillNo` varchar(20) NOT NULL COMMENT '预收款单据编号',
  `fundBillDate` date NOT NULL COMMENT '单据日期',
  `customerId` varchar(20) NOT NULL COMMENT '客户编号',
  `cash1` varchar(20) NOT NULL COMMENT '冲款方式一',
  `cash1Blanace` decimal(10,0) NOT NULL COMMENT '冲款方式一金额',
  `cash2` varchar(20) NOT NULL COMMENT '冲款方式二',
  `cash2Blanace` decimal(10,0) DEFAULT NULL COMMENT '冲款方式二金额',
  `cash3` varchar(20) DEFAULT NULL COMMENT '冲款方式三',
  `cash3Blanace` decimal(10,0) DEFAULT NULL COMMENT '冲款方式三金额',
  `currId` varchar(20) NOT NULL COMMENT '币别',
  `exchRate` decimal(10,0) NOT NULL COMMENT '汇率',
  `deparmentNo` varchar(20) NOT NULL COMMENT '所属部门',
  `projectNo` varchar(20) NOT NULL COMMENT '所属项目',
  `markerSign` varchar(20) NOT NULL COMMENT '制单人员',
  `permitterSign` varchar(20) NOT NULL COMMENT '复核人员',
  PRIMARY KEY (`fundBillNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xs_fundmain` */

/*Table structure for table `xs_fundpaywaymain` */

DROP TABLE IF EXISTS `xs_fundpaywaymain`;

CREATE TABLE `xs_fundpaywaymain` (
  `fundPayWayNo` varchar(20) NOT NULL COMMENT '单据编号',
  `fundPayWayDate` date NOT NULL COMMENT '单据日期',
  `customerId` varchar(20) NOT NULL COMMENT '客户编号',
  `cash1` varchar(20) NOT NULL COMMENT '结算方式一',
  `cash1Blanace` decimal(10,0) NOT NULL COMMENT '结算方式一金额',
  `cash2` varchar(20) NOT NULL COMMENT '结算方式二',
  `cash2Blanace` decimal(10,0) NOT NULL COMMENT '结算方式二金额',
  `cash3` varchar(20) DEFAULT NULL COMMENT '结算方式三',
  `cash3Blanace` decimal(10,0) DEFAULT NULL COMMENT '结算方式三金额',
  `currId` varchar(20) NOT NULL COMMENT '币别',
  `exchRate` decimal(10,0) NOT NULL COMMENT '汇率',
  `RateOfDiscount` decimal(10,0) DEFAULT NULL COMMENT '折扣率',
  `deparmentNo` varchar(20) DEFAULT NULL COMMENT '所属部门',
  `projectNo` varchar(20) DEFAULT NULL COMMENT '所属项目',
  `markerSign` varchar(20) NOT NULL COMMENT '制单人员',
  `permitterSign` varchar(20) DEFAULT NULL COMMENT '复核人员',
  PRIMARY KEY (`fundPayWayNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xs_fundpaywaymain` */

/*Table structure for table `xs_punchblanacedetail` */

DROP TABLE IF EXISTS `xs_punchblanacedetail`;

CREATE TABLE `xs_punchblanacedetail` (
  `fundPayWayNo` varchar(20) NOT NULL COMMENT '应收冲款主单单号',
  `serNo` varchar(20) NOT NULL COMMENT '栏号',
  `billClassNo` varchar(20) NOT NULL COMMENT '单别',
  `billNo` varchar(20) NOT NULL COMMENT '原单单号',
  `disAllBlanace` decimal(10,0) DEFAULT NULL COMMENT '折让金额',
  `punchBlanace` decimal(10,0) NOT NULL COMMENT '冲款金额',
  `chaAgaBlanace` decimal(10,0) DEFAULT NULL COMMENT '冲抵金额',
  PRIMARY KEY (`fundPayWayNo`,`serNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xs_punchblanacedetail` */

/*Table structure for table `xs_recadvdetail` */

DROP TABLE IF EXISTS `xs_recadvdetail`;

CREATE TABLE `xs_recadvdetail` (
  `fundPayWayNo` varchar(20) NOT NULL COMMENT '应收冲款主单单号',
  `serNo` varchar(20) NOT NULL COMMENT '栏号',
  `fundBillNo` varchar(20) NOT NULL COMMENT '预收单单号',
  `punchRecAdvDetail` decimal(10,0) NOT NULL COMMENT '取用预收金额',
  PRIMARY KEY (`fundPayWayNo`,`serNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xs_recadvdetail` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
