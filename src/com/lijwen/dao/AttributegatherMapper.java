package com.lijwen.dao;

import com.lijwen.po.Attributegather;

public interface AttributegatherMapper {
    int deleteByPrimaryKey(Integer attributegatherid);

    int insert(Attributegather record);

    int insertSelective(Attributegather record);

    Attributegather selectByPrimaryKey(Integer attributegatherid);

    int updateByPrimaryKeySelective(Attributegather record);

    int updateByPrimaryKey(Attributegather record);
}