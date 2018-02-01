package com.lijwen.controller.paibanguangli;

import java.io.PrintWriter;
import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lijwen.controller.renshiguanli.staff;
import com.lijwen.po.AttributeGatherChild;
import com.lijwen.po.Classesgroup;
import com.lijwen.po.Positionclasses;
import com.lijwen.po.Staff;
import com.lijwen.service.paibanguangli.bancishezhi.IsetClassesSv;
import com.lijwen.service.paibanguangli.paiban.IclassGroupSv;
import com.lijwen.service.paibanguangli.paiban.IstaffClassesRecordSv;
import com.lijwen.service.renshiguanli.staff.IstaffSv;
import com.lijwen.vo.GengGaiPaiBanList;
import com.lijwen.vo.GengGaiPaiPanXinXi;
import com.lijwen.vo.YuanGongFenBanJiLu;
import com.lijwen.vo.paibanchaxunVo;

@Controller
@RequestMapping("/Scheduling")
public class Scheduling {
	@Autowired
	IstaffClassesRecordSv istaffClassesRecordSv;
	@Autowired
	IstaffSv istaffSv;
	@Autowired
	IsetClassesSv isetClassesSv;
	@Autowired
	IclassGroupSv iclassGroupSv;

	
	/** 查询班组信息 **/
	@RequestMapping("/selectClassGroup")
	public void selectClassGroup(PrintWriter pw) {
		List<paibanchaxunVo> banzuList = istaffClassesRecordSv
				.selectClassGroup();
		String str = listToJson(banzuList);
		pw.write(str);
	}
	/** 模糊查询员工信息 **/
	@RequestMapping("/selectStaff")
	public void selectStaff(int departmentId, String name, String number,
			PrintWriter pw) {
		List<Staff> staffs = istaffSv.selectStaff(departmentId, name, number);
		String str = listToJson(staffs);
		pw.write(str);
	}

	/** 查询班次信息 **/
	@RequestMapping("/selectClass")
	public void selectClass(PrintWriter pw) {
		List<Positionclasses> listClass = isetClassesSv.selectClass();
		String str = listToJson(listClass);
		pw.write(str);
	}

	/** 新增班组 **/
	@RequestMapping("/insertGroupName")
	public void insertClassGroup(AttributeGatherChild t, PrintWriter pw) {
		int id = iclassGroupSv.insertClassGroup(t);
		pw.write("" + id);
	}
	 /**修改班组名称**/
	@RequestMapping("/editGroupName")
    public void editClassGroupName(AttributeGatherChild t,PrintWriter pw){
		int i= iclassGroupSv.editClassGroupName(t);
		pw.write(i);
	}
	/** 更改人员班组id **/
	@RequestMapping("/updateStaffGroupId")
	public void updateStaffGroupId(int[] staffids, int groupid, PrintWriter pw) {
		int i = istaffSv.updateStaffGroupId(staffids, groupid);
		pw.write("" + i);
	}
	/** 新增班组班次 **/
	@RequestMapping("/insertClassGroup")
	public void insertClassGroup(int[] classIds, int groupId, PrintWriter pw) {
		int i = iclassGroupSv.insertClassGroup(classIds, groupId);
		pw.write("" + i);
	}
	/** 编辑班组时查询班组人员信息 **/
	@RequestMapping("/selectGroupStff")
	public void selectGroupStff(int groupid, PrintWriter pw) {
		List<Staff> staffs = istaffSv.selectStaffByGroupId(groupid);
		String str = listToJson(staffs);
		pw.write(str);
	}
	/** 编辑班组时查询班次信息 **/
	@RequestMapping("/selectClassTimes")
	public void selectClassTimes(int groupid, PrintWriter pw) {
		List<Classesgroup> classesgroups = iclassGroupSv
				.selectClassesByGroupID(groupid);
		String str = listToJson(classesgroups);
		pw.write(str);
	}
	/** 编辑班组修改员工信息 **/
	@RequestMapping("/editByGroupidAndStaffids")
	public void editByGroupidAndStaffids(int groupid, int[] staffids,
			PrintWriter pw) {
		int i = istaffSv.editByGroupidAndStaffids(groupid, staffids);
		pw.write("" + i);
	}
	/**   编辑班组时修改班组班次信息**/
	@RequestMapping("/editClassesgroup")
	public void editClassesgroup(int[] ClassIds, int groupid, PrintWriter pw) {
		int i = iclassGroupSv.editClassesgroup(ClassIds, groupid);
		pw.write("" + i);
	}
	/**删除班组和附带信息**/
	@RequestMapping("/deleteGroupClass")
	public void deleteGroupClass(int groupid,PrintWriter pw) {
	 int i=	iclassGroupSv.deleteGroupClass(groupid);
		 pw.write(""+i);
	}
	@RequestMapping("/selectGroupRecord")
	 /** 查询班组员工分班记录 **/
	public void selectGroupRecord(int goupid,String bginDate,String endDate,PrintWriter pw)
	  {
		 List<YuanGongFenBanJiLu> YuanGongFenBanJiLus= istaffClassesRecordSv.selectGroupRecord(goupid, bginDate, endDate);
		  String str=listToJson(YuanGongFenBanJiLus);
		  pw.write(str);
	  }
	
	/**更改班组排班信息**/
	@RequestMapping("/updatePaiBanXinXi")
	public void updatePaiBanXinXi(GengGaiPaiBanList updateAndInsert,int[] deleteIds,int groupid,PrintWriter pw){
    int i= istaffClassesRecordSv.updatePaiBanXinXi(updateAndInsert.getListInsert(), deleteIds, updateAndInsert.getListUpdate(),groupid);
    pw.write(""+i);
	}
	
	
	/**list转json**/
	public <T> String listToJson(List<T> t) {
		JSONArray sjArray = JSONArray.fromObject(t);
		String str = sjArray.toString();
		return str;
	}
}
