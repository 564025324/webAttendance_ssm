/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50162
Source Host           : localhost:3306
Source Database       : webattendance

Target Server Type    : SQL Server
Target Server Version : 100000
File Encoding         : 65001

Date: 2017-09-22 00:54:17
*/


GO

-- ----------------------------
-- Table structure for [askforleave]
-- ----------------------------
DROP TABLE [askforleave]
GO
CREATE TABLE [askforleave] (
[askForLeaveId] int NOT NULL ,
[proposerId] int NULL ,
[registrationTypeId] int NULL ,
[startDate] datetime2 NULL ,
[endDate] datetime2 NULL ,
[operationStaffId] int NULL ,
[operatingTime] datetime2 NULL ,
[checkTime] datetime2 NULL ,
[checkManId] int NULL ,
[remark] nvarchar(200) NULL ,
[checkTypeId] int NULL ,
[writeBack] nvarchar(200) NULL ,
[groupid] int NULL ,
[workNo] tinyint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleave', 
'COLUMN', N'askForLeaveId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'请假公休加班表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'askForLeaveId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'请假公休加班表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'askForLeaveId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleave', 
'COLUMN', N'proposerId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'申请人ID(staffId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'proposerId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'申请人ID(staffId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'proposerId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleave', 
'COLUMN', N'registrationTypeId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'登记类型ID(attendanceClassChildId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'registrationTypeId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登记类型ID(attendanceClassChildId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'registrationTypeId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleave', 
'COLUMN', N'startDate')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'起始时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'startDate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'起始时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'startDate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleave', 
'COLUMN', N'endDate')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'终止时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'endDate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'终止时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'endDate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleave', 
'COLUMN', N'operationStaffId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'操作人ID(staffId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'operationStaffId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'操作人ID(staffId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'operationStaffId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleave', 
'COLUMN', N'operatingTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'操作时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'operatingTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'操作时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'operatingTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleave', 
'COLUMN', N'checkTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'审核时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'checkTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'审核时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'checkTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleave', 
'COLUMN', N'checkManId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'审核人ID(staffId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'checkManId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'审核人ID(staffId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'checkManId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleave', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'申请原因'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'申请原因'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleave', 
'COLUMN', N'checkTypeId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'处理状态id（对应属性明细表主键id）'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'checkTypeId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'处理状态id（对应属性明细表主键id）'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'checkTypeId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleave', 
'COLUMN', N'writeBack')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'批示'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'writeBack'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'批示'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'writeBack'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleave', 
'COLUMN', N'groupid')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'班组id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'groupid'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'班组id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'groupid'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleave', 
'COLUMN', N'workNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'出差计出勤时间否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'workNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'出差计出勤时间否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleave'
, @level2type = 'COLUMN', @level2name = N'workNo'
GO

-- ----------------------------
-- Records of askforleave
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [askforleave] ([askForLeaveId], [proposerId], [registrationTypeId], [startDate], [endDate], [operationStaffId], [operatingTime], [checkTime], [checkManId], [remark], [checkTypeId], [writeBack], [groupid], [workNo]) VALUES (N'23', N'26', N'17', '2017-03-15 11:43:00', '2017-03-16 11:43:00', N'26', '2017-03-15 11:43:00', '2017-03-15 11:43:00', N'26', N'有急事', N'31', N'', N'27', N'1');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [askforleavemx]
-- ----------------------------
DROP TABLE [askforleavemx]
GO
CREATE TABLE [askforleavemx] (
[askForLeaveMxId] int NOT NULL ,
[positionClassesId] int NULL ,
[askForLeaveId] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleavemx', 
'COLUMN', N'askForLeaveMxId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'申请加班班次表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleavemx'
, @level2type = 'COLUMN', @level2name = N'askForLeaveMxId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'申请加班班次表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleavemx'
, @level2type = 'COLUMN', @level2name = N'askForLeaveMxId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleavemx', 
'COLUMN', N'positionClassesId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'对应班次表id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleavemx'
, @level2type = 'COLUMN', @level2name = N'positionClassesId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'对应班次表id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleavemx'
, @level2type = 'COLUMN', @level2name = N'positionClassesId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'askforleavemx', 
'COLUMN', N'askForLeaveId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'对应请假公休加班表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleavemx'
, @level2type = 'COLUMN', @level2name = N'askForLeaveId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'对应请假公休加班表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'askforleavemx'
, @level2type = 'COLUMN', @level2name = N'askForLeaveId'
GO

-- ----------------------------
-- Records of askforleavemx
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [attendanceclasschild]
-- ----------------------------
DROP TABLE [attendanceclasschild]
GO
CREATE TABLE [attendanceclasschild] (
[attendanceClassChildId] int NOT NULL ,
[dealWithNumber] nvarchar(20) NULL ,
[dealWithName] nvarchar(20) NULL ,
[resultId] int NULL ,
[ignoreValue] int NULL ,
[wayId] int NULL ,
[attendanceCTypeId] int NULL ,
[deleteNo] tinyint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'attendanceclasschild', 
'COLUMN', N'attendanceClassChildId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'考勤类别明细表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'attendanceClassChildId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'考勤类别明细表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'attendanceClassChildId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'attendanceclasschild', 
'COLUMN', N'dealWithNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'处理结果编号'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'dealWithNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'处理结果编号'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'dealWithNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'attendanceclasschild', 
'COLUMN', N'dealWithName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'处理结果名称'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'dealWithName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'处理结果名称'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'dealWithName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'attendanceclasschild', 
'COLUMN', N'resultId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'处理结果单位ID(attributeGatherChildId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'resultId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'处理结果单位ID(attributeGatherChildId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'resultId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'attendanceclasschild', 
'COLUMN', N'ignoreValue')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'忽略不计值'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'ignoreValue'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'忽略不计值'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'ignoreValue'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'attendanceclasschild', 
'COLUMN', N'wayId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'舍入方式ID(attributeGatherChildId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'wayId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'舍入方式ID(attributeGatherChildId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'wayId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'attendanceclasschild', 
'COLUMN', N'attendanceCTypeId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'考勤类别id(属性明细表id)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'attendanceCTypeId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'考勤类别id(属性明细表id)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'attendanceCTypeId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'attendanceclasschild', 
'COLUMN', N'deleteNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'deleteNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attendanceclasschild'
, @level2type = 'COLUMN', @level2name = N'deleteNo'
GO

-- ----------------------------
-- Records of attendanceclasschild
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [attendanceclasschild] ([attendanceClassChildId], [dealWithNumber], [dealWithName], [resultId], [ignoreValue], [wayId], [attendanceCTypeId], [deleteNo]) VALUES (N'1', N'001', N'白班', N'17', N'2', N'20', N'9', N'0');
INSERT INTO [attendanceclasschild] ([attendanceClassChildId], [dealWithNumber], [dealWithName], [resultId], [ignoreValue], [wayId], [attendanceCTypeId], [deleteNo]) VALUES (N'8', N'002', N'夜班', N'17', N'2', N'20', N'9', N'0');
INSERT INTO [attendanceclasschild] ([attendanceClassChildId], [dealWithNumber], [dealWithName], [resultId], [ignoreValue], [wayId], [attendanceCTypeId], [deleteNo]) VALUES (N'9', N'0020', N'平时加班', N'17', N'2', N'20', N'10', N'0');
INSERT INTO [attendanceclasschild] ([attendanceClassChildId], [dealWithNumber], [dealWithName], [resultId], [ignoreValue], [wayId], [attendanceCTypeId], [deleteNo]) VALUES (N'10', N'0021', N'公休加班', N'17', N'2', N'20', N'10', N'0');
INSERT INTO [attendanceclasschild] ([attendanceClassChildId], [dealWithNumber], [dealWithName], [resultId], [ignoreValue], [wayId], [attendanceCTypeId], [deleteNo]) VALUES (N'11', N'0022', N'节日加班', N'17', N'2', N'20', N'10', N'0');
INSERT INTO [attendanceclasschild] ([attendanceClassChildId], [dealWithNumber], [dealWithName], [resultId], [ignoreValue], [wayId], [attendanceCTypeId], [deleteNo]) VALUES (N'12', N'0030', N'普通公休', N'16', N'2', N'20', N'11', N'0');
INSERT INTO [attendanceclasschild] ([attendanceClassChildId], [dealWithNumber], [dealWithName], [resultId], [ignoreValue], [wayId], [attendanceCTypeId], [deleteNo]) VALUES (N'13', N'0030', N'缺勤', N'17', N'2', N'20', N'15', N'0');
INSERT INTO [attendanceclasschild] ([attendanceClassChildId], [dealWithNumber], [dealWithName], [resultId], [ignoreValue], [wayId], [attendanceCTypeId], [deleteNo]) VALUES (N'14', N'0031', N'旷工', N'17', N'2', N'20', N'15', N'0');
INSERT INTO [attendanceclasschild] ([attendanceClassChildId], [dealWithNumber], [dealWithName], [resultId], [ignoreValue], [wayId], [attendanceCTypeId], [deleteNo]) VALUES (N'16', N'0056', N'外地出差', N'16', N'2', N'20', N'13', N'0');
INSERT INTO [attendanceclasschild] ([attendanceClassChildId], [dealWithNumber], [dealWithName], [resultId], [ignoreValue], [wayId], [attendanceCTypeId], [deleteNo]) VALUES (N'17', N'0023', N'平时请假', N'16', N'1', N'20', N'12', N'0');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [attributegather]
-- ----------------------------
DROP TABLE [attributegather]
GO
CREATE TABLE [attributegather] (
[attributeGatherId] int NOT NULL ,
[attributeGatherName] nvarchar(40) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'attributegather', 
'COLUMN', N'attributeGatherId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'属性集合表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attributegather'
, @level2type = 'COLUMN', @level2name = N'attributeGatherId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'属性集合表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attributegather'
, @level2type = 'COLUMN', @level2name = N'attributeGatherId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'attributegather', 
'COLUMN', N'attributeGatherName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'属性集合ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attributegather'
, @level2type = 'COLUMN', @level2name = N'attributeGatherName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'属性集合ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attributegather'
, @level2type = 'COLUMN', @level2name = N'attributeGatherName'
GO

-- ----------------------------
-- Records of attributegather
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [attributegather] ([attributeGatherId], [attributeGatherName]) VALUES (N'1', N'职位状态');
INSERT INTO [attributegather] ([attributeGatherId], [attributeGatherName]) VALUES (N'2', N'职务');
INSERT INTO [attributegather] ([attributeGatherId], [attributeGatherName]) VALUES (N'3', N'班次类型');
INSERT INTO [attributegather] ([attributeGatherId], [attributeGatherName]) VALUES (N'4', N'考勤类别');
INSERT INTO [attributegather] ([attributeGatherId], [attributeGatherName]) VALUES (N'5', N'处理结果');
INSERT INTO [attributegather] ([attributeGatherId], [attributeGatherName]) VALUES (N'6', N'舍入方式');
INSERT INTO [attributegather] ([attributeGatherId], [attributeGatherName]) VALUES (N'7', N'班组');
INSERT INTO [attributegather] ([attributeGatherId], [attributeGatherName]) VALUES (N'8', N'签到方式');
INSERT INTO [attributegather] ([attributeGatherId], [attributeGatherName]) VALUES (N'9', N'处理结果状态');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [attributegatherchild]
-- ----------------------------
DROP TABLE [attributegatherchild]
GO
CREATE TABLE [attributegatherchild] (
[attributeGatherChildId] int NOT NULL ,
[Name] nvarchar(40) NULL ,
[attributeGatherId] int NULL ,
[deleteNo] tinyint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'attributegatherchild', 
'COLUMN', N'attributeGatherChildId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'属性明细表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attributegatherchild'
, @level2type = 'COLUMN', @level2name = N'attributeGatherChildId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'属性明细表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attributegatherchild'
, @level2type = 'COLUMN', @level2name = N'attributeGatherChildId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'attributegatherchild', 
'COLUMN', N'Name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'属性明细表名称'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attributegatherchild'
, @level2type = 'COLUMN', @level2name = N'Name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'属性明细表名称'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attributegatherchild'
, @level2type = 'COLUMN', @level2name = N'Name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'attributegatherchild', 
'COLUMN', N'attributeGatherId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'属性集合ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attributegatherchild'
, @level2type = 'COLUMN', @level2name = N'attributeGatherId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'属性集合ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'attributegatherchild'
, @level2type = 'COLUMN', @level2name = N'attributeGatherId'
GO

-- ----------------------------
-- Records of attributegatherchild
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'1', N'在职', N'1', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'2', N'离职', N'1', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'3', N'待离职', N'1', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'4', N'董事长', N'2', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'5', N'经理', N'2', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'6', N'员工', N'2', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'7', N'正常班', N'3', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'8', N'不定时班', N'3', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'9', N'出勤类别', N'4', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'10', N'加班类别', N'4', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'11', N'公休类别', N'4', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'12', N'请假类别', N'4', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'13', N'出差类别', N'4', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'14', N'外出类别', N'4', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'15', N'缺勤类别', N'4', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'16', N'天', N'5', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'17', N'时', N'5', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'19', N'去尾', N'6', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'20', N'四舍五入', N'6', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'22', N'默认班组', N'7', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'27', N'精英班', N'7', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'29', N'指纹签到', N'8', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'30', N'人工签到', N'8', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'31', N'通过', N'9', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'32', N'不通过', N'9', N'0');
INSERT INTO [attributegatherchild] ([attributeGatherChildId], [Name], [attributeGatherId], [deleteNo]) VALUES (N'33', N'未处理', N'9', N'0');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [classesgroup]
-- ----------------------------
DROP TABLE [classesgroup]
GO
CREATE TABLE [classesgroup] (
[classesGroupId] int NOT NULL ,
[positionClassesId] int NULL ,
[groupId] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classesgroup', 
'COLUMN', N'classesGroupId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'班组班次表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classesgroup'
, @level2type = 'COLUMN', @level2name = N'classesGroupId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'班组班次表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classesgroup'
, @level2type = 'COLUMN', @level2name = N'classesGroupId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classesgroup', 
'COLUMN', N'positionClassesId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'职务班次表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classesgroup'
, @level2type = 'COLUMN', @level2name = N'positionClassesId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'职务班次表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classesgroup'
, @level2type = 'COLUMN', @level2name = N'positionClassesId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classesgroup', 
'COLUMN', N'groupId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'班组id（属性明细表id）'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classesgroup'
, @level2type = 'COLUMN', @level2name = N'groupId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'班组id（属性明细表id）'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classesgroup'
, @level2type = 'COLUMN', @level2name = N'groupId'
GO

-- ----------------------------
-- Records of classesgroup
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [classesgroup] ([classesGroupId], [positionClassesId], [groupId]) VALUES (N'66', N'13', N'22');
INSERT INTO [classesgroup] ([classesGroupId], [positionClassesId], [groupId]) VALUES (N'67', N'14', N'22');
INSERT INTO [classesgroup] ([classesGroupId], [positionClassesId], [groupId]) VALUES (N'71', N'15', N'22');
INSERT INTO [classesgroup] ([classesGroupId], [positionClassesId], [groupId]) VALUES (N'73', N'1', N'27');
INSERT INTO [classesgroup] ([classesGroupId], [positionClassesId], [groupId]) VALUES (N'74', N'3', N'27');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [classperiod]
-- ----------------------------
DROP TABLE [classperiod]
GO
CREATE TABLE [classperiod] (
[classPeriodId] int NOT NULL ,
[goToWorkTime] time NULL ,
[timeFromWork] time NULL ,
[startChargeTime] time NULL ,
[endChargeTime] time NULL ,
[goToWorkChargeNo] tinyint NULL ,
[timeFromWorkChargeNo] tinyint NULL ,
[calculateLeftEarlyNo] tinyint NULL ,
[calculateAbsenceNo] tinyint NULL ,
[positionClassesId] int NULL ,
[attendanceClassChildId] int NULL ,
[deleteNo] tinyint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiod', 
'COLUMN', N'classPeriodId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'班段表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'classPeriodId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'班段表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'classPeriodId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiod', 
'COLUMN', N'goToWorkTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上班时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'goToWorkTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上班时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'goToWorkTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiod', 
'COLUMN', N'timeFromWork')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'下班时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'timeFromWork'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'下班时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'timeFromWork'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiod', 
'COLUMN', N'startChargeTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'起始刷卡时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'startChargeTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'起始刷卡时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'startChargeTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiod', 
'COLUMN', N'endChargeTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'终止刷卡时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'endChargeTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'终止刷卡时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'endChargeTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiod', 
'COLUMN', N'goToWorkChargeNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上班需刷卡否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'goToWorkChargeNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上班需刷卡否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'goToWorkChargeNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiod', 
'COLUMN', N'timeFromWorkChargeNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'下班需刷卡否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'timeFromWorkChargeNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'下班需刷卡否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'timeFromWorkChargeNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiod', 
'COLUMN', N'calculateLeftEarlyNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'计算迟到否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'calculateLeftEarlyNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'计算迟到否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'calculateLeftEarlyNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiod', 
'COLUMN', N'calculateAbsenceNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'计算早退否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'calculateAbsenceNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'计算早退否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'calculateAbsenceNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiod', 
'COLUMN', N'positionClassesId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'职务班次表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'positionClassesId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'职务班次表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'positionClassesId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiod', 
'COLUMN', N'attendanceClassChildId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'考勤类别明细表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'attendanceClassChildId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'考勤类别明细表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiod'
, @level2type = 'COLUMN', @level2name = N'attendanceClassChildId'
GO

-- ----------------------------
-- Records of classperiod
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [classperiod] ([classPeriodId], [goToWorkTime], [timeFromWork], [startChargeTime], [endChargeTime], [goToWorkChargeNo], [timeFromWorkChargeNo], [calculateLeftEarlyNo], [calculateAbsenceNo], [positionClassesId], [attendanceClassChildId], [deleteNo]) VALUES (N'25', '07:30:00', '12:00:00', '06:30:00', '12:30:00', N'1', N'1', N'1', N'1', N'1', N'1', N'0');
INSERT INTO [classperiod] ([classPeriodId], [goToWorkTime], [timeFromWork], [startChargeTime], [endChargeTime], [goToWorkChargeNo], [timeFromWorkChargeNo], [calculateLeftEarlyNo], [calculateAbsenceNo], [positionClassesId], [attendanceClassChildId], [deleteNo]) VALUES (N'27', null, null, null, null, null, null, null, null, N'2', N'1', N'0');
INSERT INTO [classperiod] ([classPeriodId], [goToWorkTime], [timeFromWork], [startChargeTime], [endChargeTime], [goToWorkChargeNo], [timeFromWorkChargeNo], [calculateLeftEarlyNo], [calculateAbsenceNo], [positionClassesId], [attendanceClassChildId], [deleteNo]) VALUES (N'28', '00:00:00', '23:59:00', null, null, null, null, null, null, N'3', N'12', N'0');
INSERT INTO [classperiod] ([classPeriodId], [goToWorkTime], [timeFromWork], [startChargeTime], [endChargeTime], [goToWorkChargeNo], [timeFromWorkChargeNo], [calculateLeftEarlyNo], [calculateAbsenceNo], [positionClassesId], [attendanceClassChildId], [deleteNo]) VALUES (N'29', '22:00:00', '04:00:00', '21:30:00', '04:30:00', N'1', N'1', N'1', N'1', N'4', N'8', N'0');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [classperiodgoout]
-- ----------------------------
DROP TABLE [classperiodgoout]
GO
CREATE TABLE [classperiodgoout] (
[classPeriodGoOutId] int NOT NULL ,
[goOutTime] datetime2 NULL ,
[goBackTime] datetime2 NULL ,
[attendanceClassChildId] int NULL ,
[staffClassPeriodSignInRecordId] int NULL ,
[remark] nvarchar(100) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiodgoout', 
'COLUMN', N'classPeriodGoOutId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'班段外出表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiodgoout'
, @level2type = 'COLUMN', @level2name = N'classPeriodGoOutId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'班段外出表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiodgoout'
, @level2type = 'COLUMN', @level2name = N'classPeriodGoOutId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiodgoout', 
'COLUMN', N'goOutTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'出去时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiodgoout'
, @level2type = 'COLUMN', @level2name = N'goOutTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'出去时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiodgoout'
, @level2type = 'COLUMN', @level2name = N'goOutTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiodgoout', 
'COLUMN', N'goBackTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'回来时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiodgoout'
, @level2type = 'COLUMN', @level2name = N'goBackTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'回来时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiodgoout'
, @level2type = 'COLUMN', @level2name = N'goBackTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiodgoout', 
'COLUMN', N'attendanceClassChildId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'考勤类别id(班段中途外出) '
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiodgoout'
, @level2type = 'COLUMN', @level2name = N'attendanceClassChildId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'考勤类别id(班段中途外出) '
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiodgoout'
, @level2type = 'COLUMN', @level2name = N'attendanceClassChildId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiodgoout', 
'COLUMN', N'staffClassPeriodSignInRecordId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'员工班段签到记录表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiodgoout'
, @level2type = 'COLUMN', @level2name = N'staffClassPeriodSignInRecordId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'员工班段签到记录表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiodgoout'
, @level2type = 'COLUMN', @level2name = N'staffClassPeriodSignInRecordId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'classperiodgoout', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'外出原因'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiodgoout'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'外出原因'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'classperiodgoout'
, @level2type = 'COLUMN', @level2name = N'remark'
GO

-- ----------------------------
-- Records of classperiodgoout
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [department]
-- ----------------------------
DROP TABLE [department]
GO
CREATE TABLE [department] (
[departmentId] int NOT NULL ,
[number] nvarchar(10) NULL ,
[name] nvarchar(20) NULL ,
[fatherId] int NULL ,
[remark] nvarchar(100) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'department', 
'COLUMN', N'departmentId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'机构id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'department'
, @level2type = 'COLUMN', @level2name = N'departmentId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'机构id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'department'
, @level2type = 'COLUMN', @level2name = N'departmentId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'department', 
'COLUMN', N'number')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'机构编号'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'department'
, @level2type = 'COLUMN', @level2name = N'number'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'机构编号'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'department'
, @level2type = 'COLUMN', @level2name = N'number'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'department', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'机构名称'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'department'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'机构名称'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'department'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'department', 
'COLUMN', N'fatherId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N' 父节点id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'department'
, @level2type = 'COLUMN', @level2name = N'fatherId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N' 父节点id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'department'
, @level2type = 'COLUMN', @level2name = N'fatherId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'department', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'department'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'department'
, @level2type = 'COLUMN', @level2name = N'remark'
GO

-- ----------------------------
-- Records of department
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [department] ([departmentId], [number], [name], [fatherId], [remark]) VALUES (N'1', N'001', N'科密集团', N'0', null);
INSERT INTO [department] ([departmentId], [number], [name], [fatherId], [remark]) VALUES (N'2', N'0011', N'人事部', N'1', null);
INSERT INTO [department] ([departmentId], [number], [name], [fatherId], [remark]) VALUES (N'3', N'0012', N'生产部', N'1', N'');
INSERT INTO [department] ([departmentId], [number], [name], [fatherId], [remark]) VALUES (N'15', N'0009', N'曼达集团', N'0', N'');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [gooutsystem]
-- ----------------------------
DROP TABLE [gooutsystem]
GO
CREATE TABLE [gooutsystem] (
[goOutSystemId] int NOT NULL ,
[goOutTime] int NULL ,
[goOutAbsenteeism] int NULL ,
[TimeNo] tinyint NULL ,
[systemId] int NULL ,
[deleteNo] tinyint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'gooutsystem', 
'COLUMN', N'goOutSystemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'外出制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'gooutsystem'
, @level2type = 'COLUMN', @level2name = N'goOutSystemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'外出制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'gooutsystem'
, @level2type = 'COLUMN', @level2name = N'goOutSystemId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'gooutsystem', 
'COLUMN', N'goOutTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'班段中途大于多少分钟算外出'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'gooutsystem'
, @level2type = 'COLUMN', @level2name = N'goOutTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'班段中途大于多少分钟算外出'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'gooutsystem'
, @level2type = 'COLUMN', @level2name = N'goOutTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'gooutsystem', 
'COLUMN', N'goOutAbsenteeism')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N' 班段中途外出大于多少分钟算缺勤'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'gooutsystem'
, @level2type = 'COLUMN', @level2name = N'goOutAbsenteeism'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N' 班段中途外出大于多少分钟算缺勤'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'gooutsystem'
, @level2type = 'COLUMN', @level2name = N'goOutAbsenteeism'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'gooutsystem', 
'COLUMN', N'TimeNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N' 外出是否同时计为出勤时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'gooutsystem'
, @level2type = 'COLUMN', @level2name = N'TimeNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N' 外出是否同时计为出勤时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'gooutsystem'
, @level2type = 'COLUMN', @level2name = N'TimeNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'gooutsystem', 
'COLUMN', N'systemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'制度表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'gooutsystem'
, @level2type = 'COLUMN', @level2name = N'systemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'制度表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'gooutsystem'
, @level2type = 'COLUMN', @level2name = N'systemId'
GO

-- ----------------------------
-- Records of gooutsystem
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [gooutsystem] ([goOutSystemId], [goOutTime], [goOutAbsenteeism], [TimeNo], [systemId], [deleteNo]) VALUES (N'5', N'10', N'20', N'0', N'10', N'0');
INSERT INTO [gooutsystem] ([goOutSystemId], [goOutTime], [goOutAbsenteeism], [TimeNo], [systemId], [deleteNo]) VALUES (N'9', N'10', N'20', N'0', N'12', N'0');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [lateandleaveearlysystem]
-- ----------------------------
DROP TABLE [lateandleaveearlysystem]
GO
CREATE TABLE [lateandleaveearlysystem] (
[lateAndLeaveEarlySystemId] int NOT NULL ,
[lateTime] int NULL ,
[lateAbsenteeismTime] int NULL ,
[lateAndLeaveEarlyNo] tinyint NULL ,
[LeaveEarlyTime] int NULL ,
[LeaveEarlyAbsenteeismTime] int NULL ,
[systemId] int NULL ,
[deleteNo] tinyint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'lateandleaveearlysystem', 
'COLUMN', N'lateAndLeaveEarlySystemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'迟到早退制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'lateandleaveearlysystem'
, @level2type = 'COLUMN', @level2name = N'lateAndLeaveEarlySystemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'迟到早退制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'lateandleaveearlysystem'
, @level2type = 'COLUMN', @level2name = N'lateAndLeaveEarlySystemId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'lateandleaveearlysystem', 
'COLUMN', N'lateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上班迟到弹性'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'lateandleaveearlysystem'
, @level2type = 'COLUMN', @level2name = N'lateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上班迟到弹性'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'lateandleaveearlysystem'
, @level2type = 'COLUMN', @level2name = N'lateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'lateandleaveearlysystem', 
'COLUMN', N'lateAbsenteeismTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上班缺勤弹性时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'lateandleaveearlysystem'
, @level2type = 'COLUMN', @level2name = N'lateAbsenteeismTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上班缺勤弹性时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'lateandleaveearlysystem'
, @level2type = 'COLUMN', @level2name = N'lateAbsenteeismTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'lateandleaveearlysystem', 
'COLUMN', N'lateAndLeaveEarlyNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'迟到早退记出勤时间否 '
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'lateandleaveearlysystem'
, @level2type = 'COLUMN', @level2name = N'lateAndLeaveEarlyNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'迟到早退记出勤时间否 '
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'lateandleaveearlysystem'
, @level2type = 'COLUMN', @level2name = N'lateAndLeaveEarlyNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'lateandleaveearlysystem', 
'COLUMN', N'LeaveEarlyTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'下班早退弹性'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'lateandleaveearlysystem'
, @level2type = 'COLUMN', @level2name = N'LeaveEarlyTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'下班早退弹性'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'lateandleaveearlysystem'
, @level2type = 'COLUMN', @level2name = N'LeaveEarlyTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'lateandleaveearlysystem', 
'COLUMN', N'LeaveEarlyAbsenteeismTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'下班缺勤弹性'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'lateandleaveearlysystem'
, @level2type = 'COLUMN', @level2name = N'LeaveEarlyAbsenteeismTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'下班缺勤弹性'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'lateandleaveearlysystem'
, @level2type = 'COLUMN', @level2name = N'LeaveEarlyAbsenteeismTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'lateandleaveearlysystem', 
'COLUMN', N'systemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'制度表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'lateandleaveearlysystem'
, @level2type = 'COLUMN', @level2name = N'systemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'制度表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'lateandleaveearlysystem'
, @level2type = 'COLUMN', @level2name = N'systemId'
GO

-- ----------------------------
-- Records of lateandleaveearlysystem
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [lateandleaveearlysystem] ([lateAndLeaveEarlySystemId], [lateTime], [lateAbsenteeismTime], [lateAndLeaveEarlyNo], [LeaveEarlyTime], [LeaveEarlyAbsenteeismTime], [systemId], [deleteNo]) VALUES (N'9', N'0', N'10', N'1', N'0', N'10', N'10', N'0');
INSERT INTO [lateandleaveearlysystem] ([lateAndLeaveEarlySystemId], [lateTime], [lateAbsenteeismTime], [lateAndLeaveEarlyNo], [LeaveEarlyTime], [LeaveEarlyAbsenteeismTime], [systemId], [deleteNo]) VALUES (N'10', N'0', N'10', N'0', N'0', N'10', N'12', N'0');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [notclassessystem]
-- ----------------------------
DROP TABLE [notclassessystem]
GO
CREATE TABLE [notclassessystem] (
[notClassesSystemId] int NOT NULL ,
[fullDateTime] int NULL ,
[overtimeForOver] int NULL ,
[longWorkTime] int NULL ,
[longWorkTimeToZero] int NULL ,
[systemId] int NULL ,
[deleteNo] tinyint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'notclassessystem', 
'COLUMN', N'notClassesSystemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'无班次考勤制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'notclassessystem'
, @level2type = 'COLUMN', @level2name = N'notClassesSystemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'无班次考勤制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'notclassessystem'
, @level2type = 'COLUMN', @level2name = N'notClassesSystemId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'notclassessystem', 
'COLUMN', N'fullDateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N' 满多少分钟计一天'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'notclassessystem'
, @level2type = 'COLUMN', @level2name = N'fullDateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N' 满多少分钟计一天'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'notclassessystem'
, @level2type = 'COLUMN', @level2name = N'fullDateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'notclassessystem', 
'COLUMN', N'overtimeForOver')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超过多少分钟计加班'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'notclassessystem'
, @level2type = 'COLUMN', @level2name = N'overtimeForOver'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超过多少分钟计加班'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'notclassessystem'
, @level2type = 'COLUMN', @level2name = N'overtimeForOver'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'notclassessystem', 
'COLUMN', N'longWorkTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'单次上下班最长工作时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'notclassessystem'
, @level2type = 'COLUMN', @level2name = N'longWorkTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'单次上下班最长工作时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'notclassessystem'
, @level2type = 'COLUMN', @level2name = N'longWorkTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'notclassessystem', 
'COLUMN', N'longWorkTimeToZero')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'跨零点出勤时零点后的最长工作时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'notclassessystem'
, @level2type = 'COLUMN', @level2name = N'longWorkTimeToZero'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'跨零点出勤时零点后的最长工作时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'notclassessystem'
, @level2type = 'COLUMN', @level2name = N'longWorkTimeToZero'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'notclassessystem', 
'COLUMN', N'systemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'制度表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'notclassessystem'
, @level2type = 'COLUMN', @level2name = N'systemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'制度表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'notclassessystem'
, @level2type = 'COLUMN', @level2name = N'systemId'
GO

-- ----------------------------
-- Records of notclassessystem
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [notclassessystem] ([notClassesSystemId], [fullDateTime], [overtimeForOver], [longWorkTime], [longWorkTimeToZero], [systemId], [deleteNo]) VALUES (N'10', N'480', N'120', N'120', N'60', N'10', N'0');
INSERT INTO [notclassessystem] ([notClassesSystemId], [fullDateTime], [overtimeForOver], [longWorkTime], [longWorkTimeToZero], [systemId], [deleteNo]) VALUES (N'14', N'480', N'120', N'120', N'60', N'12', N'0');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [otherstystem]
-- ----------------------------
DROP TABLE [otherstystem]
GO
CREATE TABLE [otherstystem] (
[otherStystemId] int NOT NULL ,
[timeToOne] int NULL ,
[goOutAttendanceNo] tinyint NULL ,
[systemId] int NULL ,
[deleteNo] tinyint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'otherstystem', 
'COLUMN', N'otherStystemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'其他制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'otherstystem'
, @level2type = 'COLUMN', @level2name = N'otherStystemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'其他制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'otherstystem'
, @level2type = 'COLUMN', @level2name = N'otherStystemId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'otherstystem', 
'COLUMN', N'timeToOne')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'多次刷卡在小于多少分钟只算第一次'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'otherstystem'
, @level2type = 'COLUMN', @level2name = N'timeToOne'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'多次刷卡在小于多少分钟只算第一次'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'otherstystem'
, @level2type = 'COLUMN', @level2name = N'timeToOne'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'otherstystem', 
'COLUMN', N'goOutAttendanceNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'出差是否同时计为出勤时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'otherstystem'
, @level2type = 'COLUMN', @level2name = N'goOutAttendanceNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'出差是否同时计为出勤时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'otherstystem'
, @level2type = 'COLUMN', @level2name = N'goOutAttendanceNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'otherstystem', 
'COLUMN', N'systemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'考勤制度id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'otherstystem'
, @level2type = 'COLUMN', @level2name = N'systemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'考勤制度id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'otherstystem'
, @level2type = 'COLUMN', @level2name = N'systemId'
GO

-- ----------------------------
-- Records of otherstystem
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [otherstystem] ([otherStystemId], [timeToOne], [goOutAttendanceNo], [systemId], [deleteNo]) VALUES (N'5', N'1', N'1', N'10', N'0');
INSERT INTO [otherstystem] ([otherStystemId], [timeToOne], [goOutAttendanceNo], [systemId], [deleteNo]) VALUES (N'9', N'1', N'1', N'12', N'0');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [overtimesystem]
-- ----------------------------
DROP TABLE [overtimesystem]
GO
CREATE TABLE [overtimesystem] (
[overtimeSystemId] int NOT NULL ,
[overtime] int NULL ,
[earlyWorkToOvertimeNo] tinyint NULL ,
[lateWorkToOvertiemNo] tinyint NULL ,
[systemId] int NULL ,
[deleteNo] tinyint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'overtimesystem', 
'COLUMN', N'overtimeSystemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'加班制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'overtimesystem'
, @level2type = 'COLUMN', @level2name = N'overtimeSystemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'加班制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'overtimesystem'
, @level2type = 'COLUMN', @level2name = N'overtimeSystemId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'overtimesystem', 
'COLUMN', N'overtime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'加班大于多少分钟有效'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'overtimesystem'
, @level2type = 'COLUMN', @level2name = N'overtime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'加班大于多少分钟有效'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'overtimesystem'
, @level2type = 'COLUMN', @level2name = N'overtime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'overtimesystem', 
'COLUMN', N'earlyWorkToOvertimeNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'提前上班记加班否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'overtimesystem'
, @level2type = 'COLUMN', @level2name = N'earlyWorkToOvertimeNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'提前上班记加班否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'overtimesystem'
, @level2type = 'COLUMN', @level2name = N'earlyWorkToOvertimeNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'overtimesystem', 
'COLUMN', N'lateWorkToOvertiemNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'延迟下班记加班否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'overtimesystem'
, @level2type = 'COLUMN', @level2name = N'lateWorkToOvertiemNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'延迟下班记加班否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'overtimesystem'
, @level2type = 'COLUMN', @level2name = N'lateWorkToOvertiemNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'overtimesystem', 
'COLUMN', N'systemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'制度表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'overtimesystem'
, @level2type = 'COLUMN', @level2name = N'systemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'制度表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'overtimesystem'
, @level2type = 'COLUMN', @level2name = N'systemId'
GO

-- ----------------------------
-- Records of overtimesystem
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [overtimesystem] ([overtimeSystemId], [overtime], [earlyWorkToOvertimeNo], [lateWorkToOvertiemNo], [systemId], [deleteNo]) VALUES (N'10', N'10', N'1', N'0', N'10', N'0');
INSERT INTO [overtimesystem] ([overtimeSystemId], [overtime], [earlyWorkToOvertimeNo], [lateWorkToOvertiemNo], [systemId], [deleteNo]) VALUES (N'13', N'10', N'0', N'0', N'12', N'0');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [positionclasses]
-- ----------------------------
DROP TABLE [positionclasses]
GO
CREATE TABLE [positionclasses] (
[positionClassesId] int NOT NULL ,
[classesNumber] nvarchar(20) NULL ,
[classesName] nvarchar(20) NULL ,
[classTypeId] int NULL ,
[deleteNo] tinyint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'positionclasses', 
'COLUMN', N'classTypeId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'班次类别id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'positionclasses'
, @level2type = 'COLUMN', @level2name = N'classTypeId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'班次类别id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'positionclasses'
, @level2type = 'COLUMN', @level2name = N'classTypeId'
GO

-- ----------------------------
-- Records of positionclasses
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [positionclasses] ([positionClassesId], [classesNumber], [classesName], [classTypeId], [deleteNo]) VALUES (N'1', N'008', N'白班', N'7', N'0');
INSERT INTO [positionclasses] ([positionClassesId], [classesNumber], [classesName], [classTypeId], [deleteNo]) VALUES (N'2', N'0081', N'不定时班', N'8', N'0');
INSERT INTO [positionclasses] ([positionClassesId], [classesNumber], [classesName], [classTypeId], [deleteNo]) VALUES (N'3', N'0082', N'普休', N'7', N'0');
INSERT INTO [positionclasses] ([positionClassesId], [classesNumber], [classesName], [classTypeId], [deleteNo]) VALUES (N'4', N'0083', N'夜班', N'7', N'0');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [power]
-- ----------------------------
DROP TABLE [power]
GO
CREATE TABLE [power] (
[powerId] int NOT NULL ,
[powerName] nvarchar(30) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'power', 
'COLUMN', N'powerId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'权限表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'power'
, @level2type = 'COLUMN', @level2name = N'powerId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'权限表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'power'
, @level2type = 'COLUMN', @level2name = N'powerId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'power', 
'COLUMN', N'powerName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'权限名称'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'power'
, @level2type = 'COLUMN', @level2name = N'powerName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'权限名称'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'power'
, @level2type = 'COLUMN', @level2name = N'powerName'
GO

-- ----------------------------
-- Records of power
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [setholidays]
-- ----------------------------
DROP TABLE [setholidays]
GO
CREATE TABLE [setholidays] (
[holidaysId] int NOT NULL ,
[holidayName] nvarchar(20) NULL ,
[startDate] date NULL ,
[endDate] date NULL ,
[staffPositionId] int NULL ,
[remark] nvarchar(100) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'setholidays', 
'COLUMN', N'holidaysId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'节假日设置表主键ID '
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'setholidays'
, @level2type = 'COLUMN', @level2name = N'holidaysId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'节假日设置表主键ID '
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'setholidays'
, @level2type = 'COLUMN', @level2name = N'holidaysId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'setholidays', 
'COLUMN', N'holidayName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'节假日名称'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'setholidays'
, @level2type = 'COLUMN', @level2name = N'holidayName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'节假日名称'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'setholidays'
, @level2type = 'COLUMN', @level2name = N'holidayName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'setholidays', 
'COLUMN', N'startDate')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'起始日期 '
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'setholidays'
, @level2type = 'COLUMN', @level2name = N'startDate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'起始日期 '
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'setholidays'
, @level2type = 'COLUMN', @level2name = N'startDate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'setholidays', 
'COLUMN', N'endDate')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'终止日期'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'setholidays'
, @level2type = 'COLUMN', @level2name = N'endDate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'终止日期'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'setholidays'
, @level2type = 'COLUMN', @level2name = N'endDate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'setholidays', 
'COLUMN', N'staffPositionId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'机构职务表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'setholidays'
, @level2type = 'COLUMN', @level2name = N'staffPositionId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'机构职务表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'setholidays'
, @level2type = 'COLUMN', @level2name = N'staffPositionId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'setholidays', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'setholidays'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'setholidays'
, @level2type = 'COLUMN', @level2name = N'remark'
GO

-- ----------------------------
-- Records of setholidays
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [shift]
-- ----------------------------
DROP TABLE [shift]
GO
CREATE TABLE [shift] (
[shiftId] int NOT NULL ,
[shiftNumber] nvarchar(20) NULL ,
[shiftName] nvarchar(20) NULL ,
[staffPositionId] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'shift', 
'COLUMN', N'shiftId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'固定轮班表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shift'
, @level2type = 'COLUMN', @level2name = N'shiftId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'固定轮班表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shift'
, @level2type = 'COLUMN', @level2name = N'shiftId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'shift', 
'COLUMN', N'shiftNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'固定轮班编号'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shift'
, @level2type = 'COLUMN', @level2name = N'shiftNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'固定轮班编号'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shift'
, @level2type = 'COLUMN', @level2name = N'shiftNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'shift', 
'COLUMN', N'shiftName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'固定轮班名称 '
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shift'
, @level2type = 'COLUMN', @level2name = N'shiftName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'固定轮班名称 '
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shift'
, @level2type = 'COLUMN', @level2name = N'shiftName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'shift', 
'COLUMN', N'staffPositionId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'机构职务表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shift'
, @level2type = 'COLUMN', @level2name = N'staffPositionId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'机构职务表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shift'
, @level2type = 'COLUMN', @level2name = N'staffPositionId'
GO

-- ----------------------------
-- Records of shift
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [shift] ([shiftId], [shiftNumber], [shiftName], [staffPositionId]) VALUES (N'16', N'0098', N'15天一轮', N'1');
INSERT INTO [shift] ([shiftId], [shiftNumber], [shiftName], [staffPositionId]) VALUES (N'17', N'', N'', N'-1');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [shiftchild]
-- ----------------------------
DROP TABLE [shiftchild]
GO
CREATE TABLE [shiftchild] (
[shiftChildId] int NOT NULL ,
[positionClassesId] int NULL ,
[rankOrder] int NULL ,
[shiftId] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'shiftchild', 
'COLUMN', N'shiftChildId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'固定轮班明细表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shiftchild'
, @level2type = 'COLUMN', @level2name = N'shiftChildId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'固定轮班明细表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shiftchild'
, @level2type = 'COLUMN', @level2name = N'shiftChildId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'shiftchild', 
'COLUMN', N'positionClassesId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'职务班次表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shiftchild'
, @level2type = 'COLUMN', @level2name = N'positionClassesId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'职务班次表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shiftchild'
, @level2type = 'COLUMN', @level2name = N'positionClassesId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'shiftchild', 
'COLUMN', N'rankOrder')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'顺序'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shiftchild'
, @level2type = 'COLUMN', @level2name = N'rankOrder'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'顺序'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shiftchild'
, @level2type = 'COLUMN', @level2name = N'rankOrder'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'shiftchild', 
'COLUMN', N'shiftId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'固定轮班表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shiftchild'
, @level2type = 'COLUMN', @level2name = N'shiftId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'固定轮班表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'shiftchild'
, @level2type = 'COLUMN', @level2name = N'shiftId'
GO

-- ----------------------------
-- Records of shiftchild
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'126', N'15', N'1', N'8');
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'229', N'13', N'1', N'16');
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'230', N'13', N'2', N'16');
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'231', N'13', N'3', N'16');
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'232', N'13', N'4', N'16');
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'233', N'13', N'5', N'16');
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'234', N'13', N'6', N'16');
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'235', N'13', N'7', N'16');
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'236', N'13', N'8', N'16');
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'237', N'13', N'9', N'16');
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'238', N'13', N'10', N'16');
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'239', N'13', N'11', N'16');
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'240', N'13', N'12', N'16');
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'241', N'13', N'13', N'16');
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'242', N'13', N'14', N'16');
INSERT INTO [shiftchild] ([shiftChildId], [positionClassesId], [rankOrder], [shiftId]) VALUES (N'243', N'13', N'15', N'16');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [staff]
-- ----------------------------
DROP TABLE [staff]
GO
CREATE TABLE [staff] (
[staffId] int NOT NULL ,
[staffName] nvarchar(40) NULL ,
[staffNumber] nvarchar(20) NULL ,
[loginNumber] nvarchar(20) NULL ,
[idCar] nvarchar(20) NULL ,
[email] nvarchar(30) NULL ,
[cardNumber] nvarchar(20) NULL ,
[dateOfEntry] date NULL ,
[sex] tinyint NULL ,
[staffPositionId] int NULL ,
[username] nvarchar(20) NULL ,
[password] nvarchar(20) NULL ,
[headImage] nvarchar(150) NULL ,
[remark] nvarchar(100) NULL ,
[positionTypeId] int NULL ,
[leavedate] date NULL ,
[groupId] int NULL ,
[systemId] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'staffId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'员工表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'staffId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'员工表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'staffId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'staffName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'员工姓名'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'staffName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'员工姓名'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'staffName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'staffNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'员工姓名'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'staffNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'员工姓名'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'staffNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'loginNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'登记号码'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'loginNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登记号码'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'loginNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'idCar')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'身份证号'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'idCar'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'身份证号'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'idCar'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'email')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'电子邮件'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'email'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'电子邮件'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'email'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'cardNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'卡片号码'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'cardNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'卡片号码'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'cardNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'dateOfEntry')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'入职日期'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'dateOfEntry'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'入职日期'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'dateOfEntry'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'sex')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'性别'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'sex'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'性别'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'sex'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'staffPositionId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'员工职务id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'staffPositionId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'员工职务id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'staffPositionId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'username')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户名 '
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'username'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户名 '
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'username'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'password')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'密码'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'password'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'密码'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'password'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'headImage')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'头像'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'headImage'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'头像'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'headImage'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'positionTypeId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N' 职位状态id(在职/离职/待离职)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'positionTypeId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N' 职位状态id(在职/离职/待离职)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'positionTypeId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'leavedate')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'离职日期'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'leavedate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'离职日期'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'leavedate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'groupId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'班组id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'groupId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'班组id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'groupId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staff', 
'COLUMN', N'systemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'考勤制度表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'systemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'考勤制度表主键id'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staff'
, @level2type = 'COLUMN', @level2name = N'systemId'
GO

