package com.chenbingxian.service.paibanguangli.gudingbancishezhi;

import java.util.List;

import com.chenbingxian.core.base.BaseService;
import com.chenbingxian.po.ShiftChild;

public interface IsetShiftChildSv extends BaseService<ShiftChild, String> {
	 List<ShiftChild> selectbyShiftId(int id);
	int deleteByShiftId(int shiftid);
}
