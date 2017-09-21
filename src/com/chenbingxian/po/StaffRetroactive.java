package com.chenbingxian.po;

 

public class StaffRetroactive {
    private Integer staffretroactiveid;

    private Integer staffclasseschildrecordid;

    private String signintime;

    private Boolean toandfrom;

    private Integer operationstaffid;

    private Integer signinwayid;

    private String operatingtime;

    private Integer checkmanid;

    private String checktime;

    private Integer checkstateid;

    private String applyforreason;
    private String remark;
    /**审核人姓名**/
    private String checkmanName;
    /**处理状态**/
    private String checkstate;

    public String getCheckmanName() {
		return checkmanName;
	}

	public void setCheckmanName(String checkmanName) {
		this.checkmanName = checkmanName;
	}

	public String getCheckstate() {
		return checkstate;
	}

	public void setCheckstate(String checkstate) {
		this.checkstate = checkstate;
	}

   

	public StaffRetroactive(Integer staffretroactiveid, Integer staffclasseschildrecordid, String signintime, Boolean toandfrom, Integer operationstaffid, Integer signinwayid, String operatingtime, Integer checkmanid, String checktime, Integer checkstateid, String applyforreason, String remark) {
        this.staffretroactiveid = staffretroactiveid;
        this.staffclasseschildrecordid = staffclasseschildrecordid;
        this.signintime = signintime;
        this.toandfrom = toandfrom;
        this.operationstaffid = operationstaffid;
        this.signinwayid = signinwayid;
        this.operatingtime = operatingtime;
        this.checkmanid = checkmanid;
        this.checktime = checktime;
        this.checkstateid = checkstateid;
        this.applyforreason = applyforreason;
        this.remark = remark;
    }

    public StaffRetroactive() {
        super();
    }

    public Integer getStaffretroactiveid() {
        return staffretroactiveid;
    }

    public void setStaffretroactiveid(Integer staffretroactiveid) {
        this.staffretroactiveid = staffretroactiveid;
    }

    public Integer getStaffclasseschildrecordid() {
        return staffclasseschildrecordid;
    }

    public void setStaffclasseschildrecordid(Integer staffclasseschildrecordid) {
        this.staffclasseschildrecordid = staffclasseschildrecordid;
    }

    public String getSignintime() {
        return signintime;
    }

    public void setSignintime(String signintime) {
        this.signintime = signintime;
    }

    public Boolean getToandfrom() {
        return toandfrom;
    }

    public void setToandfrom(Boolean toandfrom) {
        this.toandfrom = toandfrom;
    }

    public Integer getOperationstaffid() {
        return operationstaffid;
    }

    public void setOperationstaffid(Integer operationstaffid) {
        this.operationstaffid = operationstaffid;
    }

    public Integer getSigninwayid() {
        return signinwayid;
    }

    public void setSigninwayid(Integer signinwayid) {
        this.signinwayid = signinwayid;
    }

    public String getOperatingtime() {
        return operatingtime;
    }

    public void setOperatingtime(String operatingtime) {
        this.operatingtime = operatingtime;
    }

    public Integer getCheckmanid() {
        return checkmanid;
    }

    public void setCheckmanid(Integer checkmanid) {
        this.checkmanid = checkmanid;
    }

    public String getChecktime() {
        return checktime;
    }

    public void setChecktime(String checktime) {
        this.checktime = checktime;
    }

    public Integer getCheckstateid() {
        return checkstateid;
    }

    public void setCheckstateid(Integer checkstateid) {
        this.checkstateid = checkstateid;
    }

    public String getApplyforreason() {
        return applyforreason;
    }

    public void setApplyforreason(String applyforreason) {
        this.applyforreason = applyforreason == null ? null : applyforreason.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}