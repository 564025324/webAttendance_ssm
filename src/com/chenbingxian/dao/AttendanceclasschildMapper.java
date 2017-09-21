package com.chenbingxian.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenbingxian.po.Attendanceclasschild;

public interface AttendanceclasschildMapper {
    int deleteByPrimaryKey(Integer attendanceclasschildid);

    int insert(Attendanceclasschild record);

    int insertSelective(Attendanceclasschild record);

    Attendanceclasschild selectByPrimaryKey(Integer attendanceclasschildid);

    int updateByPrimaryKeySelective(Attendanceclasschild record);

    int updateByPrimaryKey(Attendanceclasschild record);
    
    //根据考勤类别ids查询考勤类别明细
    List<Attendanceclasschild> selectAttendanceByIds(@Param("attendanceCTypeIds") int[] ids);
    //根据考勤类别id查询考勤类别明细
    List<Attendanceclasschild> selectAttendanceById(@Param("attendanceCTypeId") int id);
}