package com.lijwen.dao;

import com.lijwen.po.GttributeGather;

public interface GttributeGatherMapper {
    int deleteByPrimaryKey(Integer attributegatherid);

    int insert(GttributeGather record);

    int insertSelective(GttributeGather record);

    GttributeGather selectByPrimaryKey(Integer attributegatherid);

    int updateByPrimaryKeySelective(GttributeGather record);

    int updateByPrimaryKey(GttributeGather record);
}