package com.chenbingxian.po;

public class Shift {
    private Integer shiftid;

    private String shiftnumber;

    private String shiftname;

    private Integer staffpositionid;

    public Shift(Integer shiftid, String shiftnumber, String shiftname, Integer staffpositionid) {
        this.shiftid = shiftid;
        this.shiftnumber = shiftnumber;
        this.shiftname = shiftname;
        this.staffpositionid = staffpositionid;
    }

    public Shift() {
        super();
    }

    public Integer getShiftid() {
        return shiftid;
    }

    public void setShiftid(Integer shiftid) {
        this.shiftid = shiftid;
    }

    public String getShiftnumber() {
        return shiftnumber;
    }

    public void setShiftnumber(String shiftnumber) {
        this.shiftnumber = shiftnumber == null ? null : shiftnumber.trim();
    }

    public String getShiftname() {
        return shiftname;
    }

    public void setShiftname(String shiftname) {
        this.shiftname = shiftname == null ? null : shiftname.trim();
    }

    public Integer getStaffpositionid() {
        return staffpositionid;
    }

    public void setStaffpositionid(Integer staffpositionid) {
        this.staffpositionid = staffpositionid;
    }
}