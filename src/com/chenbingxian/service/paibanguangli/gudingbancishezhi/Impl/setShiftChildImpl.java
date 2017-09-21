package com.chenbingxian.service.paibanguangli.gudingbancishezhi.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chenbingxian.dao.ShiftChildMapper;
import com.chenbingxian.po.ShiftChild;
import com.chenbingxian.service.paibanguangli.gudingbancishezhi.IsetShiftChildSv;
@Service("isetShiftChildSv")
public class setShiftChildImpl implements IsetShiftChildSv{
@Autowired
ShiftChildMapper shiftChildDao;
	@Override
	public ShiftChild selectById(int id) {
		ShiftChild shiftChild=	shiftChildDao.selectByPrimaryKey(id);
		return shiftChild;
	}

	@Override
	public int insert(ShiftChild t) {
		int i= shiftChildDao.insertSelective(t);
		return i;
	}

	@Override
	public int update(ShiftChild t) {
	 int i= shiftChildDao.updateByPrimaryKeySelective(t);
		return i;
	}

	@Override
	public int delete(int id) {
		int i= shiftChildDao.deleteByPrimaryKey(id);
		return i;
	}

	@Override
	public List<ShiftChild> selectbyShiftId(int id) {
		List<ShiftChild>  shiftChilds= shiftChildDao.selectbyShiftId(id);
		return shiftChilds;
	}

	@Override
	public int deleteByShiftId(int shiftid) {
		int i= shiftChildDao.deleteByShiftId(shiftid);
		return i;
	}

}
