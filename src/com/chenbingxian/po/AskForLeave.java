package com.chenbingxian.po;

import org.springframework.format.annotation.DateTimeFormat;

 

public class AskForLeave {
    private Integer askforleaveid;

    private Integer proposerid;

    private Integer registrationtypeid;

    private String startdate;

    private String enddate;

    private Integer operationstaffid;

    private String operatingtime;
 /* @DateTimeFormat(pattern="yyyy-mm-dd")*/
    private String checktime;

    private Integer checkmanid;
    
    private String remark;
    private Integer  checkTypeId;
    private String writeBack;
	private Integer groupid;
	private boolean workNo;
    public boolean isWorkNo() {
		return workNo;
	}

	public void setWorkNo(boolean workNo) {
		this.workNo = workNo;
	}

	public Integer getGroupid() {
		return groupid;
	}

	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}


    public String getWriteBack() {
		return writeBack;
	}

	public void setWriteBack(String writeBack) {
		this.writeBack = writeBack;
	}

	public void setCheckTypeId(Integer checkTypeId) {
		this.checkTypeId = checkTypeId;
	}

	public Integer getCheckTypeId() {
		return checkTypeId;
	}

	public void setCheckTypeId(int checkTypeId) {
		this.checkTypeId = checkTypeId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	 

	public AskForLeave(Integer askforleaveid, Integer proposerid, Integer registrationtypeid, String startdate, String enddate, Integer operationstaffid, String operatingtime, String checktime, Integer checkmanid) {
        this.askforleaveid = askforleaveid;
        this.proposerid = proposerid;
        this.registrationtypeid = registrationtypeid;
        this.startdate = startdate;
        this.enddate = enddate;
        this.operationstaffid = operationstaffid;
        this.operatingtime = operatingtime;
        this.checktime = checktime;
        this.checkmanid = checkmanid;
    }

    public AskForLeave() {
        super();
    }

    public Integer getAskforleaveid() {
        return askforleaveid;
    }

    public void setAskforleaveid(Integer askforleaveid) {
        this.askforleaveid = askforleaveid;
    }

    public Integer getProposerid() {
        return proposerid;
    }

    public void setProposerid(Integer proposerid) {
        this.proposerid = proposerid;
    }

    public Integer getRegistrationtypeid() {
        return registrationtypeid;
    }

    public void setRegistrationtypeid(Integer registrationtypeid) {
        this.registrationtypeid = registrationtypeid;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public Integer getOperationstaffid() {
        return operationstaffid;
    }

    public void setOperationstaffid(Integer operationstaffid) {
        this.operationstaffid = operationstaffid;
    }

    public String getOperatingtime() {
        return operatingtime;
    }

    public void setOperatingtime(String operatingtime) {
        this.operatingtime = operatingtime;
    }

    public String getChecktime() {
        return checktime;
    }

    public void setChecktime(String checktime) {
        this.checktime = checktime;
    }

    public Integer getCheckmanid() {
        return checkmanid;
    }

    public void setCheckmanid(Integer checkmanid) {
        this.checkmanid = checkmanid;
    }
}