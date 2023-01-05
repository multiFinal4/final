package com.project.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.station.StationDTO;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	ManagerService service;
	
	@Autowired
	public ManagerController(ManagerService service) {
		super();
		this.service = service;
	}
	//타입으로 분류
	@RequestMapping("/list.do")
	public ModelAndView list(String type, String endNo, String pageNo) {
		ModelAndView mav = new ModelAndView("adminList");
		List<ManagerDTO> managerlist = service.findByType(type);
		int showList = 7; // 리스트 보여줄 갯수
		endNo = Integer.toString((Integer.parseInt(pageNo)*showList));
		List<ManagerDTO> managerlistPage = service.findListByType(type, endNo);
		int endPage = 0; // 페이징 넘버 유동적으로 
		if (type.equals("all")) {
			if (managerlist.size() <= showList) {
				endPage = 1;
			}else {
				endPage = (managerlist.size()/showList)+1;
			}
		}
		else {
			if (managerlistPage.size() <= showList) {
				endPage = 1;
			}else {

				endPage = (managerlistPage.size()/showList)+1;
			}
		}
		mav.addObject("managerlistPage", managerlistPage);
		mav.addObject("managerlist", managerlist);
		
		mav.addObject("type", type);
		mav.addObject("endPage", endPage);
		mav.addObject("pageNo", pageNo);
		return mav;
	}
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
		}
		model.addAttribute("managerinfo", managerinfo);
		return view;
	}
	@RequestMapping("/update.do")
	public String update(ManagerDTO manager) {
		service.update(manager);
		return "redirect:/manager/list.do?type=all";
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
	@RequestMapping("/delete.do")
	public String delete(String manager_id) {
		service.delete(manager_id);
		return "redirect:/manager/list.do?type=all"; 	
	}
	@RequestMapping(value = "/idcheak", produces = "application/json; charset=utf-8")
	@ResponseBody
	public boolean idcheak(String manager_id) {
		return service.idCheck(manager_id); 
	}
}
