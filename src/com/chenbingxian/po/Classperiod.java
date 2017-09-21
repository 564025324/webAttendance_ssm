package com.chenbingxian.po;


public class Classperiod {
	private Integer classperiodid;

	private String gotoworktime;

	private String timefromwork;

	private String startchargetime;

	private String endchargetime;

	private Boolean gotoworkchargeno;

	private Boolean timefromworkchargeno;

	private Boolean calculateleftearlyno;

	private Boolean calculateabsenceno;

	private Integer positionclassesid;

	private Integer attendanceclasschildid;
	// 新增的
	private Attendanceclasschild timeType;
	/**工作分钟数**/
    private int workTime;
	public int getWorkTime() {
		return workTime;
	}

	public void setWorkTime(int workTime) {
		this.workTime = workTime;
	}

	public Classperiod(Integer classperiodid, String gotoworktime,
			String timefromwork, String startchargetime, String endchargetime,
			Boolean gotoworkchargeno, Boolean timefromworkchargeno,
			Boolean calculateleftearlyno, Boolean calculateabsenceno,
			Integer positionclassesid, Integer attendanceclasschildid) {
		this.classperiodid = classperiodid;
		this.gotoworktime = gotoworktime;
		this.timefromwork = timefromwork;
		this.startchargetime = startchargetime;
		this.endchargetime = endchargetime;
		this.gotoworkchargeno = gotoworkchargeno;
		this.timefromworkchargeno = timefromworkchargeno;
		this.calculateleftearlyno = calculateleftearlyno;
		this.calculateabsenceno = calculateabsenceno;
		this.positionclassesid = positionclassesid;
		this.attendanceclasschildid = attendanceclasschildid;
	}

	public Classperiod() {
		super();
	}

	public Integer getClassperiodid() {
		return classperiodid;
	}

	public void setClassperiodid(Integer classperiodid) {
		this.classperiodid = classperiodid;
	}

	public String getGotoworktime() {
		return gotoworktime;
	}

	public void setGotoworktime(String gotoworktime) {
		this.gotoworktime = gotoworktime;
	}

	public String getTimefromwork() {
		return timefromwork;
	}

	public void setTimefromwork(String timefromwork) {
		this.timefromwork = timefromwork;
	}

	public String getStartchargetime() {
		return startchargetime;
	}

	public void setStartchargetime(String startchargetime) {
		this.startchargetime = startchargetime;
	}

	public String getEndchargetime() {
		return endchargetime;
	}

	public void setEndchargetime(String endchargetime) {
		this.endchargetime = endchargetime;
	}

	public Boolean getGotoworkchargeno() {
		return gotoworkchargeno;
	}

	public void setGotoworkchargeno(Boolean gotoworkchargeno) {
		this.gotoworkchargeno = gotoworkchargeno;
	}

	public Boolean getTimefromworkchargeno() {
		return timefromworkchargeno;
	}

	public void setTimefromworkchargeno(Boolean timefromworkchargeno) {
		this.timefromworkchargeno = timefromworkchargeno;
	}

	public Boolean getCalculateleftearlyno() {
		return calculateleftearlyno;
	}

	public void setCalculateleftearlyno(Boolean calculateleftearlyno) {
		this.calculateleftearlyno = calculateleftearlyno;
	}

	public Boolean getCalculateabsenceno() {
		return calculateabsenceno;
	}

	public void setCalculateabsenceno(Boolean calculateabsenceno) {
		this.calculateabsenceno = calculateabsenceno;
	}

	public Integer getPositionclassesid() {
		return positionclassesid;
	}

	public void setPositionclassesid(Integer positionclassesid) {
		this.positionclassesid = positionclassesid;
	}

	public Integer getAttendanceclasschildid() {
		return attendanceclasschildid;
	}

	public void setAttendanceclasschildid(Integer attendanceclasschildid) {
		this.attendanceclasschildid = attendanceclasschildid;
	}

	public Attendanceclasschild getTimeType() {
		return timeType;
	}

	public void setTimeType(Attendanceclasschild timeType) {
		this.timeType = timeType;
	}

}