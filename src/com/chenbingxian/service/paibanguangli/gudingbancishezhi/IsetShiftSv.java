package com.chenbingxian.service.paibanguangli.gudingbancishezhi;

import java.util.List;

import com.chenbingxian.core.base.BaseService;
import com.chenbingxian.po.Shift;
import com.chenbingxian.po.ShiftChild;

public interface IsetShiftSv extends BaseService<Shift, String>{
	 List<Shift>selectShiftByPositionid(int id);
	 int insertAll(Shift t,List<ShiftChild> listChild);
}
