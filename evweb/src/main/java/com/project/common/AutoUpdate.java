package com.project.common;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.ui.Model;

import com.project.airquality.AirqualityAPIPull;
import com.project.airquality.AirqualityController;
import com.project.airquality.AirqualityDTO;
import com.project.airquality.AirqualityService;
import com.project.charge.ChargeDTO;
import com.project.charge.ChargeDataPull;
import com.project.charge.ChargeService;
import com.project.charger.ChargerAPIPull;
import com.project.charger.ChargerDTO;
import com.project.charger.ChargerService;
import com.project.station.StationAPIPull;
import com.project.station.StationDTO;
import com.project.station.StationService;
import com.project.weather.WeatherAPIDTO;
import com.project.weather.WeatherAPIPull;
import com.project.weather.WeatherDTO;
import com.project.weather.WeatherService;
import com.project.weather.WeatherUtil;
public class AutoUpdate {
	ChargerService chargerService;
	StationService service;
	ChargeService chargeService;
	WeatherService weatherService;
	AirqualityService airqualityService;
	AirqualityAPIPull airqualityAPIPull;
	WeatherAPIPull weatherAPIPull;
	StationAPIPull stationAPIPull;
	ChargerAPIPull chargerAPIPull;
	ChargeDataPull chargeDataPull;
	
	@Autowired
	public AutoUpdate(ChargerService chargerService, StationService service, ChargeService chargeService,
			StationAPIPull stationAPIPull, ChargerAPIPull chargerAPIPull, ChargeDataPull chargeDataPull,
			WeatherService weatherService, WeatherAPIPull weatherAPIPull, AirqualityService airqualityService,
			AirqualityAPIPull airqualityAPIPull) {
		super();
		this.chargerService = chargerService;
		this.service = service;
		this.chargeService = chargeService;
		this.stationAPIPull = stationAPIPull;
		this.chargerAPIPull = chargerAPIPull;
		this.chargeDataPull = chargeDataPull;
		this.weatherAPIPull =  weatherAPIPull;
		this.airqualityAPIPull = airqualityAPIPull;
		this.airqualityService = airqualityService;
		this.weatherService = weatherService;
	}


	@Scheduled(cron= "0 35 * * * ?") 
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
		System.out.println("충전소 update완료");
	}
	
	@Scheduled(cron= "0 40 2-23/3 * * ?") 
	public void WeatherAllDataAuto() throws IOException{
    	WeatherUtil util = new WeatherUtil();    
        String base_time = util.getTime(); // 발표 시간
        String base_date = "";
        if(LocalTime.now().getHour()<2 || LocalTime.now().getMinute()<10) {
        	base_date = util.getDate(LocalDate.now().minusDays(1), "yyyyMMdd"); // 발표 날짜 
        }else {
        	base_date = util.getDate(LocalDate.now(), "yyyyMMdd"); // 발표 날짜 
        }
        String[] nx = {"48","49","50","51","52","53","53","54","46","47","48","49","50","51","52","53","54",
        			   "55","56","46","48","49","50","51","54","57","58","46","47","48","49","50","58","59",
        			   "47","48","49","50","51","52","53","54","55","58","48","49","50","51","52","53","54",
        			   "55","56","57","58","60","50","51","52","53","54","55","56","58","59","60","54","55",
        			   "56","57","58","59","52","48"};
        String[] ny = {"32","32","32","32","32","32","32","32","33","33","33","33","33","33","33","33","33",
        			   "33","33","34","34","34","34","34","34","34","34","35","35","35","35","35","35","35",
        			   "36","36","36","36","36","36","36","36","36","36","37","37","37","37","37","37","37",
        			   "37","37","37","37","37","38","38","38","38","38","38","38","38","38","38","39","39",
        			   "39","39","39","39","45","48"};
        for(int j=0; j<nx.length;j++) {
         	WeatherAPIDTO dto = new WeatherAPIDTO(base_date, base_time, nx[j], ny[j]);
         	//api호출, json값 받음
         	String result = weatherAPIPull.getAPIData(dto);
         	weatherService.delete(nx[j], ny[j]);
         	List<WeatherDTO> weatherList = weatherAPIPull.DataSave(result, nx[j], ny[j]);
         	for (int i = 0; i < weatherList.size(); i++) {
         		weatherList.get(i).setWeatherrow(i+1);
         		weatherService.insert(weatherList.get(i));
         	}
        }
        System.out.println("날씨 update완료");
	}
	
	@Scheduled(cron= "0 33 */1 * * ?") 
	public void AirqualityDataAuto() throws IOException{
		String result = airqualityAPIPull.GetAPIDataDust();
		airqualityService.delete();
		List<AirqualityDTO> dustList = airqualityAPIPull.DataSaveDust(result);
		for (int i = 0; i < dustList.size(); i++) {
			airqualityService.insert(dustList.get(i));
		}
	}
}
