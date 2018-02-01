package com.lijwen.service.paibanguangli.bancishezhi;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lijwen.core.base.BaseService;
import com.lijwen.po.Attendanceclasschild;
import com.lijwen.po.Classperiod;

public interface IclassperiodSv extends BaseService<Classperiod, String>{
 //根据班次id查询班段
  public  List<Classperiod> selectClassperiod(int Classid);
  //根据考勤类别ids查询考勤类别明细
  public  List<Attendanceclasschild> selectAttendanceByIds(int[] ids);
  
}
