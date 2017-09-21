package com.chenbingxian.service.renshiguanli.staff.Impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chenbingxian.controller.renshiguanli.staff;
import com.chenbingxian.dao.StaffMapper;
import com.chenbingxian.po.Staff;
import com.chenbingxian.service.renshiguanli.staff.IstaffSv;
@Service("istaffSv")
public class staffImpl implements IstaffSv{
   @Autowired
   StaffMapper staffMapper;
  
	
	@Override
	public List<Staff> selectAll(int[] departmentids, int positionid, int typeid,
			String number, String name,int groupid) {
		 	return staffMapper.selectAll(departmentids, positionid, typeid, number, name,groupid);
	}

	public Staff selectById(int id) {
		return staffMapper.selectByPrimaryKey(id);
	}

	 
	public int insert(Staff t) {
		return staffMapper.insertSelective(t);
	}

	 
	public int update(Staff t) {
		 
		return staffMapper.updateByPrimaryKeySelective(t);
	}

	 
	public int delete(int id) {
		 
		return staffMapper.deleteByPrimaryKey(id);
		 
	}
	 /** 模糊只查询机构对应的员工**/
	@Override
	public List<Staff> selectStaff(int departmentId,String name,String number){
	 List<Staff> staffs=staffMapper.selectStaff(departmentId, name, number);
		return staffs;
	}
    /**修改员工班组id**/
	@Override
	public int updateStaffGroupId(int[] staffids, int groupid) {
		int i= staffMapper.updateStaffGroupId(staffids, groupid);
		return i;
	}

	 /**根据班组id查询员工信息**/
	public List<Staff> selectStaffByGroupId(int groupid) {
		List<Staff> staffs=	staffMapper.selectStaffByGroupId(groupid);
		return staffs;
	}

	 /**编辑班组时修改班组和删除大于今天的考勤安排 **/
	public int editByGroupidAndStaffids(int groupid, int[] staffids) {
	 int i=	staffMapper.editByGroupidAndStaffids(groupid, staffids);
		return i;
	}

	public int deleteRecordByStaffid(int staffid) {
		int i= staffMapper.deleteRecordByStaffid(staffid);
		return i;
	}

	 /**修改某个员工制度时改变班次安排大于今天的考勤制度 **/
	public int updateStaffSystem(int staffid, int systemid) {
	  int i=staffMapper.updateStaffSystem(staffid, systemid);
		return i;
	}

	@Override
	public Staff selectUserByUserName(String username, String password) {
		return staffMapper.selectUserByUserName(username, password);
	}

	
}
