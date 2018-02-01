package com.lijwen.service.kaoqinguangli.kaoqingleibieshezhi;

import java.io.PrintWriter;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lijwen.core.base.BaseService;
import com.lijwen.po.Attendanceclasschild;

public interface IsetAttendanceTypeSv extends BaseService<Attendanceclasschild, String >{
	 List<Attendanceclasschild> selectAttendanceById(int id);
}
