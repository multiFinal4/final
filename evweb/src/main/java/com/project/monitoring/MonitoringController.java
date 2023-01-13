package com.project.monitoring;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.charge.ChargeService;
import com.project.charger.ChargerAPIPull;
import com.project.charger.ChargerController;
import com.project.charger.ChargerDTO;
import com.project.charger.ChargerService;
import com.project.manager.ManagerService;
import com.project.station.StationAPIPull;
import com.project.station.StationDTO;
import com.project.station.StationService;
import com.project.weather.WeatherDTO;
import com.project.weather.WeatherService;
import com.project.weather.WeatherUtil;

@Controller
public class MonitoringController {
	StationService service;
	ChargerService chargerService;
	ManagerService managerService;
	WeatherService weatherService;
	ChargeService chargeService;
	StationAPIPull stationAPIPull;
	ChargerAPIPull chargerAPIPull;
	ChargerController chargerCtrl;
	
	public MonitoringController() {}
	@Autowired
	public MonitoringController(StationService service, ChargerService chargerService, ManagerService managerService,
			StationAPIPull stationAPIPull, ChargerAPIPull chargerAPIPull, ChargerController chargerCtrl, WeatherService weatherService, ChargeService chargeService) {
		super();
		this.service = service;
		this.chargerService = chargerService;
		this.managerService = managerService;
		this.stationAPIPull = stationAPIPull;
		this.chargerAPIPull = chargerAPIPull;
		this.chargerCtrl = chargerCtrl;
		this.weatherService = weatherService;
		this.chargeService = chargeService;
	}

	@RequestMapping("/monitoring/main")
	public ModelAndView stationList(String stationId) {
		ModelAndView mv = new ModelAndView("monitoring");
		List<StationDTO> stationlist = service.stationList();
		StationDTO stationInfo = service.read(stationId);
		List<ChargerDTO> chargerlnfo =  chargerCtrl.chargerInfo(stationId);
		
		mv.addObject("stationlist", stationlist);
		mv.addObject("stationId",stationId);
		mv.addObject("stationInfo",stationInfo);
		mv.addObject("chargerlnfo", chargerlnfo);
		
		//날씨 정보
		List<WeatherDTO> weatherlist = weatherService.readList(stationId);
		WeatherUtil weatherutil = new WeatherUtil();
		WeatherDTO weather = weatherService.read(stationId, LocalDate.now().toString(), LocalTime.now().toString());
		String tmx = weatherutil.getTmx(weatherlist, stationId);
		String tmn = weatherutil.getTmn(weatherlist, stationId);
		mv.addObject("weatherlist", weatherlist);
		mv.addObject("weather", weather);
		mv.addObject("tmx", tmx);
		mv.addObject("tmn", tmn);
		//충전량
		String chargeAmount = chargeService.sumchargeAmount(stationId, weatherutil.getDate(LocalDate.now(), "yyyyMMdd"));
		mv.addObject("chargeAmount", chargeAmount);
		
		//메뉴관리를 위한 변수 state
		String state = "main";
		mv.addObject("state", state);
				
		return mv;
	}
	
	// ajax로 충전기정보 업데이트하기
//	@RequestMapping(value = "/ajax/updateList", produces = "application/json;charset=utf-8")
//	@ResponseBody
//	public void stationUpdate() throws Exception {
//		chargerService.deleteAll();
//		service.deleteAll();
//		// 충전소 업데이트
//		for (StationDTO stationDTO : stationAPIPull.stationList()) {
//			service.insert(stationDTO);
//		}
//		// 충전기 업데이트
//		for (ChargerDTO chargerDTO : chargerAPIPull.chargerList()) {
//			chargerService.insert(chargerDTO);
//		}
//
//	}
}