-- ----------------------------
-- Records of staff
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [staff] ([staffId], [staffName], [staffNumber], [loginNumber], [idCar], [email], [cardNumber], [dateOfEntry], [sex], [staffPositionId], [username], [password], [headImage], [remark], [positionTypeId], [leavedate], [groupId], [systemId]) VALUES (N'25', N'陈冠希', N'008', N'安抚', N'440981199401068613', N'1293330122@qq.com', N'啊是否三', '2016-11-16', N'1', N'8', N'sa', N'123', N'headImg/df0ad025-10a5-409f-92bf-a71b4112be88.jpg', N'阿萨否', N'1', null, N'27', N'12');
INSERT INTO [staff] ([staffId], [staffName], [staffNumber], [loginNumber], [idCar], [email], [cardNumber], [dateOfEntry], [sex], [staffPositionId], [username], [password], [headImage], [remark], [positionTypeId], [leavedate], [groupId], [systemId]) VALUES (N'26', N'徐太庆', N'5555', N'2345', N'440981199312245112', N'2234543563@qq.com', N'2342', '2016-11-16', N'0', N'8', N'admin', N'123', N'headImg/75384e98-6dc0-4609-8163-2c3453df1bd5.jpg', N'', N'1', null, N'27', N'10');
INSERT INTO [staff] ([staffId], [staffName], [staffNumber], [loginNumber], [idCar], [email], [cardNumber], [dateOfEntry], [sex], [staffPositionId], [username], [password], [headImage], [remark], [positionTypeId], [leavedate], [groupId], [systemId]) VALUES (N'27', N'吴山', N'1232', N'123', N'440981199401068613', N'1293330122@qq.com', N'123', '2016-12-13', N'1', N'8', N'ok', N'123', N'headImg/5d9dfc33-16ed-490a-a44a-1aadefca60da.jpg', N'123', N'1', null, N'27', N'10');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [staffclassesrecord]
-- ----------------------------
DROP TABLE [staffclassesrecord]
GO
CREATE TABLE [staffclassesrecord] (
[staffClassesRecordId] int NOT NULL ,
[workDate] date NULL ,
[staffId] int NULL ,
[groupId] int NULL ,
[lateAndLeaveEarlySystemId] int NULL ,
[overtimeSystemId] int NULL ,
[goOutSystemId] int NULL ,
[notClassesSystemId] int NULL ,
[otherStystemId] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassesrecord', 
'COLUMN', N'staffClassesRecordId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'员工班次记录表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'staffClassesRecordId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'员工班次记录表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'staffClassesRecordId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassesrecord', 
'COLUMN', N'workDate')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工作日期'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'workDate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工作日期'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'workDate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassesrecord', 
'COLUMN', N'staffId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'员工ID '
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'staffId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'员工ID '
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'staffId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassesrecord', 
'COLUMN', N'groupId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'班组id（属性明细表id）'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'groupId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'班组id（属性明细表id）'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'groupId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassesrecord', 
'COLUMN', N'lateAndLeaveEarlySystemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'迟到早退制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'lateAndLeaveEarlySystemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'迟到早退制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'lateAndLeaveEarlySystemId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassesrecord', 
'COLUMN', N'overtimeSystemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'加班制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'overtimeSystemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'加班制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'overtimeSystemId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassesrecord', 
'COLUMN', N'goOutSystemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'外出制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'goOutSystemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'外出制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'goOutSystemId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassesrecord', 
'COLUMN', N'notClassesSystemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'无班次考勤制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'notClassesSystemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'无班次考勤制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'notClassesSystemId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassesrecord', 
'COLUMN', N'otherStystemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N' 其他制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'otherStystemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N' 其他制度表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassesrecord'
, @level2type = 'COLUMN', @level2name = N'otherStystemId'
GO

