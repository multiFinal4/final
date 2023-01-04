package com.project.customer;

import java.sql.Date;

public class CustomerDTO {
	private String customer_id;
	private String customer_pass;
	private String phone_no;
	private String customer_name;
	private String customer_addr;
	private String email;
	private Date insertdate;
	private Date customer_birth;
	private String ps_question;
	private String ps_answer;
	private String state;

	public CustomerDTO() {

	}

	public CustomerDTO(String customer_id, String customer_pass, String phone_no, String customer_name,
			String customer_addr, String email, Date insertdate, Date customer_birth, String ps_question,
			String ps_answer, String state) {
		super();
		this.customer_id = customer_id;
		this.customer_pass = customer_pass;
		this.phone_no = phone_no;
		this.customer_name = customer_name;
		this.customer_addr = customer_addr;
		this.email = email;
		this.insertdate = insertdate;
		this.customer_birth = customer_birth;
		this.ps_question = ps_question;
		this.ps_answer = ps_answer;
		this.state = state;
	}

	@Override
	public String toString() {
		return "CustomerDTO [customer_id=" + customer_id + ", customer_pass=" + customer_pass + ", phone_no=" + phone_no
				+ ", customer_name=" + customer_name + ", customer_addr=" + customer_addr + ", email=" + email
				+ ", insertdate=" + insertdate + ", customer_birth=" + customer_birth + ", ps_question=" + ps_question
				+ ", ps_answer=" + ps_answer + ", state=" + state + "]";
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getCustomer_pass() {
		return customer_pass;
	}

	public void setCustomer_pass(String customer_pass) {
		this.customer_pass = customer_pass;
	}

	public String getPhone_no() {
		return phone_no;
	}

	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_addr() {
		return customer_addr;
	}

	public void setCustomer_addr(String customer_addr) {
		this.customer_addr = customer_addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(Date insertdate) {
		this.insertdate = insertdate;
	}

	public Date getCustomer_birth() {
		return customer_birth;
	}

	public void setCustomer_birth(Date customer_birth) {
		this.customer_birth = customer_birth;
	}

	public String getPs_question() {
		return ps_question;
	}

	public void setPs_question(String ps_question) {
		this.ps_question = ps_question;
	}

	public String getPs_answer() {
		return ps_answer;
	}

	public void setPs_answer(String ps_answer) {
		this.ps_answer = ps_answer;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	
	

	
	
}
