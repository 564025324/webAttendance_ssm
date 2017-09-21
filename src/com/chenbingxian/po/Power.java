package com.chenbingxian.po;

public class Power {
    private Integer powerid;

    private String powername;

    public Power(Integer powerid, String powername) {
        this.powerid = powerid;
        this.powername = powername;
    }

    public Power() {
        super();
    }

    public Integer getPowerid() {
        return powerid;
    }

    public void setPowerid(Integer powerid) {
        this.powerid = powerid;
    }

    public String getPowername() {
        return powername;
    }

    public void setPowername(String powername) {
        this.powername = powername == null ? null : powername.trim();
    }
}