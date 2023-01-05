package com.project.customer;



public class CustomerDTO {
	private String customer_id;
	private String pass;
	private String phone_no;
	private String name;
	private String customer_addr;
	private String email;
	private String birth;
	private String state;
	private String ps_question;
	private String ps_answer;
	
	
	
	public CustomerDTO() {
		
	}
	
	

	public CustomerDTO(String customer_id, String pass, String phone_no, String name, String customer_addr,
			String email, String birth, String ps_question, String ps_answer, String state) {
		super();
		this.customer_id = customer_id;
		this.pass = pass;
		this.phone_no = phone_no;
		this.name = name;
		this.customer_addr = customer_addr;
		this.email = email;
		this.birth = birth;
		this.ps_question = ps_question;
		this.ps_answer = ps_answer;
		this.state = state;
	}





	

	@Override
	public String toString() {
		return "CustomerDTO [customer_id=" + customer_id + ", pass=" + pass + ", phone_no=" + phone_no + ", name="
				+ name + ", customer_addr=" + customer_addr + ", email=" + email + ", birth=" + birth + ", ps_question="
				+ ps_question + ", ps_answer=" + ps_answer + ", state=" + state + "]";
	}



	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getPhone_no() {
		return phone_no;
	}

	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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
	
	
	
	
}


