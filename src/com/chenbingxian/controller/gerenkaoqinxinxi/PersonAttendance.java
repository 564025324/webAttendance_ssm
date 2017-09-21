package com.chenbingxian.controller.gerenkaoqinxinxi;

import java.io.PrintWriter;
import java.util.List;

import net.sf.json.JSONArray;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chenbingxian.core.query.Json;
import com.chenbingxian.po.AskForLeave;
import com.chenbingxian.po.Positionclasses;
import com.chenbingxian.po.StaffRetroactive;
import com.chenbingxian.po.Staffclassperiodsigninrecord;
import com.chenbingxian.service.gerenkaoqinxinxi.IpersonAttendanceSv;
import com.chenbingxian.vo.ChuChaQingJiaTongJi;
import com.chenbingxian.vo.ChuQinJiaBanGongXiuTongJiVo;
import com.chenbingxian.vo.MyAskForLeave;
import com.chenbingxian.vo.MyClass;
import com.chenbingxian.vo.PunchCard;

@Controller
@RequestMapping("PersonAttendance")
public class PersonAttendance {
	@Autowired
	IpersonAttendanceSv ipersonAttendanceSv;
	/**查询我的班次信息**/
	@RequestMapping("selectMyClass")
		public void selectPersonClass(String beginDate, String endDate,
				int staffid,PrintWriter pw) {
			List<MyClass> myClasses= ipersonAttendanceSv.selectPersonClass(beginDate, endDate, staffid);
		   String str =Json.listToJson(myClasses);
		   pw.write(str);
	}
    @RequestMapping("selectPunchCard")
    public void selectPunchCard(String workDate,int staffId,PrintWriter pw){
    	List<PunchCard> punchCards=ipersonAttendanceSv.selectPunchCard(workDate, staffId);
    	  String str =Json.listToJson(punchCards);
		   pw.write(str);
    }
    /**正常班次的签到**/
    @RequestMapping("updateClassperiodsigninrecord")
   /* public void updateClassperiodsigninrecord(String signInTime,int attendanceClassChildId, int lateNo,int signInWayId,String SignInNumber
    		,int  staffClassPeriodSignInRecordId,String signBackTime,int leaveEarlyNo){
    	ipersonAttendanceSv.updateClassperiodsigninrecord(signInTime, attendanceClassChildId, lateNo, signInWayId, SignInNumber, staffClassPeriodSignInRecordId,signBackTime, leaveEarlyNo);
    }*/
    public void updateClassperiodsigninrecord(Staffclassperiodsigninrecord staffclassperiodsigninrecord,PrintWriter pw){
    int i=ipersonAttendanceSv.updateClassperiodsigninrecord(staffclassperiodsigninrecord);
    	pw.write(""+i);
    }
    @RequestMapping("insertClassperiodsigninrecord")
	/**新增不定时班次签到记录**/
    public void insertClassperiodsigninrecord(Staffclassperiodsigninrecord staffclassperiodsigninrecord) {
	 ipersonAttendanceSv.insertClassperiodsigninrecord(staffclassperiodsigninrecord);
    }
    @RequestMapping("insertAskForLeave")
    /**新增请假、出差**/
	public void insertAskForLeave(AskForLeave askforleave,PrintWriter pw) {
	 int i= ipersonAttendanceSv.insertAskForLeave(askforleave);
	  pw.write(""+i);
	}
    @RequestMapping("insertAskForLeaveMx")
	/**新增申请加班的班次**/
	public void insertJiaBan(AskForLeave askforleave, int classid,PrintWriter pw) {
		 int i=ipersonAttendanceSv.insertJiaBan(askforleave, classid);
		pw.write(""+i);
	}
    @RequestMapping("selectMyAskForLeave")
	/**查询加班请假等信息**/
	public void selectMyAskForLeave(int staffid,String startDate,String endDate,int checkTypeId,int registrationTypeId,PrintWriter pw) {
		 List<MyAskForLeave> list=ipersonAttendanceSv.selectAskForLeave(staffid, startDate, endDate, checkTypeId, registrationTypeId);
		 String str=listToJson(list);
		 pw.write(str);
		   
    }
    @RequestMapping("selectClassByAttendanceClassChildId")
    /**根据加班类别查询班组中对应的班次**/
	public void selectClassByAttendanceClassChildId(int staffId, int attendanceClassChildId,PrintWriter pw) {
		 List<Positionclasses> list=ipersonAttendanceSv.selectClassByAttendanceClassChildId(staffId, attendanceClassChildId);
				 String str=listToJson(list);
		 pw.write(str);
    }
    
