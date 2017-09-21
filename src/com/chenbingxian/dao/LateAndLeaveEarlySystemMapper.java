package com.chenbingxian.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenbingxian.po.LateAndLeaveEarlySystem;

public interface LateAndLeaveEarlySystemMapper {
    int deleteByPrimaryKey(Integer lateandleaveearlysystemid);

    int insert(LateAndLeaveEarlySystem record);

    int insertSelective(LateAndLeaveEarlySystem record);

    LateAndLeaveEarlySystem selectByPrimaryKey(Integer lateandleaveearlysystemid);

    int updateByPrimaryKeySelective(LateAndLeaveEarlySystem record);
    int updateByPrimaryKey(LateAndLeaveEarlySystem record);
   /**根据考勤制度id删除迟到早退制度**/
    int deleteBySystemid(@Param("systemid") int systemid);
    /**根据考勤制度id查询迟到早退制度**/
    LateAndLeaveEarlySystem selectBySystemid(@Param("systemid") int systemid);
    /**判断数据是否有变动 **/
    List<LateAndLeaveEarlySystem>  PanDuanShuJuBianDong(LateAndLeaveEarlySystem t); 
    /**修改删除否状态**/
    int   updateDeleteType(@Param("lateAndLeaveEarlySystemId") int lateAndLeaveEarlySystemId);
	/**迟到早退制度更改大于今天的分班记录的制度也要修改**/
	int updateRecordBySystemMxId(@Param("nowLateAndLeaveEarlySystemId")int nowLateAndLeaveEarlySystemId,@Param("beforeLateAndLeaveEarlySystemId")int beforeLateAndLeaveEarlySystemId);

}