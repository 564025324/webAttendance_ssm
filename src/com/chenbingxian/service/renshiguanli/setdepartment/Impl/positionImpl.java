package com.chenbingxian.service.renshiguanli.setdepartment.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chenbingxian.dao.StaffPositionMapper;
import com.chenbingxian.po.StaffPosition;
import com.chenbingxian.service.renshiguanli.setdepartment.IpositionSv;
@Service("ipositionSv")
public class positionImpl implements IpositionSv {
	@Autowired
	StaffPositionMapper staffPositionDo;
	@Override
	//查询部门职务
	public List<StaffPosition> selectBydepartmentId(int departmentid) {
	  List<StaffPosition> staffPositions= staffPositionDo.selectBydepartmentId(departmentid);
		return staffPositions;
	}
	//查询子部门职务
	@Override
	public List<StaffPosition> selectBydepartmentIds(int[] departmentids) {
		
		return staffPositionDo.selectBydepartmentIds(departmentids);
	}

	@Override
	public StaffPosition selectById(int id) {
		return null;
	}

	@Override
	public int insert(StaffPosition t) {
		
		return staffPositionDo.insert(t);
	}

	@Override
	public int update(StaffPosition t) {
		return staffPositionDo.updateByPrimaryKeySelective(t);
	}

	@Override
	public int delete(int id) {
		return staffPositionDo.deleteByPrimaryKey(id);
	}
	


}
