package com.chenbingxian.service.kaoqinguangli.kaoqinzhidushezhi.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chenbingxian.dao.GoOutSystemMapper;
import com.chenbingxian.dao.LateAndLeaveEarlySystemMapper;
import com.chenbingxian.dao.NotClassesSystemMapper;
import com.chenbingxian.dao.OtherStystemMapper;
import com.chenbingxian.dao.OvertimeSystemMapper;
import com.chenbingxian.dao.SystemMapper;
import com.chenbingxian.po.GoOutSystem;
import com.chenbingxian.po.LateAndLeaveEarlySystem;
import com.chenbingxian.po.NotClassesSystem;
import com.chenbingxian.po.OtherStystem;
import com.chenbingxian.po.OvertimeSystem;
import com.chenbingxian.po.System;
import com.chenbingxian.service.kaoqinguangli.kaoqinzhidushezhi.IsetSystem;

@Transactional
@Service("isetSystem")
public class SetSystemImpl implements IsetSystem {
	@Autowired
	SystemMapper systemDao;
	@Autowired
	LateAndLeaveEarlySystemMapper lateAndLeaveDao;
	@Autowired
	NotClassesSystemMapper notClassesDao;
	@Autowired
	GoOutSystemMapper goOutDao;
	@Autowired
	OvertimeSystemMapper overtimeDao;
	@Autowired
	OtherStystemMapper otherStystemDao;

	/** 查询所有考勤制度 **/
	public List<System> selectSystems() {
		List<System> systems = systemDao.selectSystems();
		return systems;
	}

	/** 新增考勤制度 **/
	public int insert(System t) {
		int i = systemDao.insert(t);
		int id = t.getSystemid();
		return id;
	}

	/** 修改考勤制度 **/
	public int update(System t) {
		int i = systemDao.updateByPrimaryKeySelective(t);
		return i;
	}

	/** 删除考勤制度 **/
	public int delete(int id) {
		int j = systemDao.panDuanZhiDuShiFouShiYongZhong(id).getNumber();
		if (j > 0) {
			return j;
		} else {
			systemDao.deleteByPrimaryKey(id);
			lateAndLeaveDao.deleteBySystemid(id);
			notClassesDao.deleteBySystemid(id);
			goOutDao.deleteBySystemid(id);
			overtimeDao.deleteBySystemid(id);
			int i = otherStystemDao.deleteBySystemid(id);
			return i;
		}
	}

	@Override
	public System selectById(int id) {

		return null;
	}

	public int insertSystemsAndMx(System s, LateAndLeaveEarlySystem late,
			NotClassesSystem n, OvertimeSystem o, OtherStystem other,
			GoOutSystem out) {
		int id = insert(s);
		late.setSystemid(id);
		n.setSystemid(id);
		o.setSystemid(id);
		other.setSystemid(id);
		out.setSystemid(id);
		lateAndLeaveDao.insert(late);
		notClassesDao.insert(n);
		overtimeDao.insert(o);
		goOutDao.insert(out);
		int i = otherStystemDao.insert(other);
		return i;
	}

	public int updateLateAndLeaveSys(LateAndLeaveEarlySystem t) {
		if (lateAndLeaveDao.PanDuanShuJuBianDong(t).size() > 0) {
			return 2;
		} else {
			int beforeLateAndLeaveEarlySystemId = t
					.getLateandleaveearlysystemid();
			int i = lateAndLeaveDao.updateDeleteType(t
					.getLateandleaveearlysystemid());
			lateAndLeaveDao.insert(t);
			int nowLateAndLeaveEarlySystemId = t.getLateandleaveearlysystemid();
			lateAndLeaveDao.updateRecordBySystemMxId(
					nowLateAndLeaveEarlySystemId,
					beforeLateAndLeaveEarlySystemId);
			return i;
		}
	}

	public int updateNotClassesSys(NotClassesSystem t) {
		if (notClassesDao.PanDuanShuJuBianDong(t).size() > 0) {
			return 2;
		} else {
			int beforeNotClassesSystemId = t.getNotclassessystemid();
			int i = notClassesDao.updateDeleteType(t.getNotclassessystemid());
			notClassesDao.insert(t);
			int nowNotClassesSystemId = t.getNotclassessystemid();
			notClassesDao.updateRecordBySystemMxId(nowNotClassesSystemId,
					beforeNotClassesSystemId);
			return i;
		}
	}

	public int updateOvertimeSys(OvertimeSystem t) {
		if (overtimeDao.PanDuanShuJuBianDong(t).size() > 0) {
			return 2;
		} else {
			int i = overtimeDao.updateDeleteType(t.getOvertimesystemid());
			int beforeOvertimeSystemId = t.getOvertimesystemid();
			overtimeDao.insert(t);
			int nowOvertimeSystemId = t.getOvertimesystemid();
			overtimeDao.updateRecordBySystemMxId(nowOvertimeSystemId,
					beforeOvertimeSystemId);
			return i;
		}
	}

	public int updateOtherStystemSys(OtherStystem t) {
		if (otherStystemDao.PanDuanShuJuBianDong(t).size() > 0) {
			return 2;
		} else {
			int beforeOtherStystemId = t.getOtherstystemid();
			int i = otherStystemDao.updateDeleteType(t.getOtherstystemid());
			otherStystemDao.insert(t);
			int nowOtherStystemId = t.getOtherstystemid();
			otherStystemDao.updateRecordBySystemMxId(nowOtherStystemId,
					beforeOtherStystemId);
			return i;
		}
	}

	public int updateGoOutSys(GoOutSystem t) {
		if (goOutDao.PanDuanShuJuBianDong(t).size() > 0) {
			return 2;
		} else {
			int beforeGoOutSystemId = t.getGooutsystemid();
			int i = goOutDao.updateDeleteType(t.getGooutsystemid());
			goOutDao.insert(t);
			int nowGoOutSystemId = t.getGooutsystemid();
			goOutDao.updateRecordBySystemMxId(nowGoOutSystemId,
					beforeGoOutSystemId);
			return i;
		}
	}

	public LateAndLeaveEarlySystem selectLateAndLeaveSys(int systemid) {
		LateAndLeaveEarlySystem lateAndLeaveEarlySystem = lateAndLeaveDao
				.selectBySystemid(systemid);
		return lateAndLeaveEarlySystem;
	}

	public NotClassesSystem selectNotClassesSys(int systemid) {
		NotClassesSystem notClassesSystem = notClassesDao
				.selectBySystemid(systemid);
		return notClassesSystem;
	}

	public OvertimeSystem selectOvertimeSys(int systemid) {
		OvertimeSystem overtimeSystem = overtimeDao.SelectBySystemid(systemid);
		return overtimeSystem;
	}

	public OtherStystem selectOtherStystemSys(int systemid) {
		OtherStystem otherStystem = otherStystemDao.SelectBySystemid(systemid);
		return otherStystem;
	}

	public GoOutSystem selectGoOutSys(int systemid) {
		GoOutSystem goOutSystem = goOutDao.selectBySystemid(systemid);
		return goOutSystem;
	}

}
