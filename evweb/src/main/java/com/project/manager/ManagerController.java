package com.project.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	ManagerService service;
	
	@Autowired
	public ManagerController(ManagerService service) {
		super();
		this.service = service;
	}
		
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerpage() {
		return "manager/register";
	}
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(ManagerDTO manager) {
		service.register(null);
		
		return "manager/register";
	}
}
