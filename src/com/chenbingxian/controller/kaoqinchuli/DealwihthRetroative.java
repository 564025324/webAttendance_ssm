package com.chenbingxian.controller.kaoqinchuli;

import java.io.PrintWriter;
import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chenbingxian.core.query.Json;
import com.chenbingxian.po.StaffRetroactive;
import com.chenbingxian.po.Staffclassperiodsigninrecord;
import com.chenbingxian.service.kaoqinchuli.buqiandenji.IdealwihthRetroativeSv;
import com.chenbingxian.vo.Unusual;

@Controller
@RequestMapping("DealwihthRetroative")
public class DealwihthRetroative {
	@Autowired
	IdealwihthRetroativeSv idealwihthRetroativeSv;
	@RequestMapping("selectUnusual")
	/**查询异常信息进行处理**/ 
	public void selectUnusual(PrintWriter pw) {
	  List<Unusual> list =idealwihthRetroativeSv.selectUnusual();
	   String str =Json.listToJson(list);
		pw.write(str);
	}
	@RequestMapping("updateAttendanceType")
	 /**处理异常考勤时修改考勤类别**/
	public void updateAttendanceType(int staffClassPeriodSignInRecordId,
			int attendanceClassChildId,PrintWriter pw) {
		    int i=idealwihthRetroativeSv.updateAttendanceType(staffClassPeriodSignInRecordId, attendanceClassChildId);
		    pw.write(""+i);
	}
	@RequestMapping("selectDealwihthRetroative")
	 /**查询所有补签申请**/
     public void selectDealwihthRetroative(int checkStateId,PrintWriter pw) {
		List<com.chenbingxian.vo.DealwihthRetroative> list=idealwihthRetroativeSv.selectDealwihthRetroative(checkStateId);
		String str =Json.listToJson(list);
		pw.write(str);
	}
	@RequestMapping("updateStaffclassperiodsigninrecord")
	/**修改签到表**/
	public void updateStaffclassperiodsigninrecord(Staffclassperiodsigninrecord t,PrintWriter pw) {
		int i= idealwihthRetroativeSv.updateStaffclassperiodsigninrecord(t);
		pw.write(""+i);
	}
	@RequestMapping("updateStaffretroactive")
	 /**修改补签登记表**/
	public void updateStaffretroactive(StaffRetroactive t,PrintWriter pw) {
		int i=idealwihthRetroativeSv.updateStaffretroactive(t);
		pw.write(""+i);
	}
	
	
	/**list转json**/
	public <T> String listToJson(List<T> t) {
		JSONArray sjArray = JSONArray.fromObject(t);
		String str = sjArray.toString();
		return str;
	}

}
