package com.lijwen.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lijwen.po.GoOutSystem;
import com.lijwen.po.OtherStystem;

public interface OtherStystemMapper {
    int deleteByPrimaryKey(Integer otherstystemid);

    int insert(OtherStystem record);

    int insertSelective(OtherStystem record);

    OtherStystem selectByPrimaryKey(Integer otherstystemid);

    int updateByPrimaryKeySelective(OtherStystem record);

    int updateByPrimaryKey(OtherStystem record);
    /**根据考勤制度id删除其他考勤制度**/
    int deleteBySystemid(@Param("systemid") int systemid);
    /**根据考勤制度id查询其他考勤制度**/
    OtherStystem SelectBySystemid(@Param("systemid") int systemid);
    /**判断数据是否有变动 **/
    List<OtherStystem>  PanDuanShuJuBianDong(OtherStystem t); 
    /**修改删除否状态**/
    int   updateDeleteType(@Param("otherstystemid") int otherstystemid);
    /**其他制度更改大于今天的分班记录的制度也要修改**/
	int updateRecordBySystemMxId(@Param("nowOtherStystemId")int nowOtherStystemId ,@Param("beforeOtherStystemId")int beforeOtherStystemId);

}