package com.project.station;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		mv.addObject("stationlist", stationlist);
		mv.addObject("category", category);
		return mv;
	}
	
}
