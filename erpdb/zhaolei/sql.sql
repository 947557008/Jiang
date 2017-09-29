#盘点单主表
DROP TABLE IF EXISTS `pandian_order_zhu`;

CREATE TABLE `pandian_order_zhu` (
  `BillNo` varchar(50) NOT NULL COMMENT '盘点主表编号',
  `BillDate` date NOT NULL COMMENT '单据日期',
  `IsNullZaiRu` int(11)NOT NULL COMMENT '账面数量为0载入',
  `WareId` int(11) NOT NULL COMMENT '盘点仓库Id',
  `SalesID` int(11) NOT NULL COMMENT '盘点人员Id',
  `MakerId` int(11) NOT NULL COMMENT '制单人员',
  `Permitter` int(11) DEFAULT NULL COMMENT '复核人员Id',
  `FuHeDate` date DEFAULT NULL COMMENT '复核时间',
  `FuHeIsNo` int(11) NOT NULL COMMENT '是否复核',
  `CreateDate` date DEFAULT NULL COMMENT '创建时间',
  `Bumen` int(11) NOT NULL COMMENT '所属部门',
  PRIMARY KEY (`BillNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pandian_order_zhu` */

/*Table structure for table `purchase_order_ever` */

#盘点单从表

DROP TABLE IF EXISTS `pandian_order_chong`;

CREATE TABLE `pandian_order_chong` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏号',
  `PanDian_order_chongId` varchar(50) NOT NULL COMMENT '盘点主表Id',
  `WuLiaoNo` varchar(50) NOT NULL COMMENT '物料编号',
  `PanDianCount` int(11) NOT NULL COMMENT '盘点数量',
  `Price` float NOT NULL COMMENT '单价',
  `PiNo` varbinary(50) NOT NULL COMMENT '批号',
  `WhyStr` varchar(50) NOT NULL COMMENT '原因',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pandian_order_chong` */

/*Table structure for table `pandian_order_zhu` */

#采购订单主表

DROP TABLE IF EXISTS `purchase_order_master`;

CREATE TABLE `purchase_order_master` (
  `Billno` varchar(50) NOT NULL COMMENT '单据编号',
  `BillDate` date NOT NULL COMMENT '单据日期',
  `BillStatus` int(11) NOT NULL COMMENT '单况（1.已结案，2.未结案，3，无效）',
  `BillStyleId` int(11) DEFAULT NULL COMMENT '采购订单类型',
  `Customer` int(11) NOT NULL COMMENT '供应商Id',
  `CurrId` int(11) NOT NULL COMMENT '币别表Id',
  `PriceOfTax` int(11) NOT NULL COMMENT '单价是否含税',
  `FaceAterdId` varchar(50) DEFAULT NULL COMMENT '供应商地址编号',
  `FaceAreaName` varchar(50) DEFAULT NULL COMMENT '供应商地址名称',
  `ExchEate` double DEFAULT NULL COMMENT '汇率',
  `SonghuoAdress` varchar(50) DEFAULT NULL COMMENT '送货地址',
  `SalesId` int(11) NOT NULL COMMENT '采购人员Id',
  `DepartId` int(11) NOT NULL COMMENT '所属部门Id',
  `MakeId` int(11) NOT NULL COMMENT '制单人员Id',
  `PermitterId` int(11) DEFAULT NULL COMMENT '复刻人员Id',
  `Remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `ShiFouFuke` int(11) DEFAULT NULL COMMENT '是否复刻',
  `FuHeDate` date DEFAULT NULL COMMENT '复刻时间',
  `CreateDate` date DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Billno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#采购订单详情表

DROP TABLE IF EXISTS `purchase_order_ever`;

CREATE TABLE `purchase_order_ever` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏号（自增）',
  `Purchres_order_masterId` varchar(50) NOT NULL COMMENT '订单从表Id',
  `MatterId` varchar(50)NOT NULL COMMENT '物料编号',
  `Count` int(11) NOT NULL COMMENT '数量',
  `ZheKouQianPrice` float NOT NULL COMMENT '折扣前单价',
  `ZheShu` float NOT NULL COMMENT '折数',
  `Price` float NOT NULL COMMENT '单价',
  `Money` float NOT NULL COMMENT '金额',
  `ShuiLv` float NOT NULL COMMENT '税率',
  `ShuiMoney` float NOT NULL COMMENT '税额',
  `HanShuiMoney` float NOT NULL COMMENT '含税金额',
  `YuRuKuR` date NOT NULL COMMENT '预入库日',
  `ShifouZengping` int(11) DEFAULT NULL COMMENT '是否赠品',
  `FenLuBeiZhu` varbinary(50) DEFAULT NULL COMMENT '分录备注',
  `BillNoFrom` varchar(50) DEFAULT NULL COMMENT '来源单别',
  `BillNoFormNo` varchar(50) DEFAULT NULL COMMENT '来源单号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchase_order_ever` */

/*Table structure for table `purchase_order_master` */

