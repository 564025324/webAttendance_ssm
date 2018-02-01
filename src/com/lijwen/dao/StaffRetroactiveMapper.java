package com.lijwen.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lijwen.po.StaffRetroactive;
import com.lijwen.vo.DealwihthRetroative;
import com.lijwen.vo.Unusual;

public interface StaffRetroactiveMapper {
    int deleteByPrimaryKey(Integer staffretroactiveid);

    int insert(StaffRetroactive record);

    int insertSelective(StaffRetroactive record);

    StaffRetroactive selectByPrimaryKey(Integer staffretroactiveid);

    int updateByPrimaryKeySelective(StaffRetroactive record);

    int updateByPrimaryKey(StaffRetroactive record);
    
    /**查询班段申请补签记录**/ 
    List<StaffRetroactive> selectRecord(@Param("staffClassesChildRecordId")int staffClassesChildRecordId,@Param("toAndFrom")boolean toAndFrom);
    /**多条件查询我的所有补签申请 **/ 
    List<StaffRetroactive> selectMyRetroactive(@Param("staffid")int staffid,@Param("startDate")String starDate,@Param("endDate")String endDate,@Param("checkTypeId")int checkTypeId);
    /**查询异常信息进行处理**/   
    List<Unusual>  selectUnusual();
    /**处理异常考勤时修改考勤类别**/
    int updateAttendanceType(@Param("staffClassPeriodSignInRecordId")int staffClassPeriodSignInRecordId ,@Param("attendanceClassChildId")int attendanceClassChildId );
    /**查询所有补签申请**/
    List<DealwihthRetroative> selectDealwihthRetroative(@Param("checkStateId")int checkStateId);
}