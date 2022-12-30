package com.project.manager;

public class ManagerDTO {
	private String manager_id;	
	private String manager_pass;	
	private String manager_name;	
	private String phone_no;	
	private String addr;	
	private String email;	
	private String type;
	private String company;	
	private String position;	
	private String hire_date;
	private String state;
	
	public ManagerDTO() {
	}
	public ManagerDTO(String manager_id, String manager_pass, String manager_name, String phone_no, String addr,
			String email, String type, String company, String position, String hire_date, String state) {
		super();
		this.manager_id = manager_id;
		this.manager_pass = manager_pass;
		this.manager_name = manager_name;
		this.phone_no = phone_no;
		this.addr = addr;
		this.email = email;
		this.type = type;
		this.company = company;
		this.position = position;
		this.hire_date = hire_date;
		this.state = state;
	}
	
	
	@Override
	public String toString() {
		return "ManagerDTO [manager_id=" + manager_id + ", manager_pass=" + manager_pass + ", manager_name="
				+ manager_name + ", phone_no=" + phone_no + ", addr=" + addr + ", email=" + email + ", type=" + type
				+ ", company=" + company + ", position=" + position + ", hire_date=" + hire_date + ", state=" + state
				+ "]";
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getManager_pass() {
		return manager_pass;
	}
	public void setManager_pass(String manager_pass) {
		this.manager_pass = manager_pass;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getHire_date() {
		return hire_date;
	}
	public void setHire_date(String hire_date) {
		this.hire_date = hire_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
