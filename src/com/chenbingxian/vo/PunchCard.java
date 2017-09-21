package com.chenbingxian.vo;

public class PunchCard {
	/**班次类型id**/
	private int classTypeId;
	/**签到记录表主键id**/
	private int staffClassPeriodSignInRecordId;
	/**班次**/
	private String className;
	/**班组名称**/
	private String groupName;
	/**上班时间**/
	private String goToWorkTime;
	/**下班时间**/
	private String timeFromWork;
	/**起始刷卡时间**/
	private String startChargeTime;
	/**终止刷卡时间**/
	private String endChargeTime;
	/**签到时间**/
	private String signInTime;
	/**签退时间**/
	private String signBackTime;
	/**迟到否**/
	private boolean lateNo;
	/**早退否**/
	private boolean leaveEarlyNo;
	/**上班需刷卡否**/
	private boolean goToWorkChargeNo;
	/**下班需刷卡否**/
	private boolean timeFromWorkChargeNo;
	/**计迟到否**/
	private boolean	calculateLeftEarlyNo;
	/**计早退否**/
	private boolean	calculateAbsenceNo;
	/**刷卡时间大于上班时间多少分钟算迟到**/
	private int lateTime;
	/**刷卡时间大于上班时间多少分钟算缺勤	**/
	private int lateAbsenteeismTime;
	/**刷卡时间小于下班时间多少分钟算早退**/
	private int LeaveEarlyTime;
	/**刷卡时间小于下班时间多少分钟算缺勤**/
	private int LeaveEarlyAbsenteeismTime;
	/**单次上下班最长工作时间（分钟）**/
	private int longWorkTime;
	/**跨零点出勤时零点后的最长工作时间（分钟）**/
	private int longWorkTimeToZero;
	/**多次刷卡在小于多少分钟只算第一次**/
	private int timeToOne;
	/**工作日期**/
	private String workDate;
	/**缺勤类别名称**/
	private String dealWithName;
	/**缺勤类别id**/
	private int attendanceCTypeId;
	/**考勤类别id**/
	private int attendanceClassChildId;
	/**班段id**/
	private int classPeriodId;
	/**员工班次记录表主键ID**/
	private int   staffClassesRecordId; 
	
	public int getAttendanceClassChildId() {
		return attendanceClassChildId;
	}
	public void setAttendanceClassChildId(int attendanceClassChildId) {
		this.attendanceClassChildId = attendanceClassChildId;
	}
	public int getClassPeriodId() {
		return classPeriodId;
	}
	public void setClassPeriodId(int classPeriodId) {
		this.classPeriodId = classPeriodId;
	}
	public int getStaffClassesRecordId() {
		return staffClassesRecordId;
	}
	public void setStaffClassesRecordId(int staffClassesRecordId) {
		this.staffClassesRecordId = staffClassesRecordId;
	}
	public String getDealWithName() {
		return dealWithName;
	}
	public void setDealWithName(String dealWithName) {
		this.dealWithName = dealWithName;
	}
	public int getAttendanceCTypeId() {
		return attendanceCTypeId;
	}
	public void setAttendanceCTypeId(int attendanceCTypeId) {
		this.attendanceCTypeId = attendanceCTypeId;
	}
	public boolean isGoToWorkChargeNo() {
		return goToWorkChargeNo;
	}
	public void setGoToWorkChargeNo(boolean goToWorkChargeNo) {
		this.goToWorkChargeNo = goToWorkChargeNo;
	}
	public boolean isTimeFromWorkChargeNo() {
		return timeFromWorkChargeNo;
	}
	public void setTimeFromWorkChargeNo(boolean timeFromWorkChargeNo) {
		this.timeFromWorkChargeNo = timeFromWorkChargeNo;
	}
	public int getStaffClassPeriodSignInRecordId() {
		return staffClassPeriodSignInRecordId;
	}
	public void setStaffClassPeriodSignInRecordId(int staffClassPeriodSignInRecordId) {
		this.staffClassPeriodSignInRecordId = staffClassPeriodSignInRecordId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
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
	public String getSignInTime() {
		return signInTime;
	}
	public void setSignInTime(String signInTime) {
		this.signInTime = signInTime;
	}
	public String getSignBackTime() {
		return signBackTime;
	}
	public void setSignBackTime(String signBackTime) {
		this.signBackTime = signBackTime;
	}
	public boolean isLateNo() {
		return lateNo;
	}
	public void setLateNo(boolean lateNo) {
		this.lateNo = lateNo;
	}
	public boolean isLeaveEarlyNo() {
		return leaveEarlyNo;
	}
	public void setLeaveEarlyNo(boolean leaveEarlyNo) {
		this.leaveEarlyNo = leaveEarlyNo;
	}
	public int getClassTypeId() {
		return classTypeId;
	}
	public void setClassTypeId(int classTypeId) {
		this.classTypeId = classTypeId;
	}
	public boolean isCalculateLeftEarlyNo() {
		return calculateLeftEarlyNo;
	}
	public void setCalculateLeftEarlyNo(boolean calculateLeftEarlyNo) {
		this.calculateLeftEarlyNo = calculateLeftEarlyNo;
	}
	public boolean isCalculateAbsenceNo() {
		return calculateAbsenceNo;
	}
	public void setCalculateAbsenceNo(boolean calculateAbsenceNo) {
		this.calculateAbsenceNo = calculateAbsenceNo;
	}
	public int getLateTime() {
		return lateTime;
	}
	public void setLateTime(int lateTime) {
		this.lateTime = lateTime;
	}
	public int getLateAbsenteeismTime() {
		return lateAbsenteeismTime;
	}
	public void setLateAbsenteeismTime(int lateAbsenteeismTime) {
		this.lateAbsenteeismTime = lateAbsenteeismTime;
	}
	public int getLeaveEarlyTime() {
		return LeaveEarlyTime;
	}
	public void setLeaveEarlyTime(int leaveEarlyTime) {
		LeaveEarlyTime = leaveEarlyTime;
	}
	public int getLeaveEarlyAbsenteeismTime() {
		return LeaveEarlyAbsenteeismTime;
	}
	public void setLeaveEarlyAbsenteeismTime(int leaveEarlyAbsenteeismTime) {
		LeaveEarlyAbsenteeismTime = leaveEarlyAbsenteeismTime;
	}
	public int getLongWorkTime() {
		return longWorkTime;
	}
	public void setLongWorkTime(int longWorkTime) {
		this.longWorkTime = longWorkTime;
	}
	public int getLongWorkTimeToZero() {
		return longWorkTimeToZero;
	}
	public void setLongWorkTimeToZero(int longWorkTimeToZero) {
		this.longWorkTimeToZero = longWorkTimeToZero;
	}
	public int getTimeToOne() {
		return timeToOne;
	}
	public void setTimeToOne(int timeToOne) {
		this.timeToOne = timeToOne;
	}
	public String getWorkDate() {
		return workDate;
	}
	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}
	
}
