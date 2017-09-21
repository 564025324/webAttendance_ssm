package com.chenbingxian.dao;

import com.chenbingxian.po.Attributegather;

public interface AttributegatherMapper {
    int deleteByPrimaryKey(Integer attributegatherid);

    int insert(Attributegather record);

    int insertSelective(Attributegather record);

    Attributegather selectByPrimaryKey(Integer attributegatherid);

    int updateByPrimaryKeySelective(Attributegather record);

    int updateByPrimaryKey(Attributegather record);
}