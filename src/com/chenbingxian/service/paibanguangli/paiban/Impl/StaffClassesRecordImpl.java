package com.chenbingxian.service.paibanguangli.paiban.Impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.aspectj.weaver.ast.Var;
import com.chenbingxian.dao.StaffClassesRecordMapper;
import com.chenbingxian.po.StaffClassesRecord;
import com.chenbingxian.service.paibanguangli.paiban.IstaffClassesRecordSv;
import com.chenbingxian.vo.GengGaiPaiPanXinXi;
import com.chenbingxian.vo.YuanGongFenBanJiLu;
import com.chenbingxian.vo.paibanchaxunVo;
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
