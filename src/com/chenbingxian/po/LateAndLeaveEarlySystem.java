package com.chenbingxian.po;

public class LateAndLeaveEarlySystem {
    private Integer lateandleaveearlysystemid;

    private Integer latetime;

    private Integer lateabsenteeismtime;

    private Integer lateandleaveearlyno;

    private Integer leaveearlytime;

    private Integer leaveearlyabsenteeismtime;

    private Integer systemid;

    public LateAndLeaveEarlySystem(Integer lateandleaveearlysystemid, Integer latetime, Integer lateabsenteeismtime, Integer lateandleaveearlyno, Integer leaveearlytime, Integer leaveearlyabsenteeismtime, Integer systemid) {
        this.lateandleaveearlysystemid = lateandleaveearlysystemid;
        this.latetime = latetime;
        this.lateabsenteeismtime = lateabsenteeismtime;
        this.lateandleaveearlyno = lateandleaveearlyno;
        this.leaveearlytime = leaveearlytime;
        this.leaveearlyabsenteeismtime = leaveearlyabsenteeismtime;
        this.systemid = systemid;
    }

    public LateAndLeaveEarlySystem() {
        super();
    }

    public Integer getLateandleaveearlysystemid() {
        return lateandleaveearlysystemid;
    }

    public void setLateandleaveearlysystemid(Integer lateandleaveearlysystemid) {
        this.lateandleaveearlysystemid = lateandleaveearlysystemid;
    }

    public Integer getLatetime() {
        return latetime;
    }

    public void setLatetime(Integer latetime) {
        this.latetime = latetime;
    }

    public Integer getLateabsenteeismtime() {
        return lateabsenteeismtime;
    }

    public void setLateabsenteeismtime(Integer lateabsenteeismtime) {
        this.lateabsenteeismtime = lateabsenteeismtime;
    }

    public Integer getLateandleaveearlyno() {
        return lateandleaveearlyno;
    }

    public void setLateandleaveearlyno(Integer lateandleaveearlyno) {
        this.lateandleaveearlyno = lateandleaveearlyno;
    }

    public Integer getLeaveearlytime() {
        return leaveearlytime;
    }

    public void setLeaveearlytime(Integer leaveearlytime) {
        this.leaveearlytime = leaveearlytime;
    }

    public Integer getLeaveearlyabsenteeismtime() {
        return leaveearlyabsenteeismtime;
    }

    public void setLeaveearlyabsenteeismtime(Integer leaveearlyabsenteeismtime) {
        this.leaveearlyabsenteeismtime = leaveearlyabsenteeismtime;
    }

    public Integer getSystemid() {
        return systemid;
    }

    public void setSystemid(Integer systemid) {
        this.systemid = systemid;
    }
}