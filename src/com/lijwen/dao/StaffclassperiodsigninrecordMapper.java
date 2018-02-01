package com.lijwen.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lijwen.po.Staffclassperiodsigninrecord;
import com.lijwen.vo.PunchCard;

public interface StaffclassperiodsigninrecordMapper {
    int deleteByPrimaryKey(Integer staffclassperiodsigninrecordid);

    int insert(Staffclassperiodsigninrecord record);

    int insertSelective(Staffclassperiodsigninrecord record);

    Staffclassperiodsigninrecord selectByPrimaryKey(Integer staffclassperiodsigninrecordid);

    int updateByPrimaryKeySelective(Staffclassperiodsigninrecord record);

    int updateByPrimaryKey(Staffclassperiodsigninrecord record);
   
}