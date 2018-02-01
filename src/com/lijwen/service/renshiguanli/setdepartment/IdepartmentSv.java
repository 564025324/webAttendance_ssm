package com.lijwen.service.renshiguanli.setdepartment;

import java.util.List;

import com.lijwen.core.base.BaseService;
import com.lijwen.po.AttributeGatherChild;
import com.lijwen.po.Department;
 
public interface IdepartmentSv  extends BaseService<Department, String>{
  public  List<Department> selectAll();
  //根据属性集合id查询明细信息
  public List<AttributeGatherChild> selectByAttributeGatherId(int attributeGatherId);
}
