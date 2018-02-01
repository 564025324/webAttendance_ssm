package com.lijwen.po;

public class System {
    private Integer systemid;

    private String systemnumber;

    private String systemname;

    public System(Integer systemid, String systemnumber, String systemname) {
        this.systemid = systemid;
        this.systemnumber = systemnumber;
        this.systemname = systemname;
    }

    public System() {
        super();
    }

    public Integer getSystemid() {
        return systemid;
    }

    public void setSystemid(Integer systemid) {
        this.systemid = systemid;
    }

    public String getSystemnumber() {
        return systemnumber;
    }

    public void setSystemnumber(String systemnumber) {
        this.systemnumber = systemnumber == null ? null : systemnumber.trim();
    }

    public String getSystemname() {
        return systemname;
    }

    public void setSystemname(String systemname) {
        this.systemname = systemname == null ? null : systemname.trim();
    }
}