package com.project.charge;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import com.project.weather.WeatherUtil;

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
		List<StationDTO> stationlist = stationService.stationList(); //메뉴의 스테이션리스트을 위한 것
		//오늘 요일 구하기
		WeatherUtil util = new WeatherUtil();
		int day = LocalDate.now().getDayOfWeek().getValue(); //1:월, 7:일 
		List<String> amountlist = new ArrayList<String>();
		List<String> datelist = new ArrayList<String>();
		for(int i=0; i<7; i++) {
			String date = util.getDate(LocalDate.now().minusDays(day).plusDays(i), "yyyyMMdd"); //날짜구하기 (일,월,화,수,목,금,토)
			String datebar = util.getDate(LocalDate.now().minusDays(day).plusDays(i), "yyyy-MM-dd"); //날짜구하기 (일,월,화,수,목,금,토)
			datelist.add(datebar);
			amountlist.add(service.sumchargeAmount(stationId, date));	
		}
		
		model.addAttribute("datelist",datelist);
		model.addAttribute("state",state);
		model.addAttribute("stationId",stationId);
		model.addAttribute("stationlist",stationlist);
		model.addAttribute("amountlist",amountlist);
		return "monitoring/chargeamount";
		
	}
}
