package com.chenbingxian.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenbingxian.po.Classperiod;

public interface ClassperiodMapper {
    int deleteByPrimaryKey(Integer classperiodid);

    int insert(Classperiod record);

    int insertSelective(Classperiod record);

    Classperiod selectByPrimaryKey(Integer classperiodid);

    int updateByPrimaryKeySelective(Classperiod record);

    int updateByPrimaryKey(Classperiod record);
    /**根据班次id查询班段**/
    List<Classperiod> selectClassperiod(int Classid);
    /**当班段改变时修改签到表大于今天的班段id **/
    int updateSignrecordClassPeriodId(@Param("one_classPeriodId")int one_classPeriodId,@Param("tow_classPeriodId")int tow_classPeriodId);
    /** 当班段删除时删除大于今天的班段**/
    int deleteByClassPeriodId(@Param("classPeriodId")int classPeriodId);
    /**当班段新增时新增签到表的班段**/
    int insertByClassPeriodId(@Param("positionClassesId")int  positionClassesId,@Param("attendanceClassChildId")int attendanceClassChildId,@Param("classPeriodId")int classPeriodId);

}