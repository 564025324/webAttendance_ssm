package com.lijwen.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lijwen.po.GoOutSystem;
import com.lijwen.po.NotClassesSystem;

public interface GoOutSystemMapper {
    int deleteByPrimaryKey(Integer gooutsystemid);

    int insert(GoOutSystem record);

    int insertSelective(GoOutSystem record);

    GoOutSystem selectByPrimaryKey(Integer gooutsystemid);

    int updateByPrimaryKeySelective(GoOutSystem record);

    int updateByPrimaryKey(GoOutSystem record);
    /**根据考勤制度id删除外出考勤制度**/
    int deleteBySystemid(@Param("systemid") int systemid);
    /**根据考勤制度id查询外出考勤制度**/
    GoOutSystem selectBySystemid(@Param("systemid") int systemid);
    /**判断数据是否有变动 **/
    List<GoOutSystem>  PanDuanShuJuBianDong(GoOutSystem t); 
    /**修改删除否状态**/
    int   updateDeleteType(@Param("gooutsystemid") int gooutsystemid);
    /**外出考勤制度更改大于今天的分班记录的制度也要修改**/
    int updateRecordBySystemMxId(@Param("nowGoOutSystemId")int nowGoOutSystemId,@Param("beforeGoOutSystemId")int beforeGoOutSystemId);

}