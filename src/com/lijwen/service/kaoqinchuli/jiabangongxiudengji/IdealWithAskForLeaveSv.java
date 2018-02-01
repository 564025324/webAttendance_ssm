package com.lijwen.service.kaoqinchuli.jiabangongxiudengji;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lijwen.po.AskForLeave;
import com.lijwen.vo.GengGaiPaiPanXinXi;
import com.lijwen.vo.MyAskForLeave;

public interface IdealWithAskForLeaveSv {
	/**查询所有员工请假、加班、出差的申请 **/
	List<MyAskForLeave> selectAllAskForLeave(int checkTypeId);
   /**修改请假、出差申请信息和修改签到记录表的考勤状态**/ 
   int updateAskForLeavAandRecord(AskForLeave askForLeave);
   /**修改加班申请信息和删除签到记录新增签到记录**/ 
   int updateAskAndDeleteInsertRecord(AskForLeave askForLeave,
			List<GengGaiPaiPanXinXi> listInsert);
   }
