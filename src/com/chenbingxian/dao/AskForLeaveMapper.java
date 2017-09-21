package com.chenbingxian.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenbingxian.po.AskForLeave;
import com.chenbingxian.po.Positionclasses;
import com.chenbingxian.vo.GengGaiPaiPanXinXi;
import com.chenbingxian.vo.MyAskForLeave;

public interface AskForLeaveMapper {
	int deleteByPrimaryKey(Integer askforleaveid);

	int insert(AskForLeave record);

	int insertSelective(AskForLeave record);

	AskForLeave selectByPrimaryKey(Integer askforleaveid);

	int updateByPrimaryKeySelective(AskForLeave record);

	int updateByPrimaryKey(AskForLeave record);

	/** 新增申请加班的班次 **/
	int insertAskForLeaveMx(@Param("positionClassesId") int positionClassesId,
			@Param("askForLeaveId") int askForLeaveId);

	/** 查询我的请假、加班、出差信息 **/
	List<MyAskForLeave> selectAskForLeave(@Param("staffid") int staffid,
			@Param("startDate") String startDate,
			@Param("endDate") String endDate,
			@Param("checkTypeId") int checkTypeId,
			@Param("registrationTypeId") int registrationTypeId);

	/** 根据加班类别查询班组中对应的班次 **/
	List<Positionclasses> selectClassByAttendanceClassChildId(
			@Param("staffId") int staffId,
			@Param("attendanceClassChildId") int attendanceClassChildId);

	/** 修改申请加班班次 **/
	int updateByAskForLeaveMxId(
			@Param("positionClassesId") int positionClassesId,
			@Param("askForLeaveMxId") int askForLeaveMxId);
	/** 删除申请加班班次 **/
	int deleteByAskForLeaveMxId(@Param("askForLeaveMxId") int askForLeaveMxId);
	/** 查询所有员工请假、加班、出差的申请 **/
	List<MyAskForLeave> selectAllAskForLeave(
			@Param("checkTypeId") int checkTypeId);
	/** 修改请假、出差申请信息和修改签到记录表的考勤状态 **/
	int updateRecord(@Param("startdate")String startdate,@Param("enddate")String enddate,@Param("staffid")int staffid,@Param("attendanceClassChildId")int attendanceClassChildId);
	 /**删除申请加班时段的签到表的信息和工作日表的信息**/
	int deleteRecord(@Param("startdate")String startdate,@Param("enddate")String enddate,@Param("staffid")int staffid);
	 /**新增申请加班的信息到工作日记录表和签到记录表**/
	int  insertRecordAndSigninRecord(@Param("listInsert")List<GengGaiPaiPanXinXi>listInsert,@Param("staffid")int staffid);

}