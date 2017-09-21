package com.chenbingxian.vo;

public class ChuChaQingJiaTongJi {
	/**员工id**/
   private int staffID;
   /**考勤类别明细id**/
   private int attendanceClassChildId;
   /**出差时间计出勤否**/
   private boolean chuchajisuanfou;
   /**考勤时长**/
   private String shichang;
   /**出差计出勤时间**/
   private String chuchajichuqinshijian;
   
public int getStaffID() {
	return staffID;
}
public void setStaffID(int staffID) {
	this.staffID = staffID;
}
public int getAttendanceClassChildId() {
	return attendanceClassChildId;
}
public void setAttendanceClassChildId(int attendanceClassChildId) {
	this.attendanceClassChildId = attendanceClassChildId;
}
public boolean isChuchajisuanfou() {
	return chuchajisuanfou;
}
public void setChuchajisuanfou(boolean chuchajisuanfou) {
	this.chuchajisuanfou = chuchajisuanfou;
}
public String getShichang() {
	return shichang;
}
public void setShichang(String shichang) {
	this.shichang = shichang;
}
public String getChuchajichuqinshijian() {
	return chuchajichuqinshijian;
}
public void setChuchajichuqinshijian(String chuchajichuqinshijian) {
	this.chuchajichuqinshijian = chuchajichuqinshijian;
}
}
