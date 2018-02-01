package com.lijwen.po;

import java.util.Date;

public class StaffClassesRecord {
    private Integer staffclassesrecordid;

    private Date workdate;

    private Integer staffid;

    public StaffClassesRecord(Integer staffclassesrecordid, Date workdate, Integer staffid) {
        this.staffclassesrecordid = staffclassesrecordid;
        this.workdate = workdate;
        this.staffid = staffid;
    }

    public StaffClassesRecord() {
        super();
    }

    public Integer getStaffclassesrecordid() {
        return staffclassesrecordid;
    }

    public void setStaffclassesrecordid(Integer staffclassesrecordid) {
        this.staffclassesrecordid = staffclassesrecordid;
    }

    public Date getWorkdate() {
        return workdate;
    }

    public void setWorkdate(Date workdate) {
        this.workdate = workdate;
    }

    public Integer getStaffid() {
        return staffid;
    }

    public void setStaffid(Integer staffid) {
        this.staffid = staffid;
    }
}