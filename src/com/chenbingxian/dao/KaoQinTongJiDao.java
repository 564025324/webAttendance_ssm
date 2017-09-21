package com.chenbingxian.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenbingxian.vo.ChuChaQingJiaTongJi;
import com.chenbingxian.vo.ChuQinJiaBanGongXiuTongJiVo;

public interface  KaoQinTongJiDao {
  /**查询员工出差请假统计的时间**/
 List<ChuChaQingJiaTongJi> selectChuChaQingJia(@Param("starDate")String starDate,@Param("endDate")String endDate,@Param("staffids")int[]staffids);
 /** 查询员工出勤、加班、公休统计的时间 **/
 List<ChuQinJiaBanGongXiuTongJiVo> selectChuQingJiaBanGongXiuTongJi(@Param("starDate")String starDate,@Param("endDate")String endDate,@Param("staffids")int[]staffids);
}
