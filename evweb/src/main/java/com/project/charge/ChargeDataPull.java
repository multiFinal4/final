package com.project.charge;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.charger.ChargerDTO;
import com.project.charger.ChargerService;
import com.project.weather.WeatherUtil;
@Service
public class ChargeDataPull {
	ChargeService service;
	ChargerService chargerService;
	@Autowired
	public ChargeDataPull(ChargeService service, ChargerService chargerService) {
		super();
		this.service = service;
		this.chargerService = chargerService;
	}
	
	public List<ChargeDTO> chargelist() throws ParseException {
		WeatherUtil util = new WeatherUtil();
		List<ChargeDTO> chargelist = new ArrayList<ChargeDTO>();
		ChargeDTO dto = null;
		List<ChargerDTO> chargerlist = chargerService.chargerList(); //충전기 리스트
		for(ChargerDTO charger : chargerlist) {
			if(charger.getLast_Tsdt()==null) {
				continue;
			}
			if(charger.getOutput()==null) {
				continue;
			}
			if(service.cheak(charger.getStation_id(), charger.getCharger_id(), charger.getLast_Tsdt())) {
				continue;
			}
			dto = new ChargeDTO(charger.getStation_id(),charger.getCharger_id()); //station_id와 충전소 id
			double output = Double.parseDouble(charger.getOutput()); //kWh
			String charge_date = charger.getLast_Tedt().substring(0,8);
			
			//충전 시간 구하기
			long diffMinutes = util.getChargeTime(charger.getLast_Tedt(), charger.getLast_Tsdt()); //분으로 환산     
			double charging_amount = Math.round((output*diffMinutes/60)*100)/100.0; //소숫점 2자리
			dto.setCharging_amount(charging_amount); //충전량
			dto.setStart_time(charger.getLast_Tsdt());	//충전 종료 시간
			dto.setEnd_time(charger.getLast_Tedt());	//충전 시작 시간
			dto.setCharging_date(charge_date);	//충전 날짜
			if(charging_amount==0.0) {
				continue;
			}
			chargelist.add(dto);
		}
		return chargelist;
	}
}
