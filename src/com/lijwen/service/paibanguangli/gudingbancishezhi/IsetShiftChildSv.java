package com.lijwen.service.paibanguangli.gudingbancishezhi;

import java.util.List;

import com.lijwen.core.base.BaseService;
import com.lijwen.po.ShiftChild;

public interface IsetShiftChildSv extends BaseService<ShiftChild, String> {
	 List<ShiftChild> selectbyShiftId(int id);
	int deleteByShiftId(int shiftid);
}
