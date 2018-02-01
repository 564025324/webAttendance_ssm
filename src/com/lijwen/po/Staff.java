package com.lijwen.po;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Staff {
	private Integer staffid;

	private String staffname;

	private String staffnumber;

	private String loginnumber;

	private String idcar;

	private String email;

	private String cardnumber;

	private String dateofentry;

	private Boolean sex;

	private Integer staffpositionid;

	private String username;

	private String password;

	private String headimage;

	private String remark;

	private Integer positiontypeid;

	private String leavedate;
	private int groupid;
	private int systemid;
	// 新增加的字段
	private StaffPosition staffPosition;
	private AttributeGatherChild positiontype;
	private AttributeGatherChild groupname;
	private System system;
	public AttributeGatherChild getGroupname() {
		return groupname;
	}

	public void setGroupname(AttributeGatherChild groupname) {
		this.groupname = groupname;
	}

	public System getSystem() {
		return system;
	}

	public void setSystem(System system) {
		this.system = system;
	}

	public int getGroupid() {
		return groupid;
	}

	public void setGroupid(int groupid) {
		this.groupid = groupid;
	}

	public int getSystemid() {
		return systemid;
	}

	public void setSystemid(int systemid) {
		this.systemid = systemid;
	}
	public AttributeGatherChild getPositiontype() {
		return positiontype;
	}

	public void setPositiontype(AttributeGatherChild positiontype) {
		this.positiontype = positiontype;
	}

	public StaffPosition getStaffPosition() {
		return staffPosition;
	}

	public void setStaffPosition(StaffPosition staffPosition) {
		this.staffPosition = staffPosition;
	}

	public Staff(Integer staffid, String staffname, String staffnumber,
			String loginnumber, String idcar, String email, String cardnumber,
			String dateofentry, Boolean sex, Integer staffpositionid,
			String username, String password, String headimage, String remark,
			Integer positiontypeid, String leavedate,Integer systemid,Integer groupid) {
		this.staffid = staffid;
		this.staffname = staffname;
		this.staffnumber = staffnumber;
		this.loginnumber = loginnumber;
		this.idcar = idcar;
		this.email = email;
		this.cardnumber = cardnumber;
		this.dateofentry = dateofentry;
		this.sex = sex;
		this.staffpositionid = staffpositionid;
		this.username = username;
		this.password = password;
		this.headimage = headimage;
		this.remark = remark;
		this.positiontypeid = positiontypeid;
		this.leavedate = leavedate;
		this.systemid=systemid;
		this.groupid=groupid;
	}

	public Staff() {
		super();
	}

	public Integer getStaffid() {
		return staffid;
	}

	public void setStaffid(Integer staffid) {
		this.staffid = staffid;
	}

	public String getStaffname() {
		return staffname;
	}

	public void setStaffname(String staffname) {
		this.staffname = staffname == null ? null : staffname.trim();
	}

	public String getStaffnumber() {
		return staffnumber;
	}

	public void setStaffnumber(String staffnumber) {
		this.staffnumber = staffnumber == null ? null : staffnumber.trim();
	}

	public String getLoginnumber() {
		return loginnumber;
	}

	public void setLoginnumber(String loginnumber) {
		this.loginnumber = loginnumber == null ? null : loginnumber.trim();
	}

	public String getIdcar() {
		return idcar;
	}

	public void setIdcar(String idcar) {
		this.idcar = idcar == null ? null : idcar.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public String getCardnumber() {
		return cardnumber;
	}

	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber == null ? null : cardnumber.trim();
	}

	public String getDateofentry() {
		return dateofentry;
	}

	public void setDateofentry(String dateofentry) {
		this.dateofentry = dateofentry;
	}

	public Boolean getSex() {
		return sex;
	}

	public void setSex(Boolean sex) {
		this.sex = sex;
	}

	public Integer getStaffpositionid() {
		return staffpositionid;
	}

	public void setStaffpositionid(Integer staffpositionid) {
		this.staffpositionid = staffpositionid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getHeadimage() {
		return headimage;
	}

	public void setHeadimage(String headimage) {
		this.headimage = headimage == null ? null : headimage.trim();
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}

	public Integer getPositiontypeid() {
		return positiontypeid;
	}

	public void setPositiontypeid(Integer positiontypeid) {
		this.positiontypeid = positiontypeid;
	}

	public String getLeavedate() {
		return leavedate;
	}

	public void setLeavedate(String leavedate) {
		this.leavedate = leavedate;
	}
}