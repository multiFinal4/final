package com.project.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.project.charge.ChargeDTO;
import com.project.charge.ChargeDataPull;
import com.project.charge.ChargeService;
import com.project.charger.ChargerAPIPull;
import com.project.charger.ChargerDTO;
import com.project.charger.ChargerService;
import com.project.station.StationAPIPull;
import com.project.station.StationDTO;
import com.project.station.StationService;
public class AutoUpdate {
	ChargerService chargerService;
	StationService service;
	ChargeService chargeService;
	StationAPIPull stationAPIPull;
	ChargerAPIPull chargerAPIPull;
	ChargeDataPull chargeDataPull;
	
	@Autowired
	public AutoUpdate(ChargerService chargerService, StationService service, ChargeService chargeService,
			StationAPIPull stationAPIPull, ChargerAPIPull chargerAPIPull, ChargeDataPull chargeDataPull) {
		super();
		this.chargerService = chargerService;
		this.service = service;
		this.chargeService = chargeService;
		this.stationAPIPull = stationAPIPull;
		this.chargerAPIPull = chargerAPIPull;
		this.chargeDataPull = chargeDataPull;
	}


	@Scheduled(cron= "0 0/2 * * * ?") 
	public void stationUpdateAuto() throws Exception{
		chargerService.deleteAll();
		service.deleteAll();
		// 충전소 업데이트
		for (StationDTO stationDTO : stationAPIPull.stationList()) {
			service.insert(stationDTO);
		}
		// 충전기 업데이트
		for (ChargerDTO chargerDTO : chargerAPIPull.chargerList()) {
			chargerService.insert(chargerDTO);
		}
		
		for (ChargeDTO chargeDTO : chargeDataPull.chargelist()) {
			chargeService.insert(chargeDTO);
		}
		System.out.println("update완료");
	}
}
