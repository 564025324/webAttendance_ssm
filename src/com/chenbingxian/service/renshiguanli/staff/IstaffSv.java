package com.chenbingxian.service.renshiguanli.staff;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenbingxian.controller.renshiguanli.staff;
import com.chenbingxian.core.base.BaseService;
import com.chenbingxian.po.Staff;
import com.chenbingxian.po.StaffPosition;

public interface IstaffSv  extends BaseService<Staff, String>{
  public List<Staff>  selectAll(int[] departmentids,int positionid,int typeid,String number,String name,int groupid);
  /** 模糊只查询机构对应的员工**/
  public List<Staff> selectStaff(int departmentId,String name,String number);
  /**修改员工班组id**/
  int updateStaffGroupId( int[] staffids,int groupid);
  /**根据班组id查询员工信息**/
  List<Staff> selectStaffByGroupId(int groupid);
  /**编辑班组时修改班组和删除大于今天的考勤安排 **/
  public int editByGroupidAndStaffids(int groupid,int[]staffids);
  /**班组id改变时删除大于今天的考勤记录**/
  int deleteRecordByStaffid(int staffid);
  /**修改某个员工制度时改变班次安排大于今天的考勤制度 **/
  int  updateStaffSystem(int staffid,int systemid);
  /**根据用户名密码查找用户 **/
  Staff selectUserByUserName(String username,String password);

}
