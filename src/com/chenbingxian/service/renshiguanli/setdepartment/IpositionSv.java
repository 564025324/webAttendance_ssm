package com.chenbingxian.service.renshiguanli.setdepartment;

import java.util.List;

import com.chenbingxian.core.base.BaseService;
import com.chenbingxian.po.StaffPosition;

public interface IpositionSv extends BaseService<StaffPosition, String> {
public List<StaffPosition> selectBydepartmentId(int departmentid );
public List<StaffPosition> selectBydepartmentIds(int[] departmentids );
}
