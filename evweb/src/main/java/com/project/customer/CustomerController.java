package com.project.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerController {
	customerService service;
	
	@Autowired
	public CustomerController(customerService service) {
		super();
		this.service = service;
	}
	
	@RequestMapping("/customer/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("customerList");
		List<CustomerDTO> customerlist = service.customerList();
		mav.addObject("customerlist", customerlist);
		return mav;
	}
	

	
	@RequestMapping("/customer/read.do")//마이페이지
	public String read(String customer_id,String state,Model model) {
		CustomerDTO customerinfo = service.getCustomerInfo(customer_id);
		String view = "";
		if(state.equals("READ")) {
			view = "customer/customer_read";
		}else {
			view = "customer/customer_update";
		}
		model.addAttribute("customerinfo", customerinfo);
		return view;
	}
	
	
	
	//회원 가입 페이지 
	@RequestMapping(value ="/customer/register.do", method = RequestMethod.GET)
	public String registerPage() {
		return "customer/customer_register";
	}
	
	
	//회원가입 처리
	@RequestMapping(value = "/custmer/register.do",  method =RequestMethod.POST)
	public String register(CustomerDTO customer) {
		service.register(customer);
		return "login/login";  // 회원가입 완료되면 로그인페이지를 호출
	}
	
	//회원 정보 수정 페이지
	@RequestMapping(value = "/customer/update.do", method = RequestMethod.GET)
	public String updatePage() {
		return "customer/customer_update";
	}
	
	
	
	
	//정보 수정 완료하면 다시 마이페이지로! 
	@RequestMapping("/customer/update.do")
	public String update(CustomerDTO customer) {
		service.update(customer);
		return "redirect:/customer/read.do";
	}
	
	
	//회원탈퇴!
	@RequestMapping("/customer/delete.do")
	public String delete(String customer_id) {
		service.delete(customer_id);
		return "login/login"; 	
	}
	
	@RequestMapping(value = "/idcheak", produces = "application/json; charset=utf-8")
	@ResponseBody
	public boolean idcheak(String customer_id) {
		return service.idCheck(customer_id); 
	}
	
	
	
	
}
