package com.project.airquality;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AirqualityController {
	AirqualityAPIPull pull;
	AirqualityService airqualityservice;
	
	@Autowired
	public AirqualityController(AirqualityAPIPull pull, AirqualityService airqualityservice) {
		super();
		this.pull = pull;
		this.airqualityservice = airqualityservice;
	}
	
	@RequestMapping("/airquality/getlist.do")
	public String getAirqualityList(String stationId, Model model) {
		if(stationId.equals("all")){
			stationId = "BNJG3401";
		}
		return stationId;
	}
}
