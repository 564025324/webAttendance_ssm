package com.lijwen.po;

public class OtherStystem {
    private Integer otherstystemid;

    private Integer timetoone;

    private Integer gooutattendanceno;

    private Integer systemid;

    public OtherStystem(Integer otherstystemid, Integer timetoone, Integer gooutattendanceno, Integer systemid) {
        this.otherstystemid = otherstystemid;
        this.timetoone = timetoone;
        this.gooutattendanceno = gooutattendanceno;
        this.systemid = systemid;
    }

    public OtherStystem() {
        super();
    }

    public Integer getOtherstystemid() {
        return otherstystemid;
    }

    public void setOtherstystemid(Integer otherstystemid) {
        this.otherstystemid = otherstystemid;
    }

    public Integer getTimetoone() {
        return timetoone;
    }

    public void setTimetoone(Integer timetoone) {
        this.timetoone = timetoone;
    }

    public Integer getGooutattendanceno() {
        return gooutattendanceno;
    }

    public void setGooutattendanceno(Integer gooutattendanceno) {
        this.gooutattendanceno = gooutattendanceno;
    }

    public Integer getSystemid() {
        return systemid;
    }

    public void setSystemid(Integer systemid) {
        this.systemid = systemid;
    }
}