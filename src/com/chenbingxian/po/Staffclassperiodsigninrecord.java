package com.chenbingxian.po;


public class Staffclassperiodsigninrecord {
    private Integer staffclassperiodsigninrecordid;

    private String signintime;

    private Boolean lateno;

    private Integer signinwayid;

    private String signinnumber;

    private String signbacktime;

    private Boolean leaveearlyno;

    private Integer signbackwayid;

    private String signbacknumber;

    private Integer attendanceclasschildid;

    private Integer classperiodid;

    private Integer staffclassesrecordid;

    public Staffclassperiodsigninrecord(Integer staffclassperiodsigninrecordid, String signintime, Boolean lateno, Integer signinwayid, String signinnumber, String signbacktime, Boolean leaveearlyno, Integer signbackwayid, String signbacknumber, Integer attendanceclasschildid, Integer classperiodid, Integer staffclassesrecordid) {
        this.staffclassperiodsigninrecordid = staffclassperiodsigninrecordid;
        this.signintime = signintime;
        this.lateno = lateno;
        this.signinwayid = signinwayid;
        this.signinnumber = signinnumber;
        this.signbacktime = signbacktime;
        this.leaveearlyno = leaveearlyno;
        this.signbackwayid = signbackwayid;
        this.signbacknumber = signbacknumber;
        this.attendanceclasschildid = attendanceclasschildid;
        this.classperiodid = classperiodid;
        this.staffclassesrecordid = staffclassesrecordid;
    }

    public Staffclassperiodsigninrecord() {
        super();
    }

    public Integer getStaffclassperiodsigninrecordid() {
        return staffclassperiodsigninrecordid;
    }

    public void setStaffclassperiodsigninrecordid(Integer staffclassperiodsigninrecordid) {
        this.staffclassperiodsigninrecordid = staffclassperiodsigninrecordid;
    }

    public String getSignintime() {
        return signintime;
    }

    public void setSignintime(String signintime) {
        this.signintime = signintime;
    }

    public Boolean getLateno() {
        return lateno;
    }

    public void setLateno(Boolean lateno) {
        this.lateno = lateno;
    }

    public Integer getSigninwayid() {
        return signinwayid;
    }

    public void setSigninwayid(Integer signinwayid) {
        this.signinwayid = signinwayid;
    }

    public String getSigninnumber() {
        return signinnumber;
    }

    public void setSigninnumber(String signinnumber) {
        this.signinnumber = signinnumber == null ? null : signinnumber.trim();
    }

    public String getSignbacktime() {
        return signbacktime;
    }

    public void setSignbacktime(String signbacktime) {
        this.signbacktime = signbacktime;
    }

    public Boolean getLeaveearlyno() {
        return leaveearlyno;
    }

    public void setLeaveearlyno(Boolean leaveearlyno) {
        this.leaveearlyno = leaveearlyno;
    }

    public Integer getSignbackwayid() {
        return signbackwayid;
    }

    public void setSignbackwayid(Integer signbackwayid) {
        this.signbackwayid = signbackwayid;
    }

    public String getSignbacknumber() {
        return signbacknumber;
    }

    public void setSignbacknumber(String signbacknumber) {
        this.signbacknumber = signbacknumber == null ? null : signbacknumber.trim();
    }

    public Integer getAttendanceclasschildid() {
        return attendanceclasschildid;
    }

    public void setAttendanceclasschildid(Integer attendanceclasschildid) {
        this.attendanceclasschildid = attendanceclasschildid;
    }

    public Integer getClassperiodid() {
        return classperiodid;
    }

    public void setClassperiodid(Integer classperiodid) {
        this.classperiodid = classperiodid;
    }

    public Integer getStaffclassesrecordid() {
        return staffclassesrecordid;
    }

    public void setStaffclassesrecordid(Integer staffclassesrecordid) {
        this.staffclassesrecordid = staffclassesrecordid;
    }
}