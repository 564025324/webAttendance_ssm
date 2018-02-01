package com.lijwen.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lijwen.po.Staffclassperiodsigninrecord;
import com.lijwen.vo.MyClass;
import com.lijwen.vo.PunchCard;

public interface PersonAttendanceDao {
   /**查询我的班次信息**/
   List<MyClass> selectPersonClass(@Param("beginDate") String beginDate,@Param("endDate")  String  endDate,@Param("staffid")int staffid);
   /**查询考勤个人打卡的班段等信息**/
   List<PunchCard> selectPunchCard(@Param("workDate")String workDate,@Param("staffId")int staffId);
   /**正常班次签到**/
  /* int updateClassperiodsigninrecord(@Param("signInTime") String signInTime,@Param("attendanceClassChildId")int attendanceClassChildId, @Param("lateNo")int lateNo,@Param("signInWayId")int signInWayId,@Param("SignInNumber")String SignInNumber
 ,@Param("staffClassPeriodSignInRecordId")int  staffClassPeriodSignInRecordId,@Param("signBackTime")String signBackTime,@Param("leaveEarlyNo")int leaveEarlyNo);*/
   int updateClassperiodsigninrecord(Staffclassperiodsigninrecord staffclassperiodsigninrecord);
}
