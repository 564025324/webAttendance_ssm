package com.lijwen.po;

public class Attributegather {
    private Integer attributegatherid;

    private String attributegathername;

    public Attributegather(Integer attributegatherid, String attributegathername) {
        this.attributegatherid = attributegatherid;
        this.attributegathername = attributegathername;
    }

    public Attributegather() {
        super();
    }

    public Integer getAttributegatherid() {
        return attributegatherid;
    }

    public void setAttributegatherid(Integer attributegatherid) {
        this.attributegatherid = attributegatherid;
    }

    public String getAttributegathername() {
        return attributegathername;
    }

    public void setAttributegathername(String attributegathername) {
        this.attributegathername = attributegathername == null ? null : attributegathername.trim();
    }
}