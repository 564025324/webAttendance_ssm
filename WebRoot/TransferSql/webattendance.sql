/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.53 : Database - webattendance
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`webattendance` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `webattendance`;

/*Table structure for table `askforleave` */

DROP TABLE IF EXISTS `askforleave`;

CREATE TABLE `askforleave` (
  `askForLeaveId` int(11) NOT NULL AUTO_INCREMENT COMMENT '请假公休加班表主键ID',
  `proposerId` int(11) DEFAULT NULL COMMENT '申请人ID(staffId)',
  `registrationTypeId` int(11) DEFAULT NULL COMMENT '登记类型ID(attendanceClassChildId)',
  `startDate` datetime DEFAULT NULL COMMENT '起始时间',
  `endDate` datetime DEFAULT NULL COMMENT '终止时间',
  `operationStaffId` int(11) DEFAULT NULL COMMENT '操作人ID(staffId)',
  `operatingTime` datetime DEFAULT NULL COMMENT '操作时间',
  `checkTime` datetime DEFAULT NULL COMMENT '审核时间',
  `checkManId` int(11) DEFAULT NULL COMMENT '审核人ID(staffId)',
  `remark` varchar(200) DEFAULT NULL COMMENT '申请原因',
  `checkTypeId` int(1) DEFAULT NULL COMMENT '处理状态id（对应属性明细表主键id）',
  `writeBack` varchar(200) DEFAULT NULL COMMENT '批示',
  `groupid` int(11) DEFAULT NULL COMMENT '班组id',
  `workNo` tinyint(4) DEFAULT NULL COMMENT '出差计出勤时间否',
  PRIMARY KEY (`askForLeaveId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `askforleave` */

insert  into `askforleave`(`askForLeaveId`,`proposerId`,`registrationTypeId`,`startDate`,`endDate`,`operationStaffId`,`operatingTime`,`checkTime`,`checkManId`,`remark`,`checkTypeId`,`writeBack`,`groupid`,`workNo`) values (23,26,17,'2017-03-15 11:43:00','2017-03-16 11:43:00',26,'2017-03-15 11:43:00','2017-03-15 11:43:00',26,'有急事',31,'',27,1);

/*Table structure for table `askforleavemx` */

DROP TABLE IF EXISTS `askforleavemx`;

CREATE TABLE `askforleavemx` (
  `askForLeaveMxId` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请加班班次表主键id',
  `positionClassesId` int(11) DEFAULT NULL COMMENT '对应班次表id',
  `askForLeaveId` int(11) DEFAULT NULL COMMENT '对应请假公休加班表主键ID',
  PRIMARY KEY (`askForLeaveMxId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `askforleavemx` */

/*Table structure for table `attendanceclasschild` */

DROP TABLE IF EXISTS `attendanceclasschild`;

CREATE TABLE `attendanceclasschild` (
  `attendanceClassChildId` int(11) NOT NULL AUTO_INCREMENT COMMENT '考勤类别明细表主键ID',
  `dealWithNumber` varchar(20) DEFAULT NULL COMMENT '处理结果编号',
  `dealWithName` varchar(20) DEFAULT NULL COMMENT '处理结果名称',
  `resultId` int(11) DEFAULT NULL COMMENT '处理结果单位ID(attributeGatherChildId)',
  `ignoreValue` int(11) DEFAULT NULL COMMENT '忽略不计值',
  `wayId` int(11) DEFAULT NULL COMMENT '舍入方式ID(attributeGatherChildId)',
  `attendanceCTypeId` int(11) DEFAULT NULL COMMENT '考勤类别id(属性明细表id)',
  `deleteNo` tinyint(1) DEFAULT NULL COMMENT '删除否',
  PRIMARY KEY (`attendanceClassChildId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `attendanceclasschild` */

insert  into `attendanceclasschild`(`attendanceClassChildId`,`dealWithNumber`,`dealWithName`,`resultId`,`ignoreValue`,`wayId`,`attendanceCTypeId`,`deleteNo`) values (1,'001','白班',17,2,20,9,0),(8,'002','夜班',17,2,20,9,0),(9,'0020','平时加班',17,2,20,10,0),(10,'0021','公休加班',17,2,20,10,0),(11,'0022','节日加班',17,2,20,10,0),(12,'0030','普通公休',16,2,20,11,0),(13,'0030','缺勤',17,2,20,15,0),(14,'0031','旷工',17,2,20,15,0),(16,'0056','外地出差',16,2,20,13,0),(17,'0023','平时请假',16,1,20,12,0);

/*Table structure for table `attributegather` */

DROP TABLE IF EXISTS `attributegather`;

CREATE TABLE `attributegather` (
  `attributeGatherId` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性集合表主键ID',
  `attributeGatherName` varchar(40) DEFAULT NULL COMMENT '属性集合ID',
  PRIMARY KEY (`attributeGatherId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `attributegather` */

insert  into `attributegather`(`attributeGatherId`,`attributeGatherName`) values (1,'职位状态'),(2,'职务'),(3,'班次类型'),(4,'考勤类别'),(5,'处理结果'),(6,'舍入方式'),(7,'班组'),(8,'签到方式'),(9,'处理结果状态');

/*Table structure for table `attributegatherchild` */

DROP TABLE IF EXISTS `attributegatherchild`;

CREATE TABLE `attributegatherchild` (
  `attributeGatherChildId` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性明细表主键ID',
  `Name` varchar(40) DEFAULT NULL COMMENT '属性明细表名称',
  `attributeGatherId` int(11) DEFAULT NULL COMMENT '属性集合ID',
  `deleteNo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`attributeGatherChildId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `attributegatherchild` */

insert  into `attributegatherchild`(`attributeGatherChildId`,`Name`,`attributeGatherId`,`deleteNo`) values (1,'在职',1,0),(2,'离职',1,0),(3,'待离职',1,0),(4,'董事长',2,0),(5,'经理',2,0),(6,'员工',2,0),(7,'正常班',3,0),(8,'不定时班',3,0),(9,'出勤类别',4,0),(10,'加班类别',4,0),(11,'公休类别',4,0),(12,'请假类别',4,0),(13,'出差类别',4,0),(14,'外出类别',4,0),(15,'缺勤类别',4,0),(16,'天',5,0),(17,'时',5,0),(19,'去尾',6,0),(20,'四舍五入',6,0),(22,'默认班组',7,0),(27,'精英班',7,0),(29,'指纹签到',8,0),(30,'人工签到',8,0),(31,'通过',9,0),(32,'不通过',9,0),(33,'未处理',9,0);

/*Table structure for table `classesgroup` */

DROP TABLE IF EXISTS `classesgroup`;

CREATE TABLE `classesgroup` (
  `classesGroupId` int(11) NOT NULL AUTO_INCREMENT COMMENT '班组班次表主键id',
  `positionClassesId` int(11) DEFAULT NULL COMMENT '职务班次表主键ID',
  `groupId` int(11) DEFAULT NULL COMMENT '班组id（属性明细表id）',
  PRIMARY KEY (`classesGroupId`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `classesgroup` */

insert  into `classesgroup`(`classesGroupId`,`positionClassesId`,`groupId`) values (66,13,22),(67,14,22),(71,15,22),(73,1,27),(74,3,27);

/*Table structure for table `classperiod` */

DROP TABLE IF EXISTS `classperiod`;

CREATE TABLE `classperiod` (
  `classPeriodId` int(11) NOT NULL AUTO_INCREMENT COMMENT '班段表主键ID',
  `goToWorkTime` time DEFAULT NULL COMMENT '上班时间',
  `timeFromWork` time DEFAULT NULL COMMENT '下班时间',
  `startChargeTime` time DEFAULT NULL COMMENT '起始刷卡时间',
  `endChargeTime` time DEFAULT NULL COMMENT '终止刷卡时间',
  `goToWorkChargeNo` tinyint(1) DEFAULT NULL COMMENT '上班需刷卡否',
  `timeFromWorkChargeNo` tinyint(1) DEFAULT NULL COMMENT '下班需刷卡否',
  `calculateLeftEarlyNo` tinyint(1) DEFAULT NULL COMMENT '计算迟到否',
  `calculateAbsenceNo` tinyint(1) DEFAULT NULL COMMENT '计算早退否',
  `positionClassesId` int(11) DEFAULT NULL COMMENT '职务班次表ID',
  `attendanceClassChildId` int(11) DEFAULT NULL COMMENT '考勤类别明细表ID',
  `deleteNo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`classPeriodId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `classperiod` */

insert  into `classperiod`(`classPeriodId`,`goToWorkTime`,`timeFromWork`,`startChargeTime`,`endChargeTime`,`goToWorkChargeNo`,`timeFromWorkChargeNo`,`calculateLeftEarlyNo`,`calculateAbsenceNo`,`positionClassesId`,`attendanceClassChildId`,`deleteNo`) values (25,'07:30:00','12:00:00','06:30:00','12:30:00',1,1,1,1,1,1,0),(27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,0),(28,'00:00:00','23:59:00',NULL,NULL,NULL,NULL,NULL,NULL,3,12,0),(29,'22:00:00','04:00:00','21:30:00','04:30:00',1,1,1,1,4,8,0);

/*Table structure for table `classperiodgoout` */

DROP TABLE IF EXISTS `classperiodgoout`;

CREATE TABLE `classperiodgoout` (
  `classPeriodGoOutId` int(11) NOT NULL AUTO_INCREMENT COMMENT '班段外出表主键id',
  `goOutTime` datetime DEFAULT NULL COMMENT '出去时间',
  `goBackTime` datetime DEFAULT NULL COMMENT '回来时间',
  `attendanceClassChildId` int(11) DEFAULT NULL COMMENT '考勤类别id(班段中途外出) ',
  `staffClassPeriodSignInRecordId` int(11) DEFAULT NULL COMMENT '员工班段签到记录表主键id',
  `remark` varchar(100) DEFAULT NULL COMMENT '外出原因',
  PRIMARY KEY (`classPeriodGoOutId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `classperiodgoout` */

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `departmentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '机构id',
  `number` varchar(10) DEFAULT NULL COMMENT '机构编号',
  `name` varchar(20) DEFAULT NULL COMMENT '机构名称',
  `fatherId` int(11) DEFAULT NULL COMMENT ' 父节点id',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`departmentId`,`number`,`name`,`fatherId`,`remark`) values (1,'001','科密集团',0,NULL),(2,'0011','人事部',1,NULL),(3,'0012','生产部',1,''),(15,'0009','曼达集团',0,'');

/*Table structure for table `gooutsystem` */

DROP TABLE IF EXISTS `gooutsystem`;

CREATE TABLE `gooutsystem` (
  `goOutSystemId` int(11) NOT NULL AUTO_INCREMENT COMMENT '外出制度表主键ID',
  `goOutTime` int(11) DEFAULT NULL COMMENT '班段中途大于多少分钟算外出',
  `goOutAbsenteeism` int(11) DEFAULT NULL COMMENT ' 班段中途外出大于多少分钟算缺勤',
  `TimeNo` tinyint(1) DEFAULT NULL COMMENT ' 外出是否同时计为出勤时间',
  `systemId` int(11) DEFAULT NULL COMMENT '制度表主键id',
  `deleteNo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`goOutSystemId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `gooutsystem` */

insert  into `gooutsystem`(`goOutSystemId`,`goOutTime`,`goOutAbsenteeism`,`TimeNo`,`systemId`,`deleteNo`) values (5,10,20,0,10,0),(9,10,20,0,12,0);

/*Table structure for table `lateandleaveearlysystem` */

DROP TABLE IF EXISTS `lateandleaveearlysystem`;

CREATE TABLE `lateandleaveearlysystem` (
  `lateAndLeaveEarlySystemId` int(11) NOT NULL AUTO_INCREMENT COMMENT '迟到早退制度表主键ID',
  `lateTime` int(11) DEFAULT NULL COMMENT '上班迟到弹性',
  `lateAbsenteeismTime` int(11) DEFAULT NULL COMMENT '上班缺勤弹性时间',
  `lateAndLeaveEarlyNo` tinyint(1) DEFAULT NULL COMMENT '迟到早退记出勤时间否 ',
  `LeaveEarlyTime` int(11) DEFAULT NULL COMMENT '下班早退弹性',
  `LeaveEarlyAbsenteeismTime` int(11) DEFAULT NULL COMMENT '下班缺勤弹性',
  `systemId` int(11) DEFAULT NULL COMMENT '制度表主键id',
  `deleteNo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`lateAndLeaveEarlySystemId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `lateandleaveearlysystem` */

insert  into `lateandleaveearlysystem`(`lateAndLeaveEarlySystemId`,`lateTime`,`lateAbsenteeismTime`,`lateAndLeaveEarlyNo`,`LeaveEarlyTime`,`LeaveEarlyAbsenteeismTime`,`systemId`,`deleteNo`) values (9,0,10,1,0,10,10,0),(10,0,10,0,0,10,12,0);

/*Table structure for table `notclassessystem` */

DROP TABLE IF EXISTS `notclassessystem`;

CREATE TABLE `notclassessystem` (
  `notClassesSystemId` int(11) NOT NULL AUTO_INCREMENT COMMENT '无班次考勤制度表主键ID',
  `fullDateTime` int(11) DEFAULT NULL COMMENT ' 满多少分钟计一天',
  `overtimeForOver` int(11) DEFAULT NULL COMMENT '超过多少分钟计加班',
  `longWorkTime` int(11) DEFAULT NULL COMMENT '单次上下班最长工作时间',
  `longWorkTimeToZero` int(11) DEFAULT NULL COMMENT '跨零点出勤时零点后的最长工作时间',
  `systemId` int(11) DEFAULT NULL COMMENT '制度表主键id',
  `deleteNo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`notClassesSystemId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `notclassessystem` */

insert  into `notclassessystem`(`notClassesSystemId`,`fullDateTime`,`overtimeForOver`,`longWorkTime`,`longWorkTimeToZero`,`systemId`,`deleteNo`) values (10,480,120,120,60,10,0),(14,480,120,120,60,12,0);

/*Table structure for table `otherstystem` */

DROP TABLE IF EXISTS `otherstystem`;

CREATE TABLE `otherstystem` (
  `otherStystemId` int(11) NOT NULL AUTO_INCREMENT COMMENT '其他制度表主键ID',
  `timeToOne` int(11) DEFAULT NULL COMMENT '多次刷卡在小于多少分钟只算第一次',
  `goOutAttendanceNo` tinyint(1) DEFAULT NULL COMMENT '出差是否同时计为出勤时间',
  `systemId` int(11) DEFAULT NULL COMMENT '考勤制度id',
  `deleteNo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`otherStystemId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `otherstystem` */

insert  into `otherstystem`(`otherStystemId`,`timeToOne`,`goOutAttendanceNo`,`systemId`,`deleteNo`) values (5,1,1,10,0),(9,1,1,12,0);

/*Table structure for table `overtimesystem` */

DROP TABLE IF EXISTS `overtimesystem`;

CREATE TABLE `overtimesystem` (
  `overtimeSystemId` int(11) NOT NULL AUTO_INCREMENT COMMENT '加班制度表主键ID',
  `overtime` int(11) DEFAULT NULL COMMENT '加班大于多少分钟有效',
  `earlyWorkToOvertimeNo` tinyint(1) DEFAULT NULL COMMENT '提前上班记加班否',
  `lateWorkToOvertiemNo` tinyint(1) DEFAULT NULL COMMENT '延迟下班记加班否',
  `systemId` int(11) DEFAULT NULL COMMENT '制度表主键id',
  `deleteNo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`overtimeSystemId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `overtimesystem` */

insert  into `overtimesystem`(`overtimeSystemId`,`overtime`,`earlyWorkToOvertimeNo`,`lateWorkToOvertiemNo`,`systemId`,`deleteNo`) values (10,10,1,0,10,0),(13,10,0,0,12,0);

/*Table structure for table `positionclasses` */

DROP TABLE IF EXISTS `positionclasses`;

CREATE TABLE `positionclasses` (
  `positionClassesId` int(11) NOT NULL AUTO_INCREMENT,
  `classesNumber` varchar(20) DEFAULT NULL,
  `classesName` varchar(20) DEFAULT NULL,
  `classTypeId` int(11) DEFAULT NULL COMMENT '班次类别id',
  `deleteNo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`positionClassesId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `positionclasses` */

insert  into `positionclasses`(`positionClassesId`,`classesNumber`,`classesName`,`classTypeId`,`deleteNo`) values (1,'008','白班',7,0),(2,'0081','不定时班',8,0),(3,'0082','普休',7,0),(4,'0083','夜班',7,0);

/*Table structure for table `power` */

DROP TABLE IF EXISTS `power`;

CREATE TABLE `power` (
  `powerId` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限表主键ID',
  `powerName` varchar(30) DEFAULT NULL COMMENT '权限名称',
  PRIMARY KEY (`powerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `power` */

/*Table structure for table `setholidays` */

DROP TABLE IF EXISTS `setholidays`;

CREATE TABLE `setholidays` (
  `holidaysId` int(11) NOT NULL AUTO_INCREMENT COMMENT '节假日设置表主键ID ',
  `holidayName` varchar(20) DEFAULT NULL COMMENT '节假日名称',
  `startDate` date DEFAULT NULL COMMENT '起始日期 ',
  `endDate` date DEFAULT NULL COMMENT '终止日期',
  `staffPositionId` int(11) DEFAULT NULL COMMENT '机构职务表ID',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`holidaysId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `setholidays` */

/*Table structure for table `shift` */

DROP TABLE IF EXISTS `shift`;

CREATE TABLE `shift` (
  `shiftId` int(11) NOT NULL AUTO_INCREMENT COMMENT '固定轮班表ID',
  `shiftNumber` varchar(20) DEFAULT NULL COMMENT '固定轮班编号',
  `shiftName` varchar(20) DEFAULT NULL COMMENT '固定轮班名称 ',
  `staffPositionId` int(11) DEFAULT NULL COMMENT '机构职务表ID',
  PRIMARY KEY (`shiftId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `shift` */

insert  into `shift`(`shiftId`,`shiftNumber`,`shiftName`,`staffPositionId`) values (16,'0098','15天一轮',1),(17,'','',-1);

/*Table structure for table `shiftchild` */

DROP TABLE IF EXISTS `shiftchild`;

CREATE TABLE `shiftchild` (
  `shiftChildId` int(11) NOT NULL AUTO_INCREMENT COMMENT '固定轮班明细表主键ID',
  `positionClassesId` int(11) DEFAULT NULL COMMENT '职务班次表ID',
  `rankOrder` int(11) DEFAULT NULL COMMENT '顺序',
  `shiftId` int(11) DEFAULT NULL COMMENT '固定轮班表ID',
  PRIMARY KEY (`shiftChildId`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

/*Data for the table `shiftchild` */

insert  into `shiftchild`(`shiftChildId`,`positionClassesId`,`rankOrder`,`shiftId`) values (126,15,1,8),(229,13,1,16),(230,13,2,16),(231,13,3,16),(232,13,4,16),(233,13,5,16),(234,13,6,16),(235,13,7,16),(236,13,8,16),(237,13,9,16),(238,13,10,16),(239,13,11,16),(240,13,12,16),(241,13,13,16),(242,13,14,16),(243,13,15,16);

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `staffId` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工表主键ID',
  `staffName` varchar(40) DEFAULT NULL COMMENT '员工姓名',
  `staffNumber` varchar(20) DEFAULT NULL COMMENT '员工姓名',
  `loginNumber` varchar(20) DEFAULT NULL COMMENT '登记号码',
  `idCar` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `email` varchar(30) DEFAULT NULL COMMENT '电子邮件',
  `cardNumber` varchar(20) DEFAULT NULL COMMENT '卡片号码',
  `dateOfEntry` date DEFAULT NULL COMMENT '入职日期',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `staffPositionId` int(11) DEFAULT NULL COMMENT '员工职务id',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名 ',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `headImage` varchar(150) DEFAULT NULL COMMENT '头像',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `positionTypeId` int(11) DEFAULT NULL COMMENT ' 职位状态id(在职/离职/待离职)',
  `leavedate` date DEFAULT NULL COMMENT '离职日期',
  `groupId` int(11) DEFAULT NULL COMMENT '班组id',
  `systemId` int(11) DEFAULT NULL COMMENT '考勤制度表主键id',
  PRIMARY KEY (`staffId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `staff` */

insert  into `staff`(`staffId`,`staffName`,`staffNumber`,`loginNumber`,`idCar`,`email`,`cardNumber`,`dateOfEntry`,`sex`,`staffPositionId`,`username`,`password`,`headImage`,`remark`,`positionTypeId`,`leavedate`,`groupId`,`systemId`) values (25,'陈冠希','008','安抚','440981199401068613','1293330122@qq.com','啊是否三','2016-11-16',1,8,'sa','123','headImg/df0ad025-10a5-409f-92bf-a71b4112be88.jpg','阿萨否',1,NULL,27,12),(26,'徐太庆','5555','2345','440981199312245112','2234543563@qq.com','2342','2016-11-16',0,8,'admin','123','headImg/75384e98-6dc0-4609-8163-2c3453df1bd5.jpg','',1,NULL,27,10),(27,'吴山','1232','123','440981199401068613','1293330122@qq.com','123','2016-12-13',1,8,'ok','123','headImg/5d9dfc33-16ed-490a-a44a-1aadefca60da.jpg','123',1,NULL,27,10);

/*Table structure for table `staffclassesrecord` */

DROP TABLE IF EXISTS `staffclassesrecord`;

CREATE TABLE `staffclassesrecord` (
  `staffClassesRecordId` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工班次记录表主键ID',
  `workDate` date DEFAULT NULL COMMENT '工作日期',
  `staffId` int(11) DEFAULT NULL COMMENT '员工ID ',
  `groupId` int(11) DEFAULT NULL COMMENT '班组id（属性明细表id）',
  `lateAndLeaveEarlySystemId` int(11) DEFAULT NULL COMMENT '迟到早退制度表主键ID',
  `overtimeSystemId` int(11) DEFAULT NULL COMMENT '加班制度表主键ID',
  `goOutSystemId` int(11) DEFAULT NULL COMMENT '外出制度表主键ID',
  `notClassesSystemId` int(11) DEFAULT NULL COMMENT '无班次考勤制度表主键ID',
  `otherStystemId` int(11) DEFAULT NULL COMMENT ' 其他制度表主键ID',
  PRIMARY KEY (`staffClassesRecordId`)
) ENGINE=InnoDB AUTO_INCREMENT=536 DEFAULT CHARSET=utf8;

/*Data for the table `staffclassesrecord` */

insert  into `staffclassesrecord`(`staffClassesRecordId`,`workDate`,`staffId`,`groupId`,`lateAndLeaveEarlySystemId`,`overtimeSystemId`,`goOutSystemId`,`notClassesSystemId`,`otherStystemId`) values (530,'2017-03-14',26,27,9,10,5,10,5),(531,'2017-03-14',25,27,10,13,9,14,9),(532,'2017-03-15',26,27,9,10,5,10,5),(533,'2017-03-16',26,27,9,10,5,10,5),(534,'2017-03-17',26,27,9,10,5,10,5);

/*Table structure for table `staffclassperiodsigninrecord` */

DROP TABLE IF EXISTS `staffclassperiodsigninrecord`;

CREATE TABLE `staffclassperiodsigninrecord` (
  `staffClassPeriodSignInRecordId` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工班段签到记录表主键ID',
  `signInTime` datetime DEFAULT NULL COMMENT '签到时间',
  `lateNo` tinyint(1) DEFAULT NULL COMMENT '迟到否',
  `signInWayId` int(11) DEFAULT NULL COMMENT '签到方式（属性明细表ID 人工签到 指纹签到）',
  `SignInNumber` varchar(20) DEFAULT NULL COMMENT '签到设备号',
  `signBackTime` datetime DEFAULT NULL COMMENT '签退时间',
  `leaveEarlyNo` tinyint(1) DEFAULT NULL COMMENT '早退否',
  `SignBackWayId` int(11) DEFAULT NULL COMMENT '签退方式（属性明细表ID 人工签到 指纹签到）',
  `signBackNumber` varchar(20) DEFAULT NULL COMMENT '签退设备号',
  `attendanceClassChildId` int(11) DEFAULT NULL COMMENT '考勤类别明细表ID（平时加班/请假/旷工/外出）',
  `classPeriodId` int(11) DEFAULT NULL COMMENT '班段ID',
  `staffClassesRecordId` int(11) DEFAULT NULL COMMENT '员工班次记录表主键ID',
  PRIMARY KEY (`staffClassPeriodSignInRecordId`)
) ENGINE=InnoDB AUTO_INCREMENT=970 DEFAULT CHARSET=utf8;

/*Data for the table `staffclassperiodsigninrecord` */

insert  into `staffclassperiodsigninrecord`(`staffClassPeriodSignInRecordId`,`signInTime`,`lateNo`,`signInWayId`,`SignInNumber`,`signBackTime`,`leaveEarlyNo`,`SignBackWayId`,`signBackNumber`,`attendanceClassChildId`,`classPeriodId`,`staffClassesRecordId`) values (964,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,25,530),(965,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,25,531),(966,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,28,532),(967,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,25,533),(968,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,25,534);

/*Table structure for table `staffposition` */

DROP TABLE IF EXISTS `staffposition`;

CREATE TABLE `staffposition` (
  `staffPositionId` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 机构职务表主键ID',
  `positionid` int(11) DEFAULT NULL COMMENT '职务名称',
  `departmentId` int(11) DEFAULT NULL COMMENT '机构ID',
  PRIMARY KEY (`staffPositionId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `staffposition` */

insert  into `staffposition`(`staffPositionId`,`positionid`,`departmentId`) values (1,4,3),(2,5,3),(4,6,3),(5,4,15),(6,5,15),(8,6,2),(9,4,1);

/*Table structure for table `staffpositionpower` */

DROP TABLE IF EXISTS `staffpositionpower`;

CREATE TABLE `staffpositionpower` (
  `staffPositionPowerId` int(11) NOT NULL AUTO_INCREMENT COMMENT '职务权限表主键ID',
  `staffPositionId` int(11) DEFAULT NULL COMMENT '机构职务表ID',
  `powerId` int(11) DEFAULT NULL COMMENT '权限表ID',
  PRIMARY KEY (`staffPositionPowerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `staffpositionpower` */

/*Table structure for table `staffretroactive` */

DROP TABLE IF EXISTS `staffretroactive`;

CREATE TABLE `staffretroactive` (
  `staffRetroactiveId` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工补签申请表主键ID',
  `staffClassesChildRecordId` int(11) DEFAULT NULL COMMENT '员工班段记录表ID',
  `SignInTime` datetime DEFAULT NULL COMMENT '签到时间',
  `toAndFrom` tinyint(1) DEFAULT NULL COMMENT '上下班',
  `operationStaffId` int(11) DEFAULT NULL COMMENT '操作人ID（员工ID {可以是员工或管理者}）',
  `SignInWayId` int(11) DEFAULT NULL COMMENT '签到方式ID',
  `operatingTime` datetime DEFAULT NULL COMMENT '操作时间',
  `checkmanId` int(11) DEFAULT NULL COMMENT '审核人ID(staffId)',
  `checkTime` datetime DEFAULT NULL COMMENT '审核时间',
  `checkStateId` int(11) DEFAULT NULL COMMENT '审核状态ID(attributeGatherChildId)',
  `applyForReason` varchar(100) DEFAULT NULL COMMENT '申请原因',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`staffRetroactiveId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `staffretroactive` */

/*Table structure for table `system` */

DROP TABLE IF EXISTS `system`;

CREATE TABLE `system` (
  `systemId` int(11) NOT NULL AUTO_INCREMENT COMMENT '考勤制度表',
  `systemNumber` varchar(20) DEFAULT NULL COMMENT '制度编号',
  `systemName` varchar(40) DEFAULT NULL COMMENT '制度名称',
  `deleteNo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`systemId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `system` */

insert  into `system`(`systemId`,`systemNumber`,`systemName`,`deleteNo`) values (10,'008','广州分制度',0),(12,'009','深圳分制度',0);

/*Table structure for table `tb` */

DROP TABLE IF EXISTS `tb`;

CREATE TABLE `tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value1` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `tb` */

insert  into `tb`(`id`,`value1`) values (1,3),(2,4),(3,1),(4,1),(5,1),(6,1),(7,1);

/*Table structure for table `tb2` */

DROP TABLE IF EXISTS `tb2`;

CREATE TABLE `tb2` (
  `id` int(11) DEFAULT NULL,
  `zhi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb2` */

insert  into `tb2`(`id`,`zhi`) values (1,3),(2,5);

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `install` int(10) unsigned NOT NULL,
  `day` int(10) unsigned NOT NULL,
  `aid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `test` */

insert  into `test`(`id`,`install`,`day`,`aid`) values (1,1232,20080808,1),(2,2321,20080809,2),(3,1236,20080810,3),(5,4212,20080809,1),(6,2312,20080810,1),(7,1432,20080811,1),(8,2421,20080808,2),(9,4245,20080811,2),(10,5654,20080810,2),(11,412,20080808,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
