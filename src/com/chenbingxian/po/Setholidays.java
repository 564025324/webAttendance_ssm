package com.chenbingxian.po;

import java.util.Date;

public class Setholidays {
    private Integer holidaysid;

    private String holidayname;

    private Date startdate;

    private Date enddate;

    private Integer staffpositionid;

    private String remark;

    public Setholidays(Integer holidaysid, String holidayname, Date startdate, Date enddate, Integer staffpositionid, String remark) {
        this.holidaysid = holidaysid;
        this.holidayname = holidayname;
        this.startdate = startdate;
        this.enddate = enddate;
        this.staffpositionid = staffpositionid;
        this.remark = remark;
    }

    public Setholidays() {
        super();
    }

    public Integer getHolidaysid() {
        return holidaysid;
    }

    public void setHolidaysid(Integer holidaysid) {
        this.holidaysid = holidaysid;
    }

    public String getHolidayname() {
        return holidayname;
    }

    public void setHolidayname(String holidayname) {
        this.holidayname = holidayname == null ? null : holidayname.trim();
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public Integer getStaffpositionid() {
        return staffpositionid;
    }

    public void setStaffpositionid(Integer staffpositionid) {
        this.staffpositionid = staffpositionid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}