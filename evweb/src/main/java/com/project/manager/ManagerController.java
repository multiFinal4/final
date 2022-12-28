package com.project.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	ManagerService service;
	
	@Autowired
	public ManagerController(ManagerService service) {
		super();
		this.service = service;
	}
	@RequestMapping("/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("adminList");
		List<ManagerDTO> managerlist = service.selectList();
		mav.addObject("managerlist", managerlist);
		return mav;
	}
	
	
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String registerpage() {
		return "adminRegister";
	}
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String register(ManagerDTO manager) {
		service.register(manager);
		return "redirect:/admin";
	}
	
	@RequestMapping(value = "/idcheak", produces = "application/json; charset=utf-8")
	@ResponseBody
	public boolean idcheak(String manager_id) {
		return service.idCheck(manager_id); 
	}
}
