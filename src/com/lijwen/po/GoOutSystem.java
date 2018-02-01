package com.lijwen.po;

public class GoOutSystem {
    private Integer gooutsystemid;

    private Integer goouttime;

    private Integer gooutabsenteeism;

    private Integer timeno;

    private Integer systemid;

    public GoOutSystem(Integer gooutsystemid, Integer goouttime, Integer gooutabsenteeism, Integer timeno, Integer systemid) {
        this.gooutsystemid = gooutsystemid;
        this.goouttime = goouttime;
        this.gooutabsenteeism = gooutabsenteeism;
        this.timeno = timeno;
        this.systemid = systemid;
    }

    public GoOutSystem() {
        super();
    }

    public Integer getGooutsystemid() {
        return gooutsystemid;
    }

    public void setGooutsystemid(Integer gooutsystemid) {
        this.gooutsystemid = gooutsystemid;
    }

    public Integer getGoouttime() {
        return goouttime;
    }

    public void setGoouttime(Integer goouttime) {
        this.goouttime = goouttime;
    }

    public Integer getGooutabsenteeism() {
        return gooutabsenteeism;
    }

    public void setGooutabsenteeism(Integer gooutabsenteeism) {
        this.gooutabsenteeism = gooutabsenteeism;
    }

    public Integer getTimeno() {
        return timeno;
    }

    public void setTimeno(Integer timeno) {
        this.timeno = timeno;
    }

    public Integer getSystemid() {
        return systemid;
    }

    public void setSystemid(Integer systemid) {
        this.systemid = systemid;
    }
}