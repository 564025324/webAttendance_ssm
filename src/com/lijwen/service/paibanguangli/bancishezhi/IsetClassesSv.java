package com.lijwen.service.paibanguangli.bancishezhi;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lijwen.core.base.BaseService;
import com.lijwen.po.Positionclasses;
import com.lijwen.po.StaffPosition;
import com.lijwen.vo.Number;

public interface IsetClassesSv extends BaseService<Positionclasses, String>{
	/**查询班次**/
	public List<Positionclasses> selectPositionclasses();
   /** 查询班次和班段信息**/
	public List<Positionclasses> selectClass();
	/**查询该班次是否正在使用中**/
    int selectClassUseNo(int positionClassesId);
    
}
