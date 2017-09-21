package com.chenbingxian.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenbingxian.po.Classesgroup;

public interface ClassesgroupMapper {
    int deleteByPrimaryKey(Integer classesgroupid);

    int insert(Classesgroup record);

    int insertSelective(Classesgroup record);

    Classesgroup selectByPrimaryKey(Integer classesgroupid);

    int updateByPrimaryKeySelective(Classesgroup record);

    int updateByPrimaryKey(Classesgroup record);
    /*新增班组班次*/
    int insertClassGroup(@Param("classIds")int[] classIds,@Param("groupId")int groupId);
    /*查询班组班次信息*/
     List<Classesgroup> selectClassesByGroupID(@Param("groupid") int groupid); 
         /*   编辑班组时修改班组班次信息*/
     int editClassesgroup(@Param("ClassIds")int[] ClassIds,@Param("groupid")int groupid);
    /* 删除班组和附带信息*/
     int deleteGroupClass(@Param("groupid")int groupid);
}