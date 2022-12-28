package com.project.station;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StationController {
	StationService service;

	@Autowired
	public StationController(StationService service) {
		super();
		this.service = service;
	}

	@RequestMapping(value = "/admin/station/insert", method = RequestMethod.GET)
	public String insertPage() {
		return "station/insert";
	}
	
	@RequestMapping(value = "/admin/station/insert.do", method = RequestMethod.POST)
	public String insert(StationDTO station) {
		service.insert(station);
		return "redirect:/admin/station/list?category=all";
	}
	
	@RequestMapping("/admin/station/list")
	public ModelAndView list(String category) {
		ModelAndView mv = new ModelAndView("station/list");
		List<StationDTO> stationlist = service.stationListCate(category);
		List<StationDTO> companyList = service.companyList();
		mv.addObject("stationlist", stationlist);
		mv.addObject("companyList", companyList);
		mv.addObject("category", category);
		return mv;
	}
	
	@RequestMapping("/admin/station/read")
	public String read(String stationId, String state, Model model) {
		StationDTO read = service.read(stationId);
		String path = "";
		
		if (state.equals("READ")) {
			path = "station/read";
		} else {
			path = "station/update";
		}
		model.addAttribute("read", read);
		System.out.println(read);
		System.out.println(read.getCharge_no());
		return path;
	}

	@RequestMapping("/admin/station/delete.do")
	public String delete(String stationId, HttpSession session) {
//		StationDTO station = (StationDTO) session.getAttribute("user");
//		String view = "";
//		if (station == null) {
//			view = "redirect:/emp/login.do";
//		}
//		else {
//			int result = service.delete(stationId);
//			view = "redirect:/admin/station/list?category=all";
//		}
		service.delete(stationId);
		return "redirect:/admin/station/list?category=all";
	}

	@RequestMapping("/board/update.do")
	public String update(StationDTO station) {
		service.update(station);
		return "redirect:/admin/station/list?category=all";
	}
	
}
