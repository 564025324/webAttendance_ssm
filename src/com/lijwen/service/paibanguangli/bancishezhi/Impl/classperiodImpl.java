package com.lijwen.service.paibanguangli.bancishezhi.Impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lijwen.dao.AttendanceclasschildMapper;
import com.lijwen.dao.ClassperiodMapper;
import com.lijwen.po.Attendanceclasschild;
import com.lijwen.po.Classperiod;
import com.lijwen.service.paibanguangli.bancishezhi.IclassperiodSv;
 @Transactional
@Service("iclassperiodSv")
public class classperiodImpl  implements IclassperiodSv{
    @Autowired
    ClassperiodMapper classperiodDao;
    @Autowired
    AttendanceclasschildMapper attendanceclasschildDao;
	@Override
	public Classperiod selectById(int id) {
		Classperiod	classperiod=classperiodDao.selectByPrimaryKey(id);
		return classperiod;
	}

	@Override
	public int insert(Classperiod t) {
		 int i=classperiodDao.insertSelective(t);
		 classperiodDao.insertByClassPeriodId( t.getPositionclassesid(), t.getAttendanceclasschildid(), t.getClassperiodid());
		return i;
	}
	
	@Override
	public int update(Classperiod t) {
		int i= classperiodDao.deleteByPrimaryKey(t.getClassperiodid());
		int one=t.getClassperiodid();
		classperiodDao.insertSelective(t);
		int tow=t.getClassperiodid();
		classperiodDao.updateSignrecordClassPeriodId(one,tow );
		return i;
	}

	@Override
	public int delete(int id) {
	   int i=classperiodDao.deleteByPrimaryKey(id);
	   classperiodDao.deleteByClassPeriodId(id);
		return i;
	}
	@Override
	public List<Classperiod> selectClassperiod(int Classid) {
	 List<Classperiod> classperiods=classperiodDao.selectClassperiod(Classid);
	 return classperiods;
	}

	@Override
	public List<Attendanceclasschild> selectAttendanceByIds(int[] ids) {
		List<Attendanceclasschild> list= attendanceclasschildDao.selectAttendanceByIds(ids);
		return list;
	}

}
