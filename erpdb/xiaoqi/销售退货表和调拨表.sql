CREATE TABLE `SalesMain` (
  `CustID` varchar(50) NOT NULL COMMENT '客户',
  `BillNo` varchar(50) NOT NULL COMMENT '单据编号',
  `BillDate` date DEFAULT NULL COMMENT '单据日期',
  `CustAddress` Varchar(50) DEFAULT Null COMMENT '送货地址',
  `PriceofTax` Int DEFAULT 0 COMMENT '单价是否含税',
  `WareID` varchar(20)  DEFAULT NULL COMMENT '仓库',
  `ExchRate` Float DEFAULT 1.0000 COMMENT '汇率',
  `IsDeduct` Int DEFAULT 0 COMMENT '是否重新出库',
  `OtherPayStyle` varchar(50) DEFAULT NULL COMMENT '结算方式三',
  `CurrID` varchar(20) DEFAULT '人民币' COMMENT '币别',
  `Maker` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `Permitter` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `DepartID` varchar(20) DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`BillNo`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into SalesMain values('001','20170928001',2017-09-28,'湖南省株洲市天元区',0,'株洲仓',1,0,'人民币','admin','admin','管理部门');
insert into SalesMain values('002','20170928002',2017-09-28,'湖南省株洲市石峰区',0,'湘潭仓',1,0,'人民币','admin','admin','管理部门');

select * from SalesMain;

CREATE TABLE `SalesDetails` (
  `Serno` int NOT NULL COMMENT '自增列',
  `prodid` varchar(50) NOT NULL COMMENT '物料编号',
  `prodname` varchar(255) DEFAULT NULL COMMENT '物料名称',
  `prodsize` Varchar(20) DEFAULT NUll COMMENT '规格型号',
  `Sunit` varchar(20) DEFAULT null COMMENT '单位名称',
  `squantity` int  DEFAULT NULL COMMENT '数量',
  `oldprice`decimal DEFAULT null COMMENT '折扣前单价',
  `discount` Int DEFAULT 1 COMMENT '折数',
  `sprice` decimal DEFAULT NULL COMMENT '单价',
  `amount` decimal DEFAULT null COMMENT '金额',
  `taxrate`int DEFAULT 0.17 COMMENT '税率',
  `taxamt` decimal DEFAULT NULL COMMENT '税额',
  `amountatax` decimal DEFAULT NULL COMMENT '含税金额',
  `havebatch` int DEFAULT null COMMENT '批号',
  `isgift` int DEFAULT null COMMENT '赠品',
  `hasinv` int DEFAULT null COMMENT '发票明细',
  `notinvcount` int DEFAULT null COMMENT '未开票数量',
  `itemremark` varchar(50) DEFAULT NULL COMMENT '分录备注',
  `trantype` varchar(50) DEFAULT NULL COMMENT '来源单别',
  `fromno` int DEFAULT NULL COMMENT '来源单号',
  PRIMARY KEY (`prodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into SalesDetails values(1,'C01-W-HP-DC7900-307','HP DC7900CMT-NA307PA#AB2台式机','HP DC7900CMT-NA307PA#AB2台式机','PCS',1,3730,100,3730,3730,17,1268,4998.20,0,0,0,0,'第二笔交易','销售出库单','20170928001');
insert into SalesDetails values(2,'C01-W-HP-DC7900-308','HP DC7900CMT-NA308PA#AB2台式机','HP DC7900CMT-NA308PA#AB2台式机','PCS',1,3730,100,3730,3730,17,1268,4998.20,0,0,0,0,'第一笔交易','销售出库单','20170928002');

select * from SalesDetails;

CREATE TABLE `WareMain` (
  `WareOutID` varchar(20) NOT NULL COMMENT '调出仓库',
  `WareID` varchar(20) NOT NULL COMMENT '调入仓库',
  `MoveDate` date DEFAULT NULL COMMENT '单据日期',
  `MoveNO` Varchar(50) DEFAULT Null COMMENT '单据编号',
  `Maker` Varchar(20)  DEFAULT 0 COMMENT '制单人员',
  `Permitter` varchar(20)  DEFAULT NULL COMMENT '复核人员',
  PRIMARY KEY (`MoveNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into WareMain values ('株洲仓','长沙仓',2017-09-28,'20170928001','admin','admin');
insert into WareMain values ('长沙仓','株洲仓',2017-09-28,'20170928002','admin','admin');
select * from WareMain;

CREATE TABLE `WareDetails` (
  `serno` int NOT NULL COMMENT '自增列',
  `prodid` varchar(20) NOT NULL COMMENT '物料编号',
  `prodname`  varchar(20) DEFAULT NULL COMMENT '物料名称',
  `prodsize` Varchar(50) DEFAULT Null COMMENT '规格型号',
  `sunit` Varchar(20)  DEFAULT null COMMENT '单位名称',
  `squantity` int  DEFAULT NULL COMMENT '数量',
  `havebatch` varchar(20)  DEFAULT NULL COMMENT '批号',
  `itemremark` varchar(20)  DEFAULT NULL COMMENT '分录备注',
  PRIMARY KEY (`prodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into WareDetails values (1,'C02-W-HP-PF996AA-AB2','HP DC7900CMT-NA307PA#AB2台式机','HP DC7900CMT-NA307PA#AB2台式机','psc',1,0,'第三笔交易');
insert into WareDetails values (2,'C02-W-HP-PF996AA-AB3','HP DC7900CMT-NA307PA#AB2台式机','HP DC7900CMT-NA307PA#AB2台式机','psc',1,0,'第四笔交易');
select * from WareDetails;