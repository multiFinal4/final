package com.project.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		//System.out.println(customer_id+state);
		ModelAndView mav = new ModelAndView();
		CustomerDTO customerinfo = service.getCustomerInfo(customer_id);
		String view = "";
		if(state.equals("READ")) {
			view = "customer_read";
		}else if(state.equals("UPDATE")){
			view = "customer_update";
		}
		model.addAttribute("customerinfo", customerinfo);
		return view;
	}
	
	
	
	//회원가입 페이지 호출 
	@RequestMapping(value ="/customer/register.do", method = RequestMethod.GET)
	public String registerPage() {
		return "customer_register";
	}
	
	
	//회원가입 처리
	@RequestMapping(value ="/customer/register.do", method=RequestMethod.POST)
	public String register(CustomerDTO customer) {
		service.register(customer);
		return "login";  
	}
	

	
	//
	@RequestMapping("/customer/update.do")
	public String update(CustomerDTO customer) {
		service.update(customer);
		return "redirect:/customer/read.do?customer_id="+customer.getCustomer_id()+"&state=READ";
	}
	
	
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
	
	@RequestMapping("/customer/realdelete.do")
	public String realdelete(String customer_id) {
		service.realdelete(customer_id);
		return "redirect:/customer/list.do?type=all&pageNo=1&name="; 	
	}
	
	
	
	

	
	
}
