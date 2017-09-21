package com.chenbingxian.dao;

import com.chenbingxian.po.StaffPositionPower;

public interface StaffPositionPowerMapper {
    int deleteByPrimaryKey(Integer staffpositionpowerid);

    int insert(StaffPositionPower record);

    int insertSelective(StaffPositionPower record);

    StaffPositionPower selectByPrimaryKey(Integer staffpositionpowerid);

    int updateByPrimaryKeySelective(StaffPositionPower record);

    int updateByPrimaryKey(StaffPositionPower record);
}