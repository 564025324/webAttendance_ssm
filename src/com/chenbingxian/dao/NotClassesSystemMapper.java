package com.chenbingxian.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenbingxian.po.NotClassesSystem;
import com.chenbingxian.po.OvertimeSystem;

public interface NotClassesSystemMapper {
    int deleteByPrimaryKey(Integer notclassessystemid);

    int insert(NotClassesSystem record);

    int insertSelective(NotClassesSystem record);

    NotClassesSystem selectByPrimaryKey(Integer notclassessystemid);

    int updateByPrimaryKeySelective(NotClassesSystem record);

    int updateByPrimaryKey(NotClassesSystem record);
    /**根据考勤制度id删除无班次考勤制度**/
    int deleteBySystemid(@Param("systemid") int systemid);
    /**根据考勤制度id查询无班次考勤制度**/
    NotClassesSystem selectBySystemid(@Param("systemid") int systemid);
    /**判断数据是否有变动 **/
    List<NotClassesSystem>  PanDuanShuJuBianDong(NotClassesSystem t); 
    /**修改删除否状态**/
    int   updateDeleteType(@Param("notclassessystemid") int notclassessystemid);
  	/**无班次考勤制度更改大于今天的分班记录的制度也要修改**/
    int updateRecordBySystemMxId(@Param("nowNotClassesSystemId")int nowNotClassesSystemId,@Param("beforeNotClassesSystemId")int beforeNotClassesSystemId);

}