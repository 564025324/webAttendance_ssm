package com.lijwen.po;

public class NotClassesSystem {
    private Integer notclassessystemid;

    private Integer fulldatetime;

    private Integer overtimeforover;

    private Integer longworktime;

    private Integer longworktimetozero;

	private Integer systemid;

    public Integer getSystemid() {
		return systemid;
	}

	public void setSystemid(Integer systemid) {
		this.systemid = systemid;
	}

	public NotClassesSystem(Integer notclassessystemid, Integer fulldatetime, Integer overtimeforover, Integer longworktime, Integer longworktimetozero, Integer systemid) {
        this.notclassessystemid = notclassessystemid;
        this.fulldatetime = fulldatetime;
        this.overtimeforover = overtimeforover;
        this.longworktime = longworktime;
        this.longworktimetozero = longworktimetozero;
        this.systemid = systemid;
    }

    public NotClassesSystem() {
        super();
    }

    public Integer getNotclassessystemid() {
        return notclassessystemid;
    }

    public void setNotclassessystemid(Integer notclassessystemid) {
        this.notclassessystemid = notclassessystemid;
    }

    public Integer getFulldatetime() {
        return fulldatetime;
    }

    public void setFulldatetime(Integer fulldatetime) {
        this.fulldatetime = fulldatetime;
    }

    public Integer getOvertimeforover() {
        return overtimeforover;
    }

    public void setOvertimeforover(Integer overtimeforover) {
        this.overtimeforover = overtimeforover;
    }

    public Integer getLongworktime() {
        return longworktime;
    }

    public void setLongworktime(Integer longworktime) {
        this.longworktime = longworktime;
    }

    public Integer getLongworktimetozero() {
        return longworktimetozero;
    }

    public void setLongworktimetozero(Integer longworktimetozero) {
        this.longworktimetozero = longworktimetozero;
    }

   
}