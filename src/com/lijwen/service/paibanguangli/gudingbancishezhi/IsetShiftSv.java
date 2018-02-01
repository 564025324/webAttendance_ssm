package com.lijwen.service.paibanguangli.gudingbancishezhi;

import java.util.List;

import com.lijwen.core.base.BaseService;
import com.lijwen.po.Shift;
import com.lijwen.po.ShiftChild;

public interface IsetShiftSv extends BaseService<Shift, String>{
	 List<Shift>selectShiftByPositionid(int id);
	 int insertAll(Shift t,List<ShiftChild> listChild);
}
