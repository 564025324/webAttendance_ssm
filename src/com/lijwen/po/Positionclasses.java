package com.lijwen.po;

public class Positionclasses {
    private Integer positionclassesid;

    private String classesnumber;

    private String classesname;

    //private Integer staffpositionid;

    private Integer classtypeid;
    
    //新增的
    private AttributeGatherChild classtype;
    private String banduanxinxi;

    public String getBanduanxinxi() {
		return banduanxinxi;
	}

	public void setBanduanxinxi(String banduanxinxi) {
		this.banduanxinxi = banduanxinxi;
	}

	public AttributeGatherChild getClasstype() {
		return classtype;
	}

	public void setClasstype(AttributeGatherChild classtype) {
		this.classtype = classtype;
	}

	public Positionclasses(Integer positionclassesid, String classesnumber, String classesname,/* Integer staffpositionid,*/ Integer classtypeid) {
        this.positionclassesid = positionclassesid;
        this.classesnumber = classesnumber;
        this.classesname = classesname;
       // this.staffpositionid = staffpositionid;
        this.classtypeid = classtypeid;
    }

    public Positionclasses() {
        super();
    }

    public Integer getPositionclassesid() {
        return positionclassesid;
    }

    public void setPositionclassesid(Integer positionclassesid) {
        this.positionclassesid = positionclassesid;
    }

    public String getClassesnumber() {
        return classesnumber;
    }

    public void setClassesnumber(String classesnumber) {
        this.classesnumber = classesnumber == null ? null : classesnumber.trim();
    }

    public String getClassesname() {
        return classesname;
    }

    public void setClassesname(String classesname) {
        this.classesname = classesname == null ? null : classesname.trim();
    }

    /*public Integer getStaffpositionid() {
        return staffpositionid;
    }

    public void setStaffpositionid(Integer staffpositionid) {
        this.staffpositionid = staffpositionid;
    }
*/
    public Integer getClasstypeid() {
        return classtypeid;
    }

    public void setClasstypeid(Integer classtypeid) {
        this.classtypeid = classtypeid;
    }
}