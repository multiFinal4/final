package com.project.airquality;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.station.StationDTO;
import com.project.station.StationService;
import com.project.weather.WeatherUtil;

@Controller
public class AirqualityController {
	AirqualityAPIPull pull;
	StationService stationservice;
	AirqualityService airqualityService;
	
	@Autowired
	public AirqualityController(AirqualityAPIPull pull, StationService stationservice,
			AirqualityService airqualityService) {
		super();
		this.pull = pull;
		this.stationservice = stationservice;
		this.airqualityService = airqualityService;
	}
	
	@RequestMapping("/airquality/getDataDust.do")
	public String WeathergetData(String stationId, String path,Model model) throws IOException{
		String result = pull.GetAPIDataDust();
		airqualityService.delete();
		List<AirqualityDTO> dustList = pull.DataSaveDust(result);
		for (int i = 0; i < dustList.size(); i++) {
			airqualityService.insert(dustList.get(i));
		}
		return "redirect:/monitoring/main?stationId="+stationId;
	}
	
}