    @RequestMapping("updateByAskForLeaveMxId")
    /**根据加班类别查询班组中对应的班次**/
	public void updateByAskForLeaveMxId(AskForLeave askforleave,int positionClassesId,
			int askForLeaveMxId,PrintWriter pw) {
		  int i=ipersonAttendanceSv.updateByAskForLeaveMxId(askforleave, positionClassesId, askForLeaveMxId);
		 pw.write(""+i);
    }
    @RequestMapping("updateAskForLeave")
    /**修改请假、出差、加班的申请信息**/
	public void  updateAskForLeave(AskForLeave askforleave,PrintWriter pw) {
		  int i=ipersonAttendanceSv.updateAskForLeave(askforleave);
		 pw.write(""+i);
    }
    @RequestMapping("deleteByAskForLeaveMxId")
    /**根据加班类别查询班组中对应的班次**/
	public void  deleteByAskForLeaveMxId(int askForLeaveId,int askForLeaveMxId,PrintWriter pw) {
		 int i=ipersonAttendanceSv.deleteByAskForLeaveMxId(askForLeaveId, askForLeaveMxId);
		 pw.write(""+i);
    }
    @RequestMapping("selectChuChaQingJia")
    /**查询我的考勤记录之出差请假**/
  	public void selectChuChaQingJia(String starDate,
  		String endDate, int[] staffids,PrintWriter pw){
  		 List<ChuChaQingJiaTongJi> list=ipersonAttendanceSv.selectChuChaQingJia(starDate, endDate, staffids);
		 String str=listToJson(list);
         pw.write(str);
    }
    @RequestMapping("selectChuQingJiaBanGongXiuTongJi")
  	 /**查询我的考勤记录之出勤、加班、公休**/
  	public void selectChuQingJiaBanGongXiuTongJi(
  		String starDate, String endDate, int[] staffids,PrintWriter pw) {
  		 List<ChuQinJiaBanGongXiuTongJiVo> list=ipersonAttendanceSv.selectChuQingJiaBanGongXiuTongJi(starDate, endDate, staffids);
		 String str=listToJson(list);
         pw.write(str);
    }
    @RequestMapping("insertStaffretroactive")
    /**新增补签登记记录**/
	public void insertStaffretroactive(StaffRetroactive staffretroactive,PrintWriter pw) {
		 int i=ipersonAttendanceSv.insertStaffretroactive(staffretroactive);
		 pw.write(""+i);
	}
    @RequestMapping("selectRecord")
    /**查询班段申请补签记录**/
	public void selectRecord(int staffClassesChildRecordId,boolean toAndFrom,PrintWriter pw) {
      List<StaffRetroactive>list=ipersonAttendanceSv.selectRecord(staffClassesChildRecordId, toAndFrom);
      String str=listToJson(list);
      pw.write(str);
    }
    @RequestMapping("selectMyRetroactive")
    /**多条件查询我的所有补签申请 **/ 
   	public void selectMyRetroactive(int staffid,String starDate,
   			String endDate, int checkTypeId,PrintWriter pw){
    	 List<StaffRetroactive>list=ipersonAttendanceSv.selectMyRetroactive(staffid,starDate, endDate, checkTypeId);
         String str=listToJson(list);
         pw.write(str);
    }
    
    
	/**list转json**/
	public <T> String listToJson(List<T> t) {
		JSONArray sjArray = JSONArray.fromObject(t);
		String str = sjArray.toString();
		return str;
	}
}
