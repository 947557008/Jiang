create database erp;
use erp;

##供应商类别
create table supplierType(
classID	Int NOT NULL PRIMARY KEY AUTO_INCREMENT,#类别编号
ClassName Varchar(20) NOT NULL,#类别名称
EngName	Varchar(30),#英文名称		
Memo	Varchar(200)#备注		
)

insert Int,o erp.suppliertype ( ClassName)values( '主要供应商');
insert Int,o erp.suppliertype ( ClassName)values( '一般供应商');


##采购退货表
create table goodsrejected(
BillNo		Varchar(30) 	NOT NULL	PRIMARY key,	#单据号码
GatherStyle   	Varchar(50) 	NOT NULL,			#付款条件
GetherDelay	Int 	    	NOT NULL,				#付款天数
IsDeduct 	Int	    	NOT NULL,				#重新入库
WareID		Int	    	NOT NULL, 			#仓库 外键
BillDate	Date	    	NOT NULL,			#当前系统日期	单据日期
CustID		Varchar(20)	NOT NULL,		#供应商 外键
CurrID		Varchar(20)	NOT NULL,		#币别 外键
ExchRate	Varchar(30)	NOT NULL,		#汇率
SalesID	   	Int 		NOT NULL,					#采购人员 外键
DepartID	Int		NOT NULL,			#所属部门 外键
ProjextID	Int		NOT NULL,			#所属项目 外键
Maker		Varchar(20)	NOT NULL,		#制单人员
Permitter	Varchar(20)	NOT NULL,		#复核人员
DueTo		Varchar(20)	NOT NULL,		#账款归属
AccMonth	Date		NOT NULL,			#账款月份
UDef1		Varchar(50),				#自定栏一erp
UDef2		Varchar(50),				#自定栏二
Remark		Varchar(200),				#备注
checkstatus		Int	not null,			#默认为0	审核状态：0.未审核 1.已审核
checkdate		date	not null,			#审核日期
updatetime		date	not null			#修改日期


);


insert Int,o erp.suppliertype values( '20170928001','到货',3,1,1,'2017-09-28','SHJJ','RMB','1.0000',1,1,1,'Admin','Admin','SHJJ','2017-09-28','dfgd','dsfs','dsfsdfsdfsfdf');


insert Into erp.goodsrejected 
	(BillNo, 
	GatherStyle, 
	GetherDelay, 
	IsDeduct, 
	WareID, 
	BillDate, 
	CustID, 
	CurrID, 
	ExchRate, 
	SalesID, 
	DepartID, 
	ProjextID, 
	Maker, 
	Permitter, 
	DueTo, 
	AccMonth, 
	UDef1, 
	UDef2, 
	Remark,checkstatus,checkdate,updatetime
	)
	values
	('20170928001','到货',3,1,1,'2017-09-28','SHJJ','RMB','1.0000',1,1,1,'Admin','Admin','SHJJ','2017-09-28','dfgd','dsfs','dsfsdfsdfsfdf','0','2017-09-28','2017-09-28'
	);






create table goodsrejecteddetatl(
	BillNo			Varchar(30) 	NOT NULL,				#外键，退货主单
	ID			Int		not null,				#栏号
	ProdID			Varchar(50)	not null,				#物料编号
	Num			Int		not null,					#必须大于0	数量
	DiscountFirstPrice	Float		not null,					#折扣前单价
	Price			float		not null,					#单价
	broken			float		not null,					#折数
	money			float		not null,					#金额
	taxrate			float		not null,					#税率
	ThePrice		float		not null,					#税额
	theMoney		float		not null,					#含税金额
	complimentary		Int,							#是：0，否：1，默认1	赠品
	narration		Varchar(200),						#分录备注
	primary key(BillNo,ID)
);




insert Int,o erp.goodsrejecteddetatl 
	(BillNo, 
	ID, 
	ProdID, 
	Num, 
	DiscountFirstPrice, 
	Price, 
	broken, 
	money, 
	taxrate, 
	ThePrice, 
	theMoney, 
	complimentary, 
	narration
	)
	values
	('20170928001', 
	'1', 
	'001', 
	'1', 
	'2000', 
	'2000', 
	'2000', 
	'2000', 
	'17', 
	'1000', 
	'2000', 
	'1', 
	''
	);



