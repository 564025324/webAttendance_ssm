package com.lijwen.service.renshiguanli.setdepartment;

import java.util.List;

import com.lijwen.core.base.BaseService;
import com.lijwen.po.StaffPosition;

public interface IpositionSv extends BaseService<StaffPosition, String> {
public List<StaffPosition> selectBydepartmentId(int departmentid );
public List<StaffPosition> selectBydepartmentIds(int[] departmentids );
}
