package com.chenbingxian.service.paibanguangli.paiban;

import java.util.List;
import com.chenbingxian.core.base.BaseService;
import com.chenbingxian.po.AttributeGatherChild;
import com.chenbingxian.po.Classesgroup;
public interface IclassGroupSv extends BaseService<Classesgroup, String>{
         /** 新增班组名称**/
	int  insertClassGroup(AttributeGatherChild t);
	/**修改班组名称**/
	 int editClassGroupName(AttributeGatherChild t);
	/**新增班组班次**/
	 int insertClassGroup(int[] classIds,int groupId);
	 /**查询班组班次信息**/
	 List<Classesgroup> selectClassesByGroupID(int groupid); 
	 /**   编辑班组时修改班组班次信息**/
	 int editClassesgroup(int[] ClassIds,int groupid);
	 /** 删除班组和附带信息**/
	 int deleteGroupClass(int groupid);
	
}
