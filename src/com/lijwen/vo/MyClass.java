package com.lijwen.vo;

public class MyClass {
	private String workDate;
	private String groupName;
	private String classesName;
	private String classesNumber;
	private String goToWorkTime;
	private String timeFromWork;
	private String startChargeTime;
	private String endChargeTime;
	private String dealWithName;
	private int staffId;
	public int getStaffId() {
		return staffId;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	/**考勤班段信息(新增的)**/
	private String   signInformation;
	public String getSignInformation() {
		return signInformation;
	}
	public void setSignInformation(String signInformation) {
		this.signInformation = signInformation;
	}
	public String getDealWithName() {
		return dealWithName;
	}
	public void setDealWithName(String dealWithName) {
		this.dealWithName = dealWithName;
	}
	public String getWorkDate() {
		return workDate;
	}
	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getClassesName() {
		return classesName;
	}
	public void setClassesName(String classesName) {
		this.classesName = classesName;
	}
	public String getClassesNumber() {
		return classesNumber;
	}
	public void setClassesNumber(String classesNumber) {
		this.classesNumber = classesNumber;
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

}
