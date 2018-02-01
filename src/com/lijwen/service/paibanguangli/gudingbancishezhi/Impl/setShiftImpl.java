package com.lijwen.service.paibanguangli.gudingbancishezhi.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lijwen.dao.ShiftChildMapper;
import com.lijwen.dao.ShiftMapper;
import com.lijwen.po.Shift;
import com.lijwen.po.ShiftChild;
import com.lijwen.service.paibanguangli.gudingbancishezhi.IsetShiftSv;
@Service("isetShiftSv")
public class setShiftImpl  implements IsetShiftSv {
   @Autowired
   ShiftMapper shiftDao;
   @Autowired
   ShiftChildMapper ShiftChildDao;
	@Override
	public List<Shift> selectShiftByPositionid(int id) {
	 List<Shift>shifts=shiftDao.selectShiftByPositionid(id);
		return shifts;
	}
	@Override
	public Shift selectById(int id) {
		Shift shift=shiftDao.selectByPrimaryKey(id);
		return shift;
	}

	@Override
	public int insert(Shift t) {
		shiftDao.insertSelective(t);
		int i=t.getShiftid();//获取新增的id
		return i;
	}
	//新增固定轮班名称再增加明细
    public int insertAll(Shift t,List<ShiftChild> listChild){
    	int j=-1;
    	int shiftid=insert(t);
    	for(ShiftChild itemChild:listChild){
    		itemChild.setShiftid(shiftid);
    	    j=ShiftChildDao.insertSelective(itemChild);
    	}
    	return j;
    }
    
	@Override
	public int update(Shift t) {
	    int i=shiftDao.updateByPrimaryKeySelective(t);
		return i;
	}
   /* 删除固定轮班和明细*/
	@Override
	public int delete(int shiftid) {
	   int i=shiftDao.deleteByPrimaryKey(shiftid);
	    ShiftChildDao.deleteByShiftId(shiftid);
		return i;
	}



}
