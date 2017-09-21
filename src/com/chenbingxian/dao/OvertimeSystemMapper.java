package com.chenbingxian.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenbingxian.po.LateAndLeaveEarlySystem;
import com.chenbingxian.po.OvertimeSystem;

public interface OvertimeSystemMapper {
    int deleteByPrimaryKey(Integer overtimesystemid);

    int insert(OvertimeSystem record);

    int insertSelective(OvertimeSystem record);

    OvertimeSystem selectByPrimaryKey(Integer overtimesystemid);

    int updateByPrimaryKeySelective(OvertimeSystem record);

    int updateByPrimaryKey(OvertimeSystem record);
    /**根据考勤制度id删除加班考勤制度**/
    int deleteBySystemid(@Param("systemid") int systemid);
    /**根据考勤制度id查询加班考勤制度**/
    OvertimeSystem SelectBySystemid(@Param("systemid") int systemid);
    /**判断数据是否有变动 **/
    List<OvertimeSystem>  PanDuanShuJuBianDong(OvertimeSystem t); 
    /**修改删除否状态**/
    int   updateDeleteType(@Param("overtimeSystemId") int overtimeSystemId);
    /**加班制度更改大于今天的分班记录的制度也要修改**/
    int updateRecordBySystemMxId(@Param("nowOvertimeSystemId")int nowOvertimeSystemId,@Param("beforeOvertimeSystemId")int beforeOvertimeSystemId);
}