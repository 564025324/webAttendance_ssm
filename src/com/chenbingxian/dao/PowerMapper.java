package com.chenbingxian.dao;

import com.chenbingxian.po.Power;

public interface PowerMapper {
    int insert(Power record);

    int insertSelective(Power record);
}