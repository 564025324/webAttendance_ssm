package com.lijwen.controller.kaoqinguanli;

import java.io.PrintWriter;
import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lijwen.po.GoOutSystem;
import com.lijwen.po.LateAndLeaveEarlySystem;
import com.lijwen.po.NotClassesSystem;
import com.lijwen.po.OtherStystem;
import com.lijwen.po.OvertimeSystem;
import com.lijwen.po.System;
import com.lijwen.service.kaoqinguangli.kaoqinzhidushezhi.IsetSystem;

@Controller
@RequestMapping("SetSystem")
public class SetSystem {
	@Autowired
	IsetSystem isetSystem;
	@RequestMapping("selectSystems")
	/**查询所有考勤制度**/
	public void selectSystems(PrintWriter pw) {
		List<System> systems = isetSystem.selectSystems();
		String str = listToJson(systems);
		pw.write(str);
	}
    @RequestMapping("deleteSystemsAndMx")
    /**删除考勤制度和明细**/
    public void deleteSystemsAndMx(int systemid,PrintWriter pw){
    	int i= isetSystem.delete(systemid);
    	pw.write(""+i);
    }
	@RequestMapping("insertSystemsAndMx")
	/**新增制度和明细**/
	public void insertSystemsAndMx(System s, LateAndLeaveEarlySystem late,
			NotClassesSystem n, OvertimeSystem o, OtherStystem other,
			GoOutSystem out, PrintWriter pw) {
		int i = isetSystem.insertSystemsAndMx(s, late, n, o, other, out);
		pw.write("" + i);
	}

	@RequestMapping("updateSystems")
	/**修改考勤制度**/
	public void updateSystems(System s, PrintWriter pw) {
		int i = isetSystem.update(s);
		pw.write("" + i);

	}

	@RequestMapping("updateLateAndLeaveSys")
	/**修改迟到早退制度* */
	public void updateLateAndLeaveSys(LateAndLeaveEarlySystem t, PrintWriter pw) {
		int i = isetSystem.updateLateAndLeaveSys(t);
		pw.write("" + i);
	}

	@RequestMapping("updateNotClassesSys")
	/**修改无班次考勤制度 **/
	public void updateNotClassesSys(NotClassesSystem t, PrintWriter pw) {
		int i = isetSystem.updateNotClassesSys(t);
		pw.write("" + i);
	}
	
	@RequestMapping("updateOvertimeSys")
	/**修改加班制度**/
	public void updateOvertimeSys(OvertimeSystem t, PrintWriter pw) {
		int i = isetSystem.updateOvertimeSys(t);
		pw.write("" + i);
	}

	@RequestMapping("updateOtherStystemSys")
	/**修改其他制度**/
	public void updateOtherStystemSys(OtherStystem t, PrintWriter pw) {
		int i = isetSystem.updateOtherStystemSys(t);
		pw.write("" + i);
	}

	@RequestMapping("updateGoOutSys")
	/**修改外出制度**/
	public void updateGoOutSys(GoOutSystem t, PrintWriter pw) {
		int i = isetSystem.updateGoOutSys(t);
		pw.write("" + i);
	}
	@RequestMapping("selectLateAndLeaveSys")
	/**根据Systemid查询迟到早退制度 **/
	public void selectLateAndLeaveSys(int systemid, PrintWriter pw) {
		LateAndLeaveEarlySystem lateAndLeaveEarlySystem= isetSystem.selectLateAndLeaveSys(systemid);
		String str=listToJson(lateAndLeaveEarlySystem);
		   pw.write(str);
	}
	@RequestMapping("selectNotClassesSys")
	/**根据Systemid查询无班次制度 **/
	public void selectNotClassesSys(int systemid, PrintWriter pw) {
		NotClassesSystem notClassesSystem=	isetSystem.selectNotClassesSys(systemid);
		String str=listToJson(notClassesSystem);
		   pw.write(str);
	}
	@RequestMapping("selectOvertimeSys")
	/**根据Systemid查询加班制度 **/
	public void selectOvertimeSys(int systemid, PrintWriter pw) {
		OvertimeSystem overtimeSystem=  isetSystem.selectOvertimeSys(systemid);
		String str=listToJson(overtimeSystem);
		   pw.write(str);
	}
	@RequestMapping("selectOtherStystemSys")
	/**根据Systemid查询其他制度 **/
	public void selectOtherStystemSys(int systemid, PrintWriter pw) {
		OtherStystem otherStystem=	isetSystem.selectOtherStystemSys(systemid);
		  String str=listToJson(otherStystem);
		   pw.write(str);
	}
	@RequestMapping("selectGoOutSys")
	/**根据Systemid查询外出制度 **/
   public void selectGoOutSys(int systemid,PrintWriter pw) {
		GoOutSystem goOutSystem=isetSystem.selectGoOutSys(systemid);
	   String str=listToJson(goOutSystem);
	   pw.write(str);
	}

	/** list转json **/
	public <T> String listToJson(List<T> t) {
		JSONArray sjArray = JSONArray.fromObject(t);
		String str = sjArray.toString();
		return str;
	}
	/** 对象转json **/
	public <T> String listToJson(T t) {
		JSONArray sjArray = JSONArray.fromObject(t);
		String str = sjArray.toString();
		return str;
	}
}
