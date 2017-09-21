package com.chenbingxian.service.paibanguangli.paiban;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;

import com.chenbingxian.core.base.BaseService;
import com.chenbingxian.po.StaffClassesRecord;
import com.chenbingxian.vo.GengGaiPaiPanXinXi;
import com.chenbingxian.vo.YuanGongFenBanJiLu;
import com.chenbingxian.vo.paibanchaxunVo;

public interface IstaffClassesRecordSv extends BaseService<StaffClassesRecord, String>{
	 List<paibanchaxunVo> selectClassGroup();
	  /** 查询班组员工分班记录 **/
	  List<YuanGongFenBanJiLu>  selectGroupRecord(int goupid,String bginDate,String endDate);
	  /**更改班组排班信息**/
      public int updatePaiBanXinXi(List<GengGaiPaiPanXinXi>listInsert,int[] deleteIds,List<GengGaiPaiPanXinXi>listUpdate,int groupid);
		 
		
}
