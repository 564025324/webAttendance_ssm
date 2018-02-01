package com.lijwen.po;

public class GttributeGather {
    private Integer attributegatherid;

    private String attributegathername;

    private Integer fatherid;

    public GttributeGather(Integer attributegatherid, String attributegathername, Integer fatherid) {
        this.attributegatherid = attributegatherid;
        this.attributegathername = attributegathername;
        this.fatherid = fatherid;
    }

    public GttributeGather() {
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

    public Integer getFatherid() {
        return fatherid;
    }

    public void setFatherid(Integer fatherid) {
        this.fatherid = fatherid;
    }
}