create table supplier(
	ID			Varchar(50)	not null		primary key,	#供应商编号
	FundsAttribution	Varchar(50)	not null,				#账款归属
	ClassID			Int		not null,				#供应商类别编号
	AreaID			Varchar(20)	not null,				#地区
	AreaName		Varchar(100)	not null,				#地区名称
	CurrencyID		Varchar(20)	not null,				#币别
	FullName		Varchar(50)	not null,				#供应商全称
	TaxNo			Varchar(30),						#税务登记号
	ShortName		Varchar(20),						#供应商简称
	ChiefName		Varchar(30),						#负责人
	Capitalization		Float,							#默认0.00	资本额
	LinkMan			Varchar(20),						#联系人
	LinkManProf		Varchar(20),						#联系人职称
	Telephone1		Varchar(30),						#联系电话一
	Telephone2		Varchar(30),						#联系电话二
	Telephone3		Varchar(30),						#联系电话三
	MobileTel		Varchar(30),						#移动电话
	PersonID		Int		not null,				#采购人员
	PersonName		Varchar(30),						#人员姓名
	PriceofTax		Int		not null,				#未税为：0，含税为1	单价是否含税
	DaysOfBillexpire	Int,							#付款天数
	Addfield1		Varchar(50),						#自定栏一
	Addfield2		Varchar(50),						#自定栏二
	LatelyTradeDate		Date,							#最近采购入库日
	LatelyReturn		Date,							#最近采购退货日
	AccReceivable		Int,							#预付账款科目
	BankID			Int,							#开户银行
	CreditLevel		Varchar(20),						#信用等级
	AmountQuota		Float,							#默认0.00	账款额度
	RecvWay			Varchar(50)	not null,				#付款条件
	DistDays		Int,							#默认为0	货到付款天数
	DayOfClose		Date		not null,				#默认为31号	每月结账日
	DayOfRecv		Date,							#月结付款日
	InvalidDate		Date,							#终止交易日
	StartAdvRecv		float,							#期初预付款
	StartReceivable		float,							#期初应付款
	CurAdvRecv		float,							#期末预付款
	CurReceivable		float,							#期末应付款
	RemainQuota		float							#剩余额度

);



erp
insert into erp.supplier 
	(ID, 
	FundsAttribution, 
	ClassID, 
	AreaID, 
	AreaName, 
	CurrencyID, 
	FullName, 
	TaxNo, 
	ShortName, 
	ChiefName, 
	Capitalization, 
	LinkMan, 
	LinkManProf, 
	Telephone1, 
	Telephone2, 
	Telephone3, 
	MobileTel, 
	PersonID, 
	PersonName, 
	PriceofTax, 
	DaysOfBillexpire, 
	Addfield1, 
	Addfield2, 
	LatelyTradeDate, 
	LatelyReturn, 
	AccReceivable, 
	BankID, 
	CreditLevel, 
	AmountQuota, 
	RecvWay, 
	DistDays, 
	DayOfClose, 
	DayOfRecv, 
	InvalidDate, 
	StartAdvRecv, 
	StartReceivable, 
	CurAdvRecv, 
	CurReceivable, 
	RemainQuota
	)
	values
	('001', 
	'SHJJ', 
	'1', 
	'1', 
	'华中区', 
	'1', 
	'建坤科技有限公司', 
	'20312121215', 
	'建坤科技', 
	'牛屎', 
	'100000', 
	'龙经理', 
	'经理', 
	'18874340633', 
	'', 
	'', 
	'', 
	'1', 
	'牛采购', 
	'0', 
	'', 
	'', 
	'', 
	'', 
	'', 
	'', 
	'', 
	'A', 
	'0.00', 
	'货到付款', 
	'0', 
	'2017-09-30', 
	'', 
	'', 
	'0.00', 
	'0.00', 
	'0.00', 
	'0.00', 
	'0.00'
	);


