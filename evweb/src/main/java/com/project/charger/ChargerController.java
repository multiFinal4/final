package com.project.charger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChargerController {
	ChargerService service;
	ChargerService chargerAPIPull;
	
	public ChargerController() {}
	@Autowired
	public ChargerController(ChargerService service, ChargerService chargerAPIPull) {
		super();
		this.service = service;
		this.chargerAPIPull = chargerAPIPull;
	}
	
	@RequestMapping("/charger/insert")
	public int insert(ChargerDTO charger) {
		for (ChargerDTO chargerDTO : chargerAPIPull.chargerList()) {
			service.insert(chargerDTO);
		}
		return 0;
	}	
	
	// ajax 충전기정보
	@RequestMapping(value = "/ajax/chargerInfo", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<ChargerDTO> chargerInfo(String stationId) {
		List<ChargerDTO> chargerInfoList = service.chargerList(stationId);
		return chargerInfoList;
	}
}
