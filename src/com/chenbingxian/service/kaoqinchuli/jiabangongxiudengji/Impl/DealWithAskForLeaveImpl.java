package com.chenbingxian.service.kaoqinchuli.jiabangongxiudengji.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chenbingxian.dao.AskForLeaveMapper;
import com.chenbingxian.po.AskForLeave;
import com.chenbingxian.service.kaoqinchuli.jiabangongxiudengji.IdealWithAskForLeaveSv;
import com.chenbingxian.vo.GengGaiPaiPanXinXi;
import com.chenbingxian.vo.MyAskForLeave;
@Transactional
@Service("idealWithAskForLeaveSv")
public class DealWithAskForLeaveImpl implements IdealWithAskForLeaveSv{
@Autowired
AskForLeaveMapper  AskForLeaveDao;
	/**查询所有员工请假、加班、出差的申请 **/
	public List<MyAskForLeave> selectAllAskForLeave(int checkTypeId) {
	return AskForLeaveDao.selectAllAskForLeave(checkTypeId);
	}
	/**修改请假、出差申请信息和修改签到记录表的考勤状态**/
	public int updateAskForLeavAandRecord(AskForLeave askForLeave) {
	 int i=	AskForLeaveDao.updateByPrimaryKeySelective(askForLeave);
	 AskForLeaveDao.updateRecord(askForLeave.getStartdate(),
			 askForLeave.getEnddate(), askForLeave.getOperationstaffid(),
			 askForLeave.getRegistrationtypeid());
		return i;
	}
	/**修改加班申请信息和删除签到记录新增签到记录**/ 
	public int updateAskAndDeleteInsertRecord(AskForLeave askForLeave,
			List<GengGaiPaiPanXinXi> listInsert) {
		int i=	AskForLeaveDao.updateByPrimaryKeySelective(askForLeave);
		/**删除申请加班时段的签到表的信息和工作日表的信息**/
		AskForLeaveDao.deleteRecord(askForLeave.getStartdate(),
				 askForLeave.getEnddate(), askForLeave.getOperationstaffid());
		/**新增申请加班的信息到工作日记录表和签到记录表**/
		AskForLeaveDao.insertRecordAndSigninRecord(listInsert, askForLeave.getOperationstaffid());
		return i;
	}
    
}
