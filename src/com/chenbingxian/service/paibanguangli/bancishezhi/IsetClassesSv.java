package com.chenbingxian.service.paibanguangli.bancishezhi;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenbingxian.core.base.BaseService;
import com.chenbingxian.po.Positionclasses;
import com.chenbingxian.po.StaffPosition;
import com.chenbingxian.vo.Number;

public interface IsetClassesSv extends BaseService<Positionclasses, String>{
	/**查询班次**/
	public List<Positionclasses> selectPositionclasses();
   /** 查询班次和班段信息**/
	public List<Positionclasses> selectClass();
	/**查询该班次是否正在使用中**/
    int selectClassUseNo(int positionClassesId);
    
}
