package com.chenbingxian.service.renshiguanli.setdepartment;

import java.util.List;

import com.chenbingxian.core.base.BaseService;
import com.chenbingxian.po.AttributeGatherChild;
import com.chenbingxian.po.Department;
 
public interface IdepartmentSv  extends BaseService<Department, String>{
  public  List<Department> selectAll();
  //根据属性集合id查询明细信息
  public List<AttributeGatherChild> selectByAttributeGatherId(int attributeGatherId);
}
