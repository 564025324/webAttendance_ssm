package com.chenbingxian.service.kaoqinguangli.kaoqingleibieshezhi;

import java.io.PrintWriter;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenbingxian.core.base.BaseService;
import com.chenbingxian.po.Attendanceclasschild;

public interface IsetAttendanceTypeSv extends BaseService<Attendanceclasschild, String >{
	 List<Attendanceclasschild> selectAttendanceById(int id);
}
