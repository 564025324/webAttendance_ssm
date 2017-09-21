package com.chenbingxian.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenbingxian.po.StaffPosition;

public interface StaffPositionMapper {
    int deleteByPrimaryKey(Integer staffpositionid);

    int insert(StaffPosition record);

    int insertSelective(StaffPosition record);

    StaffPosition selectByPrimaryKey(Integer staffpositionid);

    int updateByPrimaryKeySelective(StaffPosition record);

    int updateByPrimaryKey(StaffPosition record);
     //新增的
      List<StaffPosition> selectBydepartmentId(@Param("departmentid") int departmentId);
      List<StaffPosition> selectBydepartmentIds(@Param("departmentids") int[] departmentIds);
      //根据机构id查询机构名称编号和职务
      List<StaffPosition> selectByids(@Param("ids")int[] ids);
}