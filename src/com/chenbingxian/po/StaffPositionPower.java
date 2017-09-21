package com.chenbingxian.po;

public class StaffPositionPower {
    private Integer staffpositionpowerid;

    private Integer staffpositionid;

    private Integer powerid;

    public StaffPositionPower(Integer staffpositionpowerid, Integer staffpositionid, Integer powerid) {
        this.staffpositionpowerid = staffpositionpowerid;
        this.staffpositionid = staffpositionid;
        this.powerid = powerid;
    }

    public StaffPositionPower() {
        super();
    }

    public Integer getStaffpositionpowerid() {
        return staffpositionpowerid;
    }

    public void setStaffpositionpowerid(Integer staffpositionpowerid) {
        this.staffpositionpowerid = staffpositionpowerid;
    }

    public Integer getStaffpositionid() {
        return staffpositionid;
    }

    public void setStaffpositionid(Integer staffpositionid) {
        this.staffpositionid = staffpositionid;
    }

    public Integer getPowerid() {
        return powerid;
    }

    public void setPowerid(Integer powerid) {
        this.powerid = powerid;
    }
}