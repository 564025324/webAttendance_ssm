package com.lijwen.service.gerenkaoqinxinxi.Impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lijwen.dao.AskForLeaveMapper;
import com.lijwen.dao.KaoQinTongJiDao;
import com.lijwen.dao.PersonAttendanceDao;
import com.lijwen.dao.StaffRetroactiveMapper;
import com.lijwen.dao.StaffclassperiodsigninrecordMapper;
import com.lijwen.po.AskForLeave;
import com.lijwen.po.Positionclasses;
import com.lijwen.po.StaffRetroactive;
import com.lijwen.po.Staffclassperiodsigninrecord;
import com.lijwen.service.gerenkaoqinxinxi.IpersonAttendanceSv;
import com.lijwen.vo.ChuChaQingJiaTongJi;
import com.lijwen.vo.ChuQinJiaBanGongXiuTongJiVo;
import com.lijwen.vo.MyAskForLeave;
import com.lijwen.vo.MyClass;
import com.lijwen.vo.PunchCard;
@Transactional
@Service("ipersonAttendanceSv")
public class PersonAttendanceImpl  implements IpersonAttendanceSv{
@Autowired
PersonAttendanceDao personAttendanceDao;
@Autowired
StaffclassperiodsigninrecordMapper staffclassperiodsigninrecordDao;
@Autowired
AskForLeaveMapper askForLeaveDao;
@Autowired
KaoQinTongJiDao kaoQinTongJiDao;
@Autowired
StaffRetroactiveMapper staffRetroactiveDao;

/**
  * 查询我的班次信息
  */
	public List<MyClass> selectPersonClass(String beginDate, String endDate,
			int staffid) {
		List<MyClass> myClasses= personAttendanceDao.selectPersonClass(beginDate, endDate, staffid);
		return myClasses;
	}
   @Override
    public List<PunchCard> selectPunchCard(String workDate, int staffId) {
	return personAttendanceDao.selectPunchCard(workDate, staffId);
}
@Override
public int updateClassperiodsigninrecord(Staffclassperiodsigninrecord staffclassperiodsigninrecord){
	return personAttendanceDao.updateClassperiodsigninrecord(staffclassperiodsigninrecord);
}
	/**新增不定时班次签到记录**/
   public int insertClassperiodsigninrecord(Staffclassperiodsigninrecord staffclassperiodsigninrecord) {
	return staffclassperiodsigninrecordDao.insertSelective(staffclassperiodsigninrecord);
   }
    /**新增请假、出差**/
	public int insertAskForLeave(AskForLeave askforleave) {
	return askForLeaveDao.insertSelective(askforleave);
	}
	/**新增申请加班的班次**/
	public int insertJiaBan(AskForLeave askforleave, int classid) {
		askForLeaveDao.insertSelective(askforleave);
		int askForLeaveId=askforleave.getAskforleaveid();
	    int i=	askForLeaveDao.insertAskForLeaveMx(classid, askForLeaveId);
		return i;
	}
	public List<MyAskForLeave> selectAskForLeave(int staffid, String startDate,
			String endDate, int checkTypeId, int registrationTypeId) {
		List<MyAskForLeave> myAskForLeaves=   askForLeaveDao.selectAskForLeave(staffid, startDate, endDate, checkTypeId, registrationTypeId);
		   return myAskForLeaves;
	}
	 
	public List<Positionclasses> selectClassByAttendanceClassChildId(
			int staffId, int attendanceClassChildId) {
		return askForLeaveDao.selectClassByAttendanceClassChildId(staffId, attendanceClassChildId);
		 
	}
	/**修改申请加班班次**/
	public int updateByAskForLeaveMxId(AskForLeave askforleave,int positionClassesId,
			int askForLeaveMxId) {
		updateAskForLeave(askforleave);
	    int i=askForLeaveDao.updateByAskForLeaveMxId(positionClassesId, askForLeaveMxId);
		return i;
	}
	 /**修改请假、加班出差信息**/
	public int updateAskForLeave(AskForLeave askforleave) {
		int i= askForLeaveDao.updateByPrimaryKeySelective(askforleave);
		return i;
	}
	/**删除申请加班班次**/
	public int deleteByAskForLeaveMxId(int askForLeaveId,int askForLeaveMxId) {
	 int i=askForLeaveDao.deleteByPrimaryKey(askForLeaveId);	
	       if(askForLeaveMxId!=0){
	    	   askForLeaveDao.deleteByAskForLeaveMxId(askForLeaveMxId);
	       }
	 return i;
	}
	  /**查询我的考勤记录之出差请假**/
	public List<ChuChaQingJiaTongJi> selectChuChaQingJia(String starDate,
			String endDate, int[] staffids) {
		List<ChuChaQingJiaTongJi> list= kaoQinTongJiDao.selectChuChaQingJia(starDate, endDate, staffids);
		return list;
	}
	 /**查询我的考勤记录之出勤、加班、公休**/
	public List<ChuQinJiaBanGongXiuTongJiVo> selectChuQingJiaBanGongXiuTongJi(
			String starDate, String endDate, int[] staffids) {
		List<ChuQinJiaBanGongXiuTongJiVo> list=kaoQinTongJiDao.selectChuQingJiaBanGongXiuTongJi(starDate, endDate, staffids);
		return list;
	}
	/**新增补签登记记录**/
	public int insertStaffretroactive(StaffRetroactive staffretroactive) {
		 int i=staffRetroactiveDao.insertSelective(staffretroactive);
		return i;
	}
	/**查询班段申请补签记录**/
	public List<StaffRetroactive> selectRecord(int staffClassesChildRecordId,
			boolean toAndFrom) {
		return   staffRetroactiveDao.selectRecord(staffClassesChildRecordId, toAndFrom);
	}
	 /**多条件查询我的所有补签申请 **/ 
	public List<StaffRetroactive> selectMyRetroactive(int staffid,String starDate,
			String endDate, int checkTypeId) {
		return staffRetroactiveDao.selectMyRetroactive(staffid,starDate, endDate, checkTypeId);
	}
	
}
