package com.project.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	customerService service;
	
	@Autowired
	public CustomerController(customerService service) {
		super();
		this.service = service;
	}
	//회원 가입 페이지 
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String Register() {
		return "login";
	}
	
	
	//회원가입 처리
	
	
	
	
}
