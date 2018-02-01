package com.lijwen.po;

public class Department {
    private Integer departmentid;

    private String number;

    private String name;

    private Integer fatherid;

    private String remark;

    public Department(Integer departmentid, String number, String name, Integer fatherid, String remark) {
        this.departmentid = departmentid;
        this.number = number;
        this.name = name;
        this.fatherid = fatherid;
        this.remark = remark;
    }

    public Department() {
        super();
    }

    public Integer getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(Integer departmentid) {
        this.departmentid = departmentid;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getFatherid() {
        return fatherid;
    }

    public void setFatherid(Integer fatherid) {
        this.fatherid = fatherid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}