-- ----------------------------
-- Records of staffclassesrecord
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [staffclassesrecord] ([staffClassesRecordId], [workDate], [staffId], [groupId], [lateAndLeaveEarlySystemId], [overtimeSystemId], [goOutSystemId], [notClassesSystemId], [otherStystemId]) VALUES (N'530', '2017-03-14', N'26', N'27', N'9', N'10', N'5', N'10', N'5');
INSERT INTO [staffclassesrecord] ([staffClassesRecordId], [workDate], [staffId], [groupId], [lateAndLeaveEarlySystemId], [overtimeSystemId], [goOutSystemId], [notClassesSystemId], [otherStystemId]) VALUES (N'531', '2017-03-14', N'25', N'27', N'10', N'13', N'9', N'14', N'9');
INSERT INTO [staffclassesrecord] ([staffClassesRecordId], [workDate], [staffId], [groupId], [lateAndLeaveEarlySystemId], [overtimeSystemId], [goOutSystemId], [notClassesSystemId], [otherStystemId]) VALUES (N'532', '2017-03-15', N'26', N'27', N'9', N'10', N'5', N'10', N'5');
INSERT INTO [staffclassesrecord] ([staffClassesRecordId], [workDate], [staffId], [groupId], [lateAndLeaveEarlySystemId], [overtimeSystemId], [goOutSystemId], [notClassesSystemId], [otherStystemId]) VALUES (N'533', '2017-03-16', N'26', N'27', N'9', N'10', N'5', N'10', N'5');
INSERT INTO [staffclassesrecord] ([staffClassesRecordId], [workDate], [staffId], [groupId], [lateAndLeaveEarlySystemId], [overtimeSystemId], [goOutSystemId], [notClassesSystemId], [otherStystemId]) VALUES (N'534', '2017-03-17', N'26', N'27', N'9', N'10', N'5', N'10', N'5');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [staffclassperiodsigninrecord]
-- ----------------------------
DROP TABLE [staffclassperiodsigninrecord]
GO
CREATE TABLE [staffclassperiodsigninrecord] (
[staffClassPeriodSignInRecordId] int NOT NULL ,
[signInTime] datetime2 NULL ,
[lateNo] tinyint NULL ,
[signInWayId] int NULL ,
[SignInNumber] nvarchar(20) NULL ,
[signBackTime] datetime2 NULL ,
[leaveEarlyNo] tinyint NULL ,
[SignBackWayId] int NULL ,
[signBackNumber] nvarchar(20) NULL ,
[attendanceClassChildId] int NULL ,
[classPeriodId] int NULL ,
[staffClassesRecordId] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassperiodsigninrecord', 
'COLUMN', N'staffClassPeriodSignInRecordId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'员工班段签到记录表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'staffClassPeriodSignInRecordId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'员工班段签到记录表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'staffClassPeriodSignInRecordId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassperiodsigninrecord', 
'COLUMN', N'signInTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'签到时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'signInTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'签到时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'signInTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassperiodsigninrecord', 
'COLUMN', N'lateNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'迟到否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'lateNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'迟到否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'lateNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassperiodsigninrecord', 
'COLUMN', N'signInWayId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'签到方式（属性明细表ID 人工签到 指纹签到）'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'signInWayId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'签到方式（属性明细表ID 人工签到 指纹签到）'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'signInWayId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassperiodsigninrecord', 
'COLUMN', N'SignInNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'签到设备号'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'SignInNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'签到设备号'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'SignInNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassperiodsigninrecord', 
'COLUMN', N'signBackTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'签退时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'signBackTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'签退时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'signBackTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassperiodsigninrecord', 
'COLUMN', N'leaveEarlyNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'早退否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'leaveEarlyNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'早退否'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'leaveEarlyNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassperiodsigninrecord', 
'COLUMN', N'SignBackWayId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'签退方式（属性明细表ID 人工签到 指纹签到）'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'SignBackWayId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'签退方式（属性明细表ID 人工签到 指纹签到）'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'SignBackWayId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassperiodsigninrecord', 
'COLUMN', N'signBackNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'签退设备号'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'signBackNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'签退设备号'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'signBackNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassperiodsigninrecord', 
'COLUMN', N'attendanceClassChildId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'考勤类别明细表ID（平时加班/请假/旷工/外出）'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'attendanceClassChildId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'考勤类别明细表ID（平时加班/请假/旷工/外出）'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'attendanceClassChildId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassperiodsigninrecord', 
'COLUMN', N'classPeriodId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'班段ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'classPeriodId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'班段ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'classPeriodId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffclassperiodsigninrecord', 
'COLUMN', N'staffClassesRecordId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'员工班次记录表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'staffClassesRecordId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'员工班次记录表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffclassperiodsigninrecord'
, @level2type = 'COLUMN', @level2name = N'staffClassesRecordId'
GO

-- ----------------------------
-- Records of staffclassperiodsigninrecord
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [staffclassperiodsigninrecord] ([staffClassPeriodSignInRecordId], [signInTime], [lateNo], [signInWayId], [SignInNumber], [signBackTime], [leaveEarlyNo], [SignBackWayId], [signBackNumber], [attendanceClassChildId], [classPeriodId], [staffClassesRecordId]) VALUES (N'964', null, null, null, null, null, null, null, null, N'14', N'25', N'530');
INSERT INTO [staffclassperiodsigninrecord] ([staffClassPeriodSignInRecordId], [signInTime], [lateNo], [signInWayId], [SignInNumber], [signBackTime], [leaveEarlyNo], [SignBackWayId], [signBackNumber], [attendanceClassChildId], [classPeriodId], [staffClassesRecordId]) VALUES (N'965', null, null, null, null, null, null, null, null, N'1', N'25', N'531');
INSERT INTO [staffclassperiodsigninrecord] ([staffClassPeriodSignInRecordId], [signInTime], [lateNo], [signInWayId], [SignInNumber], [signBackTime], [leaveEarlyNo], [SignBackWayId], [signBackNumber], [attendanceClassChildId], [classPeriodId], [staffClassesRecordId]) VALUES (N'966', null, null, null, null, null, null, null, null, N'12', N'28', N'532');
INSERT INTO [staffclassperiodsigninrecord] ([staffClassPeriodSignInRecordId], [signInTime], [lateNo], [signInWayId], [SignInNumber], [signBackTime], [leaveEarlyNo], [SignBackWayId], [signBackNumber], [attendanceClassChildId], [classPeriodId], [staffClassesRecordId]) VALUES (N'967', null, null, null, null, null, null, null, null, N'17', N'25', N'533');
INSERT INTO [staffclassperiodsigninrecord] ([staffClassPeriodSignInRecordId], [signInTime], [lateNo], [signInWayId], [SignInNumber], [signBackTime], [leaveEarlyNo], [SignBackWayId], [signBackNumber], [attendanceClassChildId], [classPeriodId], [staffClassesRecordId]) VALUES (N'968', null, null, null, null, null, null, null, null, N'1', N'25', N'534');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [staffposition]
-- ----------------------------
DROP TABLE [staffposition]
GO
CREATE TABLE [staffposition] (
[staffPositionId] int NOT NULL ,
[positionid] int NULL ,
[departmentId] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffposition', 
'COLUMN', N'staffPositionId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N' 机构职务表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffposition'
, @level2type = 'COLUMN', @level2name = N'staffPositionId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N' 机构职务表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffposition'
, @level2type = 'COLUMN', @level2name = N'staffPositionId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffposition', 
'COLUMN', N'positionid')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'职务名称'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffposition'
, @level2type = 'COLUMN', @level2name = N'positionid'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'职务名称'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffposition'
, @level2type = 'COLUMN', @level2name = N'positionid'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffposition', 
'COLUMN', N'departmentId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'机构ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffposition'
, @level2type = 'COLUMN', @level2name = N'departmentId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'机构ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffposition'
, @level2type = 'COLUMN', @level2name = N'departmentId'
GO

-- ----------------------------
-- Records of staffposition
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [staffposition] ([staffPositionId], [positionid], [departmentId]) VALUES (N'1', N'4', N'3');
INSERT INTO [staffposition] ([staffPositionId], [positionid], [departmentId]) VALUES (N'2', N'5', N'3');
INSERT INTO [staffposition] ([staffPositionId], [positionid], [departmentId]) VALUES (N'4', N'6', N'3');
INSERT INTO [staffposition] ([staffPositionId], [positionid], [departmentId]) VALUES (N'5', N'4', N'15');
INSERT INTO [staffposition] ([staffPositionId], [positionid], [departmentId]) VALUES (N'6', N'5', N'15');
INSERT INTO [staffposition] ([staffPositionId], [positionid], [departmentId]) VALUES (N'8', N'6', N'2');
INSERT INTO [staffposition] ([staffPositionId], [positionid], [departmentId]) VALUES (N'9', N'4', N'1');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [staffpositionpower]
-- ----------------------------
DROP TABLE [staffpositionpower]
GO
CREATE TABLE [staffpositionpower] (
[staffPositionPowerId] int NOT NULL ,
[staffPositionId] int NULL ,
[powerId] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffpositionpower', 
'COLUMN', N'staffPositionPowerId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'职务权限表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffpositionpower'
, @level2type = 'COLUMN', @level2name = N'staffPositionPowerId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'职务权限表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffpositionpower'
, @level2type = 'COLUMN', @level2name = N'staffPositionPowerId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffpositionpower', 
'COLUMN', N'staffPositionId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'机构职务表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffpositionpower'
, @level2type = 'COLUMN', @level2name = N'staffPositionId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'机构职务表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffpositionpower'
, @level2type = 'COLUMN', @level2name = N'staffPositionId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffpositionpower', 
'COLUMN', N'powerId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'权限表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffpositionpower'
, @level2type = 'COLUMN', @level2name = N'powerId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'权限表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffpositionpower'
, @level2type = 'COLUMN', @level2name = N'powerId'
GO

-- ----------------------------
-- Records of staffpositionpower
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [staffretroactive]
-- ----------------------------
DROP TABLE [staffretroactive]
GO
CREATE TABLE [staffretroactive] (
[staffRetroactiveId] int NOT NULL ,
[staffClassesChildRecordId] int NULL ,
[SignInTime] datetime2 NULL ,
[toAndFrom] tinyint NULL ,
[operationStaffId] int NULL ,
[SignInWayId] int NULL ,
[operatingTime] datetime2 NULL ,
[checkmanId] int NULL ,
[checkTime] datetime2 NULL ,
[checkStateId] int NULL ,
[applyForReason] nvarchar(100) NULL ,
[remark] nvarchar(100) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffretroactive', 
'COLUMN', N'staffRetroactiveId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'员工补签申请表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'staffRetroactiveId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'员工补签申请表主键ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'staffRetroactiveId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffretroactive', 
'COLUMN', N'staffClassesChildRecordId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'员工班段记录表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'staffClassesChildRecordId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'员工班段记录表ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'staffClassesChildRecordId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffretroactive', 
'COLUMN', N'SignInTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'签到时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'SignInTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'签到时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'SignInTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffretroactive', 
'COLUMN', N'toAndFrom')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上下班'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'toAndFrom'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上下班'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'toAndFrom'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffretroactive', 
'COLUMN', N'operationStaffId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'操作人ID（员工ID {可以是员工或管理者}）'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'operationStaffId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'操作人ID（员工ID {可以是员工或管理者}）'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'operationStaffId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffretroactive', 
'COLUMN', N'SignInWayId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'签到方式ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'SignInWayId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'签到方式ID'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'SignInWayId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffretroactive', 
'COLUMN', N'operatingTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'操作时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'operatingTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'操作时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'operatingTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffretroactive', 
'COLUMN', N'checkmanId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'审核人ID(staffId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'checkmanId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'审核人ID(staffId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'checkmanId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffretroactive', 
'COLUMN', N'checkTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'审核时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'checkTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'审核时间'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'checkTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffretroactive', 
'COLUMN', N'checkStateId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'审核状态ID(attributeGatherChildId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'checkStateId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'审核状态ID(attributeGatherChildId)'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'checkStateId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffretroactive', 
'COLUMN', N'applyForReason')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'申请原因'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'applyForReason'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'申请原因'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'applyForReason'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'staffretroactive', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'staffretroactive'
, @level2type = 'COLUMN', @level2name = N'remark'
GO

-- ----------------------------
-- Records of staffretroactive
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [system]
-- ----------------------------
DROP TABLE [system]
GO
CREATE TABLE [system] (
[systemId] int NOT NULL ,
[systemNumber] nvarchar(20) NULL ,
[systemName] nvarchar(40) NULL ,
[deleteNo] tinyint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'system', 
'COLUMN', N'systemId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'考勤制度表'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'system'
, @level2type = 'COLUMN', @level2name = N'systemId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'考勤制度表'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'system'
, @level2type = 'COLUMN', @level2name = N'systemId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'system', 
'COLUMN', N'systemNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'制度编号'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'system'
, @level2type = 'COLUMN', @level2name = N'systemNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'制度编号'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'system'
, @level2type = 'COLUMN', @level2name = N'systemNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'', 
'TABLE', N'system', 
'COLUMN', N'systemName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'制度名称'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'system'
, @level2type = 'COLUMN', @level2name = N'systemName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'制度名称'
, @level0type = 'SCHEMA', @level0name = N''
, @level1type = 'TABLE', @level1name = N'system'
, @level2type = 'COLUMN', @level2name = N'systemName'
GO

-- ----------------------------
-- Records of system
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [system] ([systemId], [systemNumber], [systemName], [deleteNo]) VALUES (N'10', N'008', N'广州分制度', N'0');
INSERT INTO [system] ([systemId], [systemNumber], [systemName], [deleteNo]) VALUES (N'12', N'009', N'深圳分制度', N'0');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [tb]
-- ----------------------------
DROP TABLE [tb]
GO
CREATE TABLE [tb] (
[id] int NOT NULL ,
[value1] int NULL 
)


GO

-- ----------------------------
-- Records of tb
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [tb] ([id], [value1]) VALUES (N'1', N'3');
INSERT INTO [tb] ([id], [value1]) VALUES (N'2', N'4');
INSERT INTO [tb] ([id], [value1]) VALUES (N'3', N'1');
INSERT INTO [tb] ([id], [value1]) VALUES (N'4', N'1');
INSERT INTO [tb] ([id], [value1]) VALUES (N'5', N'1');
INSERT INTO [tb] ([id], [value1]) VALUES (N'6', N'1');
INSERT INTO [tb] ([id], [value1]) VALUES (N'7', N'1');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [tb2]
-- ----------------------------
DROP TABLE [tb2]
GO
CREATE TABLE [tb2] (
[id] int NULL ,
[zhi] int NULL 
)


GO

-- ----------------------------
-- Records of tb2
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [tb2] ([id], [zhi]) VALUES (N'1', N'3');
INSERT INTO [tb2] ([id], [zhi]) VALUES (N'2', N'5');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [test]
-- ----------------------------
DROP TABLE [test]
GO
CREATE TABLE [test] (
[id] int NOT NULL ,
[install] int NOT NULL ,
[day] int NOT NULL ,
[aid] int NOT NULL 
)


GO

-- ----------------------------
-- Records of test
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [test] ([id], [install], [day], [aid]) VALUES (N'1', N'1232', N'20080808', N'1');
INSERT INTO [test] ([id], [install], [day], [aid]) VALUES (N'2', N'2321', N'20080809', N'2');
INSERT INTO [test] ([id], [install], [day], [aid]) VALUES (N'3', N'1236', N'20080810', N'3');
INSERT INTO [test] ([id], [install], [day], [aid]) VALUES (N'5', N'4212', N'20080809', N'1');
INSERT INTO [test] ([id], [install], [day], [aid]) VALUES (N'6', N'2312', N'20080810', N'1');
INSERT INTO [test] ([id], [install], [day], [aid]) VALUES (N'7', N'1432', N'20080811', N'1');
INSERT INTO [test] ([id], [install], [day], [aid]) VALUES (N'8', N'2421', N'20080808', N'2');
INSERT INTO [test] ([id], [install], [day], [aid]) VALUES (N'9', N'4245', N'20080811', N'2');
INSERT INTO [test] ([id], [install], [day], [aid]) VALUES (N'10', N'5654', N'20080810', N'2');
INSERT INTO [test] ([id], [install], [day], [aid]) VALUES (N'11', N'412', N'20080808', N'3');
GO
COMMIT TRANSACTION
GO
