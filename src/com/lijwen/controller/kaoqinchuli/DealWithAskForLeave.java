package com.lijwen.controller.kaoqinchuli;

import java.io.PrintWriter;
import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lijwen.core.query.Json;
import com.lijwen.po.AskForLeave;
import com.lijwen.service.kaoqinchuli.jiabangongxiudengji.IdealWithAskForLeaveSv;
import com.lijwen.vo.GengGaiPaiBanList;
import com.lijwen.vo.GengGaiPaiPanXinXi;
import com.lijwen.vo.MyAskForLeave;
import com.lijwen.vo.MyClass;

@Controller
@RequestMapping("DealWithAskForLeave")
public class DealWithAskForLeave {
	@Autowired
	IdealWithAskForLeaveSv idealWithAskForLeaveSv;
	/**查询所有员工请假、加班、出差的申请 **/
	@RequestMapping("selectAllAskForLeave")
   public void  selectAllAskForLeave(int checkTypeId,PrintWriter pw){
	    List<MyAskForLeave> myAskForLeaves= idealWithAskForLeaveSv.selectAllAskForLeave(checkTypeId);
		String str =Json.listToJson(myAskForLeaves);
		pw.write(str);
   }
	@RequestMapping("updateAskForLeavAandRecord")
	/**修改请假、出差申请信息和修改签到记录表的考勤状态**/
	public void updateAskForLeavAandRecord(AskForLeave askForLeave,PrintWriter pw) {
		int i=idealWithAskForLeaveSv.updateAskForLeavAandRecord(askForLeave);
	  pw.write(""+i);
	}
	@RequestMapping("updateAskAndDeleteInsertRecord")
	/**修改加班申请信息和删除签到记录新增签到记录**/ 
	public void updateAskAndDeleteInsertRecord(AskForLeave askForLeave,
	   GengGaiPaiBanList listinsert,PrintWriter pw){
	   int i=idealWithAskForLeaveSv.updateAskAndDeleteInsertRecord(askForLeave, listinsert.getListInsert());
	   pw.write(""+i);
	}
   
	
	
   /**list转json**/
	public <T> String listToJson(List<T> t) {
		JSONArray sjArray = JSONArray.fromObject(t);
		String str = sjArray.toString();
		return str;
	}
}
