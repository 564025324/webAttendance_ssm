package com.lijwen.controller.kaoqinguanli;

import java.io.PrintWriter;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lijwen.core.base.BaseController;
import com.lijwen.po.Attendanceclasschild;
import com.lijwen.service.kaoqinguangli.kaoqingleibieshezhi.IsetAttendanceTypeSv;
import com.lijwen.service.paibanguangli.bancishezhi.IclassperiodSv;
@Controller
@RequestMapping("/setAttendanceType")
public class SetAttendanceType {
  @Autowired
  IsetAttendanceTypeSv isetAttendanceTypeSv;

	
	public String selectByAttendanceTypeId(int attendanceTypeId){
		
		return "";
	}
	
	@RequestMapping("/selectByaAtendancectypeid")
    public void selectByaAtendancectypeid(int id,PrintWriter pw){
	 String  str=JSONArray.fromObject(isetAttendanceTypeSv.selectAttendanceById(id)).toString();
	 pw.write(str);
	}
	@ResponseBody
	@RequestMapping(value="/updateAttendanceclasschild",produces = "text/html;charset=UTF-8" )
	public String update(Attendanceclasschild t) {
		int i= isetAttendanceTypeSv.update(t);
		return ""+i;
	}
	@ResponseBody
	 @RequestMapping(value="/insertAttendanceclasschild",produces = "text/html;charset=UTF-8" )
 
	public String insert(Attendanceclasschild t) {
		int i= isetAttendanceTypeSv.insert(t);
		return ""+i;
	}

	@ResponseBody
    @RequestMapping(value="/selectByChildid",produces = "text/html;charset=UTF-8" )
	public String selectById(int id) {
	 String str=JSONArray.fromObject(isetAttendanceTypeSv.selectById(id)).toString() ;
		return str;
	}
	@ResponseBody
	@RequestMapping(value="/deleteAttendanceclasschild",produces = "text/html;charset=UTF-8" )
 
	public String delete(int id) {
		int i= isetAttendanceTypeSv.delete(id);
		return ""+i;
	}

}
