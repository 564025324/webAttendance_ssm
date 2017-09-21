package com.chenbingxian.po;

public class ShiftChild {
    private Integer shiftchildid;

    private Integer positionclassesid;

    private Integer rankorder;

    private Integer shiftid;
    private Positionclasses positionclasses;

    public Positionclasses getPositionclasses() {
		return positionclasses;
	}

	public void setPositionclasses(Positionclasses positionclasses) {
		this.positionclasses = positionclasses;
	}

	public ShiftChild(Integer shiftchildid, Integer positionclassesid, Integer rankorder, Integer shiftid) {
        this.shiftchildid = shiftchildid;
        this.positionclassesid = positionclassesid;
        this.rankorder = rankorder;
        this.shiftid = shiftid;
    }

    public ShiftChild() {
        super();
    }

    public Integer getShiftchildid() {
        return shiftchildid;
    }

    public void setShiftchildid(Integer shiftchildid) {
        this.shiftchildid = shiftchildid;
    }

    public Integer getPositionclassesid() {
        return positionclassesid;
    }

    public void setPositionclassesid(Integer positionclassesid) {
        this.positionclassesid = positionclassesid;
    }

    public Integer getRankorder() {
        return rankorder;
    }

    public void setRankorder(Integer rankorder) {
        this.rankorder = rankorder;
    }

    public Integer getShiftid() {
        return shiftid;
    }

    public void setShiftid(Integer shiftid) {
        this.shiftid = shiftid;
    }
}