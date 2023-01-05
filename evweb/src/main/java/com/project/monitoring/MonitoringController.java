package com.project.monitoring;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.charger.ChargerAPIPull;
import com.project.charger.ChargerController;
import com.project.charger.ChargerDTO;
import com.project.charger.ChargerService;
import com.project.manager.ManagerService;
import com.project.station.StationAPIPull;
import com.project.station.StationDTO;
import com.project.station.StationService;

@Controller
public class MonitoringController {

	StationService service;
	ChargerService chargerService;
	ManagerService managerService;
	StationAPIPull stationAPIPull;
	ChargerAPIPull chargerAPIPull;
	ChargerController chargerCtrl;
	
	public MonitoringController() {}
	@Autowired
	public MonitoringController(StationService service, ChargerService chargerService, ManagerService managerService,
			StationAPIPull stationAPIPull, ChargerAPIPull chargerAPIPull, ChargerController chargerCtrl) {
		super();
		this.service = service;
		this.chargerService = chargerService;
		this.managerService = managerService;
		this.stationAPIPull = stationAPIPull;
		this.chargerAPIPull = chargerAPIPull;
		this.chargerCtrl = chargerCtrl;
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
		
		return mv;
	}
}
