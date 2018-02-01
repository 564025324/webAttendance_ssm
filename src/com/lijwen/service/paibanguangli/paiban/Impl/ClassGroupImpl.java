package com.lijwen.service.paibanguangli.paiban.Impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lijwen.dao.AttributeGatherChildMapper;
import com.lijwen.dao.ClassesgroupMapper;
import com.lijwen.po.AttributeGatherChild;
import com.lijwen.po.Classesgroup;
import com.lijwen.service.paibanguangli.paiban.IclassGroupSv;
import com.lijwen.vo.YuanGongFenBanJiLu;
@Transactional
@Service("iclassGroup")
public class ClassGroupImpl implements IclassGroupSv{
	@Autowired
	ClassesgroupMapper classesgroupDao;
	@Autowired
	AttributeGatherChildMapper attributeGatherChildDao;
	public Classesgroup selectById(int id) {
		Classesgroup classesgroup=classesgroupDao.selectByPrimaryKey(id);
		return classesgroup;
	}
	public int insert(Classesgroup t) {
	int i=	classesgroupDao.insertSelective(t);
		return i;
	}

	public int update(Classesgroup t) {
		int i=	classesgroupDao.updateByPrimaryKeySelective(t);
		return i;
	}

	public int delete(int id) {
		int i=	classesgroupDao.deleteByPrimaryKey(id); 
		return i;
	}
	/*新增班组*/
	public int insertClassGroup(AttributeGatherChild t) {
		 attributeGatherChildDao.insert(t);
		int i= t.getAttributegatherchildid();
		return i;
	}
	/*新增班组班次*/
	public int insertClassGroup(int[] classIds,int groupId){
	 int i=	classesgroupDao.insertClassGroup(classIds, groupId);
		return  i;
	 }
	
	/*查询班组班次信息*/
	public List<Classesgroup> selectClassesByGroupID(int groupid) {
	 List<Classesgroup> classes=classesgroupDao.selectClassesByGroupID(groupid);
		return classes;
	}
	 /*   编辑班组时修改班组班次信息*/
	public int editClassesgroup(int[] ClassIds, int groupid) {
	   int i=classesgroupDao.editClassesgroup(ClassIds, groupid);
		return i;
	}
	    /*修改班组名称*/
	    public int editClassGroupName(AttributeGatherChild t){
		 int i=attributeGatherChildDao.updateByPrimaryKeySelective(t);
		 return i;
	}
		/*删除班组和附带信息*/
		public int deleteGroupClass(int groupid) {
		 int i=	classesgroupDao.deleteGroupClass(groupid);
			return i;
		}
	

}
