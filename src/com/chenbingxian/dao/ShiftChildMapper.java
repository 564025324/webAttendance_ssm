package com.chenbingxian.dao;

import java.util.List;

import com.chenbingxian.po.ShiftChild;

public interface ShiftChildMapper {
    int deleteByPrimaryKey(Integer shiftchildid);

    int insert(ShiftChild record);

    int insertSelective(ShiftChild record);

    ShiftChild selectByPrimaryKey(Integer shiftchildid);

    int updateByPrimaryKeySelective(ShiftChild record);

    int updateByPrimaryKey(ShiftChild record);
    /*新增的 */ 
    List<ShiftChild> selectbyShiftId(int id);
    int deleteByShiftId(int shiftid);
}