package com.chenbingxian.service.gerenkaoqinxinxi;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenbingxian.po.AskForLeave;
import com.chenbingxian.po.Positionclasses;
import com.chenbingxian.po.StaffRetroactive;
import com.chenbingxian.po.Staffclassperiodsigninrecord;
import com.chenbingxian.vo.ChuChaQingJiaTongJi;
import com.chenbingxian.vo.ChuQinJiaBanGongXiuTongJiVo;
import com.chenbingxian.vo.MyAskForLeave;
import com.chenbingxian.vo.MyClass;
import com.chenbingxian.vo.PunchCard;

public interface IpersonAttendanceSv {
	 /**查询我的班次信息**/
	 List<MyClass> selectPersonClass(String beginDate,String  endDate,int staffid);
	  /**查询考勤个人打卡的班段等信息**/
	 List<PunchCard> selectPunchCard(String workDate,int staffId);
	 /**正常班次签到**/
	 int updateClassperiodsigninrecord(Staffclassperiodsigninrecord staffclassperiodsigninrecord);
	 /**新增不定时班次签到记录**/
	 int insertClassperiodsigninrecord(Staffclassperiodsigninrecord staffclassperiodsigninrecord);
	 /**新增请假出差登记**/
	 int insertAskForLeave(AskForLeave askforleave);
     /**新增加班申请**/
	 int insertJiaBan(AskForLeave askforleave,int classid);
	 /**查询我的请假、加班、出差信息**/
	  List<MyAskForLeave> selectAskForLeave(int staffid,String startDate,String endDate,int checkTypeId,int registrationTypeId);
	  /**根据加班类别查询班组中对应的班次**/
	  List<Positionclasses> selectClassByAttendanceClassChildId(int staffId,int attendanceClassChildId);
	  /**修改申请加班班次**/
	  int  updateByAskForLeaveMxId(AskForLeave askforleave,int positionClassesId,int askForLeaveMxId);
	  int updateAskForLeave(AskForLeave askforleave);
	  /**删除申请加班班次**/
	  int deleteByAskForLeaveMxId(int askForLeaveId,int askForLeaveMxId);
      /**查询我的考勤记录之出差请假**/
	  List<ChuChaQingJiaTongJi> selectChuChaQingJia(String starDate,String endDate,int[]staffids);
	  /**查询我的考勤记录之出勤、加班、公休**/
	  List<ChuQinJiaBanGongXiuTongJiVo> selectChuQingJiaBanGongXiuTongJi(String starDate,String endDate,int[]staffids);
      /**新增补签登记记录**/
	  int insertStaffretroactive(StaffRetroactive staffretroactive);
	  /**查询班段申请补签记录**/ 
	  List<StaffRetroactive> selectRecord(int staffClassesChildRecordId,boolean toAndFrom);
	   /**多条件查询我的所有补签申请 **/ 
	   List<StaffRetroactive> selectMyRetroactive(int staffid,String starDate,String endDate,int checkTypeId);
	    

}
