package com.lijwen.controller.paibanguangli;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lijwen.core.base.BaseController;
import com.lijwen.po.Shift;
import com.lijwen.po.ShiftChild;
import com.lijwen.service.paibanguangli.gudingbancishezhi.IsetShiftChildSv;
import com.lijwen.service.paibanguangli.gudingbancishezhi.IsetShiftSv;

@Controller
@RequestMapping("/SetShift")
public class SetShift{
	@Autowired
	IsetShiftSv isetShiftSv;
	@Autowired
	IsetShiftChildSv isetShiftChildSv;
    @RequestMapping("/selectShift")
	public String selectAll() {
		return "/paibanguangli/gudingbancishezhi/setShift";
	}
  /*  根据职务id查询固定轮班名称*/
    @RequestMapping("/selectShiftByPositionid")
    public void selectShiftByPositionid(int id,PrintWriter pw){
      List<Shift> shifts=isetShiftSv.selectShiftByPositionid(id);
      String str=JSONArray.fromObject(shifts).toString();
      pw.write(str);
    }
	 
     /*新增固定轮班名称和明细*/
     @RequestMapping(value="/insertShiftAndChild")
	 public void insertAll(String t,String listChild,PrintWriter pw){
    	 JSONObject obj = new JSONObject().fromObject(t);
    	 JSONArray json = JSONArray.fromObject(listChild);
    	 Shift shift = (Shift)JSONObject.toBean(obj,Shift.class);
    	 List<ShiftChild> shiftChilds=JSONArray.toList(json,ShiftChild.class);
    	int i= isetShiftSv.insertAll(shift, shiftChilds);
    	pw.write(""+i);
     }
    /* 根据固定轮班id查询固定轮班明细*/
     @RequestMapping(value="/selectShiftChildByShiftid")
     public void selectShiftChildByShiftid(int shiftid,PrintWriter pw){
    	List<ShiftChild> shiftChilds= isetShiftChildSv.selectbyShiftId(shiftid);
    	String str= JSONArray.fromObject(shiftChilds).toString();
    	pw.write(str);
     }
     /*删除固定轮班和明细*/
     @RequestMapping(value="/deleteShiftAndChild")
     public void deleteShiftAndChild(int shiftid,PrintWriter pw){
    	 int i=isetShiftSv.delete(shiftid);
    	 pw.write(""+i);
     }
    /* 修改固定轮班*/
     @RequestMapping(value="/updateShift")
     public void updateShift(Shift t,PrintWriter pw){
    	int i=isetShiftSv.update(t);
    	pw.write(""+i);
     }
    /* 修改固定轮班明细*/
     @RequestMapping(value="/updateShiftChild")
     public void updateShiftChild(ShiftChild t,PrintWriter pw){
    	int i= isetShiftChildSv.update(t);
    	pw.write(""+i);
     }
     
}
