package com.project.charge;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.charger.ChargerDTO;
import com.project.charger.ChargerService;
import com.project.station.StationDTO;
import com.project.station.StationService;

@Controller
@RequestMapping("/charge")
public class ChargeController {
	ChargeService service;
	ChargerService chargerService;
	StationService stationService;
	@Autowired
	public ChargeController(ChargeService service, ChargerService chargerService,StationService stationService) {
		super();
		this.service = service;
		this.chargerService = chargerService;
		this.stationService = stationService;
	}
	
	@RequestMapping("/chart.do")
	public String chargeAmountChart(String stationId, Model model) {
		//메뉴관리를 위한 변수 state
		String state = "chart";
		List<StationDTO> stationlist = stationService.stationList();
		model.addAttribute("state",state);
		model.addAttribute("stationId",stationId);
		model.addAttribute("stationlist",stationlist);
		return "monitoring/chargeamount";
		
	}
}
