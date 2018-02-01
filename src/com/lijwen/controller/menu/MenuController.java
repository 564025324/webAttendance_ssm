package com.lijwen.controller.menu;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.ObjectUtils.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lijwen.po.Staff;
import com.lijwen.service.renshiguanli.staff.IstaffSv;

@Controller
@RequestMapping("/menuController")
public class MenuController {
	@Autowired
	IstaffSv istaffSv;
	@RequestMapping("/redirectScheduling")
	/**人员排班**/
	public String ZhuanTiaoYeMian() {
		return "/paibanguangli/paiban/scheduling";
	}

	/** 班次设置 **/
	@RequestMapping("/selectClasses")
	public String selectAll() {
		return "/paibanguangli/bancishezhi/setClasses";
	}

	/** 员工管理 **/
	@RequestMapping("/selectStaff")
	public String redirect() {
		return "/renshiguanli/renyuanluru/staff";
	}

	/** 考勤制度设置 **/
	@RequestMapping("/selectSystem")
	public String selectSystem() {
		return "/kaoqinguangli/kaoqinzhidushezhi/setSystem";
	}

	/** 考勤类别设置 **/
	@RequestMapping("/selectByAttendanceType")
	public String selectByAttendanceType() {
		return "/kaoqinguangli/kaoqinleibieshezhi/setAttendanceType";
	}
	@RequestMapping("/selectMyClass")
    /**我的班次查询**/
	public String selectMyClass(){
	return "/gerenkaoqinxinxi/myClass";	
	}
	
	/**考勤打卡**/
	@RequestMapping("/punchCard")
	public String punchCard(){
	return "/gerenkaoqinxinxi/PunchCard";	
	}
	@RequestMapping("/selectMyAttendance")
    /**查询我的考勤记录**/
	public String selectMyAttendance(){
	return "/gerenkaoqinxinxi/myAttendance";	
	}
	@RequestMapping("/selectMyAskForLeave")
	/**我要请假**/
	public String selectMyAskForLeave(){
	return "/gerenkaoqinxinxi/myAskForLeave";	
	}
	@RequestMapping("/selectAllAskForLeave")
	/**请假、加班申请处理**/
	public String selectAllAskForLeave(){
	return "/kaoqinchuli/qingjiajiabanchuli/dealwithAskForLeave";	
	}
	@RequestMapping("/selectMyRetroactive")
	/**查询补签申请**/
	public String  selectMyRetroactive(){
     return "/gerenkaoqinxinxi/myRetroactive";	
 }
	@RequestMapping("/selectDealwihthRetroative")
	/**查询补签、异常信息进行处理**/
	public String selectDealwihthRetroative(){
		 return "/kaoqinchuli/buqianyichangchuli/dealwihthRetroative";
	}
	@RequestMapping("/attendanceStatistics")
	/**查询部门考勤统计信息**/
	public String attendanceStatistics(){
		 return "/kaoqintongji/bumenkaoqintongji/attendanceStatistics";
	}
	@RequestMapping("/login")
	public String login(String username,String password,HttpServletRequest request){
		Staff user=istaffSv.selectUserByUserName(username, password);
		if(user!=null){
			 request.getSession().setAttribute("user", user);
			 return "/login_main/main"; 
		 }else{
			 request.setAttribute("tishi", "用户名或密码错误");
			 return "/login_main/login";
		 }
	}
	
	
}
