package com.chenbingxian.vo;

public class DealwihthRetroative {
	/**上下班**/
	private int toAndFrom;
	/**申请签到时间**/
	private String SignInTime;
	/**签到表主键id**/
	private int staffClassesChildRecordId;
	/**补签表主键id**/
	private int staffRetroactiveId;
	/****/
	private int operationStaffId;
	/**申请人**/
	private String operationMan;
	/**审核人**/
	private String checkMan;
	/**上班时间**/
	private String goToWorkTime;
	/**下班时间**/
	private String timeFromWork;
	/**起始刷卡时间**/
	private String startChargeTime;
	/**终止刷卡时间**/
	private String endChargeTime;
	/**工作日期**/
	private String workDate;
	/**刷卡时间小于下班时间多少分钟算缺勤**/
	private int LeaveEarlyAbsenteeismTime;
	/**刷卡时间小于下班时间多少分钟算早退**/
	private int LeaveEarlyTime;
	/**刷卡时间大于上班时间多少分钟算缺勤**/
	private int lateAbsenteeismTime;
	/**大于多少分钟算迟到**/
	private int lateTime;
	/**申请原因**/
	private String applyForReason;
	/**批示**/
	private String remark;
	/**审核时间**/
	private String checkTime;
	/**申请时间**/
	private String operatingTime;
	/**处理状态id**/
	private int checkStateId;
	/**处理状态名称**/
	private String checkType;
	/**计迟到否**/
	private int calculateLeftEarlyNo;
	/**计算早退否**/
	private int calculateAbsenceNo;
	/**签到信息**/
	private String signIn;
	/**签退信息**/
	private String signBack;
	
	public String getSignIn() {
		return signIn;
	}
	public void setSignIn(String signIn) {
		this.signIn = signIn;
	}
	public String getSignBack() {
		return signBack;
	}
	public void setSignBack(String signBack) {
		this.signBack = signBack;
	}
	public int getCalculateLeftEarlyNo() {
		return calculateLeftEarlyNo;
	}
	public void setCalculateLeftEarlyNo(int calculateLeftEarlyNo) {
		this.calculateLeftEarlyNo = calculateLeftEarlyNo;
	}
	public int getCalculateAbsenceNo() {
		return calculateAbsenceNo;
	}
	public void setCalculateAbsenceNo(int calculateAbsenceNo) {
		this.calculateAbsenceNo = calculateAbsenceNo;
	}
	public int getToAndFrom() {
		return toAndFrom;
	}
	public void setToAndFrom(int toAndFrom) {
		this.toAndFrom = toAndFrom;
	}
	public String getSignInTime() {
		return SignInTime;
	}
	public void setSignInTime(String signInTime) {
		SignInTime = signInTime;
	}
	public int getStaffClassesChildRecordId() {
		return staffClassesChildRecordId;
	}
	public void setStaffClassesChildRecordId(int staffClassesChildRecordId) {
		this.staffClassesChildRecordId = staffClassesChildRecordId;
	}
	public int getStaffRetroactiveId() {
		return staffRetroactiveId;
	}
	public void setStaffRetroactiveId(int staffRetroactiveId) {
		this.staffRetroactiveId = staffRetroactiveId;
	}
	public int getOperationStaffId() {
		return operationStaffId;
	}
	public void setOperationStaffId(int operationStaffId) {
		this.operationStaffId = operationStaffId;
	}
	public String getOperationMan() {
		return operationMan;
	}
	public void setOperationMan(String operationMan) {
		this.operationMan = operationMan;
	}
	public String getCheckMan() {
		return checkMan;
	}
	public void setCheckMan(String checkMan) {
		this.checkMan = checkMan;
	}
	public String getGoToWorkTime() {
		return goToWorkTime;
	}
	public void setGoToWorkTime(String goToWorkTime) {
		this.goToWorkTime = goToWorkTime;
	}
	public String getTimeFromWork() {
		return timeFromWork;
	}
	public void setTimeFromWork(String timeFromWork) {
		this.timeFromWork = timeFromWork;
	}
	public String getStartChargeTime() {
		return startChargeTime;
	}
	public void setStartChargeTime(String startChargeTime) {
		this.startChargeTime = startChargeTime;
	}
	public String getEndChargeTime() {
		return endChargeTime;
	}
	public void setEndChargeTime(String endChargeTime) {
		this.endChargeTime = endChargeTime;
	}
	public String getWorkDate() {
		return workDate;
	}
	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}
	public int getLeaveEarlyAbsenteeismTime() {
		return LeaveEarlyAbsenteeismTime;
	}
	public void setLeaveEarlyAbsenteeismTime(int leaveEarlyAbsenteeismTime) {
		LeaveEarlyAbsenteeismTime = leaveEarlyAbsenteeismTime;
	}
	public int getLeaveEarlyTime() {
		return LeaveEarlyTime;
	}
	public void setLeaveEarlyTime(int leaveEarlyTime) {
		LeaveEarlyTime = leaveEarlyTime;
	}
	public int getLateAbsenteeismTime() {
		return lateAbsenteeismTime;
	}
	public void setLateAbsenteeismTime(int lateAbsenteeismTime) {
		this.lateAbsenteeismTime = lateAbsenteeismTime;
	}
	public int getLateTime() {
		return lateTime;
	}
	public void setLateTime(int lateTime) {
		this.lateTime = lateTime;
	}
	public String getApplyForReason() {
		return applyForReason;
	}
	public void setApplyForReason(String applyForReason) {
		this.applyForReason = applyForReason;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(String checkTime) {
		this.checkTime = checkTime;
	}
	public String getOperatingTime() {
		return operatingTime;
	}
	public void setOperatingTime(String operatingTime) {
		this.operatingTime = operatingTime;
	}
	public int getCheckStateId() {
		return checkStateId;
	}
	public void setCheckStateId(int checkStateId) {
		this.checkStateId = checkStateId;
	}
	public String getCheckType() {
		return checkType;
	}
	public void setCheckType(String checkType) {
		this.checkType = checkType;
	}
}
