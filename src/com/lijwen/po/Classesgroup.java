package com.lijwen.po;

public class Classesgroup {
    private Integer classesgroupid;

    private Integer positionclassesid;

    private Integer groupid;
    
    private Positionclasses positionclasses;

    public Positionclasses getPositionclasses() {
		return positionclasses;
	}

	public void setPositionclasses(Positionclasses positionclasses) {
		this.positionclasses = positionclasses;
	}

	public Classesgroup(Integer classesgroupid, Integer positionclassesid, Integer groupid) {
        this.classesgroupid = classesgroupid;
        this.positionclassesid = positionclassesid;
        this.groupid = groupid;
    }

    public Classesgroup() {
        super();
    }

    public Integer getClassesgroupid() {
        return classesgroupid;
    }

    public void setClassesgroupid(Integer classesgroupid) {
        this.classesgroupid = classesgroupid;
    }

    public Integer getPositionclassesid() {
        return positionclassesid;
    }

    public void setPositionclassesid(Integer positionclassesid) {
        this.positionclassesid = positionclassesid;
    }

    public Integer getGroupid() {
        return groupid;
    }

    public void setGroupid(Integer groupid) {
        this.groupid = groupid;
    }
}