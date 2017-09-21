package com.chenbingxian.po;

public class Attendanceclasschild {
    private Integer attendanceclasschildid;

    private String dealwithnumber;

    private String dealwithname;

    private Integer resultid;

    private Integer ignorevalue;

    private Integer wayid;

    private Integer attendancectypeid;
    /*新增的*/
    private AttributeGatherChild chulijieguo ;
    private AttributeGatherChild sherufangshi;
    private AttributeGatherChild kaoqinleibie;
    public AttributeGatherChild getKaoqinleibie() {
		return kaoqinleibie;
	}

	public void setKaoqinleibie(AttributeGatherChild kaoqinleibie) {
		this.kaoqinleibie = kaoqinleibie;
	}

	public AttributeGatherChild getChulijieguo() {
		return chulijieguo;
	}

	public void setChulijieguo(AttributeGatherChild chulijieguo) {
		this.chulijieguo = chulijieguo;
	}

	public AttributeGatherChild getSherufangshi() {
		return sherufangshi;
	}

	public void setSherufangshi(AttributeGatherChild sherufangshi) {
		this.sherufangshi = sherufangshi;
	}

	public Attendanceclasschild(Integer attendanceclasschildid, String dealwithnumber, String dealwithname, Integer resultid, Integer ignorevalue, Integer wayid, Integer attendancectypeid) {
        this.attendanceclasschildid = attendanceclasschildid;
        this.dealwithnumber = dealwithnumber;
        this.dealwithname = dealwithname;
        this.resultid = resultid;
        this.ignorevalue = ignorevalue;
        this.wayid = wayid;
        this.attendancectypeid = attendancectypeid;
    }

    public Attendanceclasschild() {
        super();
    }

    public Integer getAttendanceclasschildid() {
        return attendanceclasschildid;
    }

    public void setAttendanceclasschildid(Integer attendanceclasschildid) {
        this.attendanceclasschildid = attendanceclasschildid;
    }

    public String getDealwithnumber() {
        return dealwithnumber;
    }

    public void setDealwithnumber(String dealwithnumber) {
        this.dealwithnumber = dealwithnumber == null ? null : dealwithnumber.trim();
    }

    public String getDealwithname() {
        return dealwithname;
    }

    public void setDealwithname(String dealwithname) {
        this.dealwithname = dealwithname == null ? null : dealwithname.trim();
    }

    public Integer getResultid() {
        return resultid;
    }

    public void setResultid(Integer resultid) {
        this.resultid = resultid;
    }

    public Integer getIgnorevalue() {
        return ignorevalue;
    }

    public void setIgnorevalue(Integer ignorevalue) {
        this.ignorevalue = ignorevalue;
    }

    public Integer getWayid() {
        return wayid;
    }

    public void setWayid(Integer wayid) {
        this.wayid = wayid;
    }

    public Integer getAttendancectypeid() {
        return attendancectypeid;
    }

    public void setAttendancectypeid(Integer attendancectypeid) {
        this.attendancectypeid = attendancectypeid;
    }
}