package com.chenbingxian.vo;

public class MyAskForLeave {
	/**申请人**/
    private String proposerName;
    /**登记类型**/
    private String  registrationtypeName;
    /**起始时间**/
    private String startdate;
    /**终止时间**/
    private String enddate;
    /**申请人**/
    private String  operationstaffName;
    /**申请时间**/
    private String operatingtime;
    /**审核时间**/
    private String checktime;
    /**审核人**/
    private String  checkmanName;
    /**申请原因**/
    private String remark;
    /**处理状态**/
    private String  checkTypeName;
    
    private String className;
    private int checkTypeId;
    /**班次id**/
    private int positionClassesId;
    /**请加班班次表主键id **/
    private int askForLeaveMxId;
    /**请假公休加班表主键ID **/
    private int  askForLeaveId;
    /**登记类型ID(attendanceClassChildId)**/
    private int registrationTypeId;
    /**考勤类别id **/
    private int  attendanceCTypeId;
    /**批示**/
    private String writeBack;
    /**班组id**/
    private int groupid;
    /**申请人ID**/
    private int operationStaffId;
    
	public int getOperationStaffId() {
		return operationStaffId;
	}
	public void setOperationStaffId(int operationStaffId) {
		this.operationStaffId = operationStaffId;
	}
	public int getGroupid() {
		return groupid;
	}
	public void setGroupid(int groupid) {
		this.groupid = groupid;
	}
	public String getWriteBack() {
		return writeBack;
	}
	public void setWriteBack(String writeBack) {
		this.writeBack = writeBack;
	}
	public int getAttendanceCTypeId() {
		return attendanceCTypeId;
	}
	public void setAttendanceCTypeId(int attendanceCTypeId) {
		this.attendanceCTypeId = attendanceCTypeId;
	}
	public int getPositionClassesId() {
		return positionClassesId;
	}
	public void setPositionClassesId(int positionClassesId) {
		this.positionClassesId = positionClassesId;
	}
	public int getAskForLeaveMxId() {
		return askForLeaveMxId;
	}
	public void setAskForLeaveMxId(int askForLeaveMxId) {
		this.askForLeaveMxId = askForLeaveMxId;
	}
	public int getAskForLeaveId() {
		return askForLeaveId;
	}
	public void setAskForLeaveId(int askForLeaveId) {
		this.askForLeaveId = askForLeaveId;
	}
	public int getRegistrationTypeId() {
		return registrationTypeId;
	}
	public void setRegistrationTypeId(int registrationTypeId) {
		this.registrationTypeId = registrationTypeId;
	}
	public int getCheckTypeId() {
		return checkTypeId;
	}
	public void setCheckTypeId(int checkTypeId) {
		this.checkTypeId = checkTypeId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getProposerName() {
		return proposerName;
	}
	public void setProposerName(String proposerName) {
		this.proposerName = proposerName;
	}
	public String getRegistrationtypeName() {
		return registrationtypeName;
	}
	public void setRegistrationtypeName(String registrationtypeName) {
		this.registrationtypeName = registrationtypeName;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getOperationstaffName() {
		return operationstaffName;
	}
	public void setOperationstaffName(String operationstaffName) {
		this.operationstaffName = operationstaffName;
	}
	public String getOperatingtime() {
		return operatingtime;
	}
	public void setOperatingtime(String operatingtime) {
		this.operatingtime = operatingtime;
	}
	public String getChecktime() {
		return checktime;
	}
	public void setChecktime(String checktime) {
		this.checktime = checktime;
	}
	public String getCheckmanName() {
		return checkmanName;
	}
	public void setCheckmanName(String checkmanName) {
		this.checkmanName = checkmanName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCheckTypeName() {
		return checkTypeName;
	}
	public void setCheckTypeName(String checkTypeName) {
		this.checkTypeName = checkTypeName;
	}
	
	
}
