package com.lijwen.dao;

import java.util.List;

import com.lijwen.po.Shift;

public interface ShiftMapper {
    int deleteByPrimaryKey(Integer shiftid);

    int insert(Shift record);

    int insertSelective(Shift record);

    Shift selectByPrimaryKey(Integer shiftid);

    int updateByPrimaryKeySelective(Shift record);

    int updateByPrimaryKey(Shift record);
    /*新增的*/
    List<Shift>selectShiftByPositionid(int id);
}