package com.project.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.customer.CustomerDTO;
import com.project.customer.customerService;
import com.project.station.StationDTO;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	ManagerService service;
	customerService customerservice;
	
	@Autowired
	public ManagerController(ManagerService service, customerService customerservice) {
		super();
		this.service = service;
		this.customerservice = customerservice;
	}
	
	
	//타입으로 분류
	@RequestMapping("/list.do")
	public ModelAndView list(String type, String endNo, String pageNo, String name) {
		ModelAndView mav = new ModelAndView("adminList");
		List<ManagerDTO> managerlist = service.findByName(type, name);
		String state = "";
		if(type.equals("all") || type.equals("일반 사용자")) {
			state = "all";
		}else {
			state = "불러오지마";
		}
		List<CustomerDTO> customerlist = customerservice.findByName(state, name);	
		int showList = 10; // 리스트 보여줄 갯수
		endNo = Integer.toString((Integer.parseInt(pageNo)*showList));
		String remainNo = Integer.toString(Integer.parseInt(endNo)-managerlist.size());
		List<ManagerDTO> managerlistPage = service.findListByType(type, endNo, name);
		List<CustomerDTO> customerlistPage = customerservice.findListByState(state, remainNo, name);
		int endPage = 0; // 페이징 넘버 유동적으로
		int sizeList = managerlist.size() + customerlist.size();
		if (type.equals("all")) {
			if (sizeList <= showList) {
				endPage = 1;
			}else {
				endPage = (int) Math.ceil(sizeList/(double)showList);
			}
		}
		else {
			if (sizeList<= showList) {
				endPage = 1;
			}else {

				endPage = (int) Math.ceil(sizeList/(double)showList);
			}
		}
		mav.addObject("managerlistPage", managerlistPage);
		mav.addObject("managerlist", managerlist);
		mav.addObject("customerlistPage", customerlistPage);
		mav.addObject("customerlist", customerlist);
		mav.addObject("name", name);
		mav.addObject("type", type);
		mav.addObject("endPage", endPage);
		mav.addObject("pageNo", pageNo);
		return mav;
	}
	//list.do에 search기능 통합 -미사용메소드-
	@RequestMapping("/search.do")
	public ModelAndView search(String type,String name) {
		ModelAndView mav = new ModelAndView("adminList");
		List<ManagerDTO> managerlist = service.findByName(type,name);
		mav.addObject("managerlist", managerlist);
		mav.addObject("type",type);
		return mav;
	}
	@RequestMapping("/read.do")
	public String read(String manager_id,String read,Model model) {
		ManagerDTO managerinfo = service.getManagerInfo(manager_id);
		String view = "";
		if(read.equals("READ")) {
			view  = "adminRead";
		}else if(read.equals("UPDATE")) {
			view  = "adminUpdate";
		}else if(read.equals("MYPAGE")) {
			view  = "manager_mypage";
		}else if(read.equals("MPUPDATE")) {
			view  = "manager_update";
		}
		model.addAttribute("managerinfo", managerinfo);
		return view;
	}
	@RequestMapping("/update.do")
	public String update(ManagerDTO manager) {
		System.out.println(manager);
		service.update(manager);
		return "redirect:/manager/list.do?type=all&pageNo=1&name=";
	}
	
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String registerpage() {
		return "adminRegister";
	}
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String register(ManagerDTO manager) {
		service.register(manager);
		return "redirect:/manager/list.do?type=all&pageNo=1&name=";
	}
	@RequestMapping("/delete.do")
	public String delete(String manager_id,String customer_id) {
		if(manager_id!=null) {
			service.delete(manager_id);
		}
		if(customer_id!=null) {
			customerservice.delete(customer_id);
		}
		return "redirect:/manager/list.do?type=all&pageNo=1&name="; 	
	}
	@RequestMapping(value = "/idcheak", produces = "application/json; charset=utf-8")
	@ResponseBody
	public boolean idcheak(String manager_id) {
		return service.idCheck(manager_id); 
	
	}
	@RequestMapping("/customerRead.do")
	public String customerread(String customer_id,String read,Model model) {
		CustomerDTO customerinfo = customerservice.getCustomerInfo(customer_id);
		String view = "";
		if(read.equals("READ")) {
			view  = "admin_customer_read";
		}else if(read.equals("UPDATE")) {
			view  = "admin_customer_update";
		}
		model.addAttribute("customerinfo", customerinfo);
		return view;
	}
	@RequestMapping("/change.do")
	public String cusToMgr(ManagerDTO manager, Model model) {
		System.out.println(manager);
		service.register(manager);
		customerservice.change(manager.getManager_id());
		return "redirect:/manager/list.do?type=all&pageNo=1&name=";
	}
	@RequestMapping("/realdelete.do")
	public String realdelete(String manager_id) {
		service.realdelete(manager_id);
		return "redirect:/manager/list.do?type=all&pageNo=1&name="; 	
	}
}
