package com.chenbingxian.service.kaoqinguangli.kaoqinzhidushezhi;

import java.util.List;

import com.chenbingxian.core.base.BaseService;
import com.chenbingxian.po.GoOutSystem;
import com.chenbingxian.po.LateAndLeaveEarlySystem;
import com.chenbingxian.po.NotClassesSystem;
import com.chenbingxian.po.OtherStystem;
import com.chenbingxian.po.OvertimeSystem;
import com.chenbingxian.po.System;

public interface IsetSystem extends BaseService<System, String> {
	public List<System> selectSystems();


	/** 新增考勤制度及明细 **/
	public int insertSystemsAndMx(System s, LateAndLeaveEarlySystem late,
			NotClassesSystem n, OvertimeSystem o, OtherStystem other,
			GoOutSystem out);
	/** 根据Systemid查询迟到早退制度 **/
	public LateAndLeaveEarlySystem selectLateAndLeaveSys(int systemid );

	/** 根据Systemid无班次考勤制度 **/
	public NotClassesSystem selectNotClassesSys(int systemid );

	/** 根据Systemid加班制度 **/
	public OvertimeSystem selectOvertimeSys(int systemid  );

	/** 根据Systemid其他制度 **/
	public OtherStystem selectOtherStystemSys(int systemid );

	/** 根据Systemid外出制度 **/
	public GoOutSystem selectGoOutSys(int systemid );
	/** 修改迟到早退制度 **/
	public int updateLateAndLeaveSys(LateAndLeaveEarlySystem t);

	/** 修改无班次考勤制度 **/
	public int updateNotClassesSys(NotClassesSystem t);
	/** 修改加班制度 **/
	public int updateOvertimeSys(OvertimeSystem t);
	/** 修改其他制度 **/
	public int updateOtherStystemSys(OtherStystem t);
	/** 修改外出制度 **/
	public int updateGoOutSys(GoOutSystem t);
     }
