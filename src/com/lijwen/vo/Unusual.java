package com.lijwen.vo;

public class Unusual {
 /**签到时间**/
 private String signInTime;
 /**签退时间**/
 private String signBackTime;
 /**班次**/
 private String classesName;
 /**员工姓名**/
 private String staffName;
 /**工作日期**/
 private String workDate;
 /**班段类别**/
 private String dealWithName;
 /**签到记录表主键id**/
 private int staffClassPeriodSignInRecordId;
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
public String getClassesName() {
	return classesName;
}
public void setClassesName(String classesName) {
	this.classesName = classesName;
}
public String getStaffName() {
	return staffName;
}
public void setStaffName(String staffName) {
	this.staffName = staffName;
}
public String getWorkDate() {
	return workDate;
}
public void setWorkDate(String workDate) {
	this.workDate = workDate;
}
public String getDealWithName() {
	return dealWithName;
}
public void setDealWithName(String dealWithName) {
	this.dealWithName = dealWithName;
}
public int getStaffClassPeriodSignInRecordId() {
	return staffClassPeriodSignInRecordId;
}
public void setStaffClassPeriodSignInRecordId(int staffClassPeriodSignInRecordId) {
	this.staffClassPeriodSignInRecordId = staffClassPeriodSignInRecordId;
}
}
