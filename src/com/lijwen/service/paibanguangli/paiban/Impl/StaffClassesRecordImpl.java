package com.lijwen.service.paibanguangli.paiban.Impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.aspectj.weaver.ast.Var;

import com.lijwen.dao.StaffClassesRecordMapper;
import com.lijwen.po.StaffClassesRecord;
import com.lijwen.service.paibanguangli.paiban.IstaffClassesRecordSv;
import com.lijwen.vo.GengGaiPaiPanXinXi;
import com.lijwen.vo.YuanGongFenBanJiLu;
import com.lijwen.vo.paibanchaxunVo;
import com.sun.org.apache.regexp.internal.recompile;
@Transactional
@Service("istaffClassesRecord")
public class StaffClassesRecordImpl implements IstaffClassesRecordSv {
@Autowired
StaffClassesRecordMapper staffClassesRecordDao;
	@Override
	public StaffClassesRecord selectById(int id) {
		return null;
	}

	@Override
	public int insert(StaffClassesRecord t) {
	 
		return 0;
	}

	@Override
	public int update(StaffClassesRecord t) {
	 
		return 0;
	}

	@Override
	public int delete(int id) {
	
		return 0;
	}
      /**查询班组信息**/
	public List<paibanchaxunVo> selectClassGroup() {
	 List<paibanchaxunVo>banzuList= staffClassesRecordDao.selectClassGroup();
		return banzuList;
	}
	  /** 查询班组员工分班记录 **/
   public List<YuanGongFenBanJiLu> selectGroupRecord(int goupid,String bginDate, String endDate) {
	   List<YuanGongFenBanJiLu> list= staffClassesRecordDao.selectGroupRecord(goupid, bginDate, endDate);
	   return list;
		}

	public int updatePaiBanXinXi(List<GengGaiPaiPanXinXi> listInsert,int[] deleteIds,List<GengGaiPaiPanXinXi> listUpdate,int groupid) {
	int i=	staffClassesRecordDao.updatePaiBanXinXi(listInsert, deleteIds, listUpdate,groupid);
	return i;
	}

}
