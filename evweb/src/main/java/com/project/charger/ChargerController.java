package com.project.charger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChargerController {
	ChargerService service;
	public ChargerController() {};
	@Autowired
	public ChargerController(ChargerService service) {
		super();
		this.service = service;
	}
	@RequestMapping("/map/charger.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("map");
		List<ChargerDTO> chargerlist = service.chargerlist();
		mav.addObject("chargerlist", chargerlist);
		return mav;
	}
}
