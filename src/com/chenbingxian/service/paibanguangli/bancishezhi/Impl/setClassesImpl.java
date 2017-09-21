package com.chenbingxian.service.paibanguangli.bancishezhi.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chenbingxian.dao.PositionclassesMapper;
import com.chenbingxian.dao.StaffPositionMapper;
import com.chenbingxian.po.Positionclasses;
import com.chenbingxian.po.StaffPosition;
import com.chenbingxian.service.paibanguangli.bancishezhi.IsetClassesSv;
import com.chenbingxian.vo.Number;
@Transactional
@Service("isetClassesSv")
public class setClassesImpl implements IsetClassesSv{
    @Autowired
    PositionclassesMapper positionclassesDao;
    @Autowired
    StaffPositionMapper staffPositionDao;
	@Override
	public Positionclasses selectById(int id) {
		 Positionclasses positionclasses= positionclassesDao.selectByPrimaryKey(id);
		return positionclasses;
	}

	@Override
	public int insert(Positionclasses t) {
	 int i=	positionclassesDao.insertSelective(t);
		return i;
	}

	@Override
	public int update(Positionclasses t) {
		int i= positionclassesDao.updateByPrimaryKeySelective(t);
		return i;
	}

	@Override
	public int delete(int id) {
		int i=positionclassesDao.deleteByPrimaryKey(id);
		return i;
	}
	@Override
	public List<Positionclasses> selectPositionclasses() {
		List<Positionclasses>  positionclasses=  positionclassesDao.selectAllClasses();
		return positionclasses;
	}
    /**查询班次和班段信息*/
	@Override
	public List<Positionclasses> selectClass() {
		List<Positionclasses> list= positionclassesDao.selectClass();
		return list;
	}

	 /**查询班次使用数**/
	public int selectClassUseNo(int positionClassesId) {
		Number number= positionclassesDao.selectClassUseNo(positionClassesId);
		return number.getNumber();
	}

	 
 
}
