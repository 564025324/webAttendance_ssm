package com.chenbingxian.po;



public class StaffPosition {
    private Integer staffpositionid;
    private Integer positionid;
	private Integer departmentid;
    //新增部门字段
    private Department department;
    private AttributeGatherChild position;

    public AttributeGatherChild getPosition() {
		return position;
	}

	public void setPosition(AttributeGatherChild position) {
		this.position = position;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public StaffPosition(Integer staffpositionid, Integer positionid, Integer departmentid) {
        this.staffpositionid = staffpositionid;
        this.positionid = positionid;
        this.departmentid = departmentid;
    }

    public StaffPosition() {
        super();
    }

    public Integer getStaffpositionid() {
        return staffpositionid;
    }

    public void setStaffpositionid(Integer staffpositionid) {
        this.staffpositionid = staffpositionid;
    }

  
	public Integer getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(Integer departmentid) {
        this.departmentid = departmentid;
    }
    public Integer getPositionid() {
 		return positionid;
 	}

 	public void setPositionid(Integer positionid) {
 		this.positionid = positionid;
 	}

}