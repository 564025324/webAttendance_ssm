package com.chenbingxian.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chenbingxian.po.Department;
@Repository("departmentMapper")
public interface DepartmentMapper {
    int deleteByPrimaryKey(Integer departmentid);
    List<Department> selectAll();
    int insert(Department record);
    
    int insertSelective(Department record);
    
    Department selectByPrimaryKey(Integer departmentid);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
}