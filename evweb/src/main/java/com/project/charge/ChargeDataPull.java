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
		List<ChargeDTO> chargelist = new ArrayList<ChargeDTO>();
		ChargeDTO dto = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		List<ChargerDTO> chargerlist = chargerService.chargerlist(); //충전기 리스트
		for(ChargerDTO charger : chargerlist) {
			if(charger.getLast_Tsdt()==null) {
				System.out.println("시작시간 null");
				continue;
			}
			if(charger.getOutput()==null) {
				System.out.println("Output null");
				continue;
			}
			if(service.cheak(charger.getStation_id(), charger.getCharger_id(), charger.getLast_Tsdt())) {
				System.out.println("중복데이터");
				continue;
			}
			dto = new ChargeDTO(charger.getStation_id(),charger.getCharger_id()); //station_id와 충전소 id
			double output = Double.parseDouble(charger.getOutput()); //kWh
			String charge_date = charger.getLast_Tedt().substring(0,8);
			
			//충전 시간 구하기
			Date endtime = format.parse(charger.getLast_Tedt()); 
			Date starttime = format.parse(charger.getLast_Tsdt());
			long diff = endtime.getTime() - starttime.getTime(); //충전 시간
			long diffMinutes = diff / (60 * 1000); //분으로 환산     
			double charging_amount = Math.round((output*diffMinutes/60)*100)/100.0; //소숫점 2자리
			dto.setCharging_amount(charging_amount); //충전량
			dto.setStart_time(charger.getLast_Tsdt());	//충전 종료 시간
			dto.setEnd_time(charger.getLast_Tedt());	//충전 시작 시간
			dto.setCharging_date(charge_date);	//충전 날짜
			System.out.println(dto);
			chargelist.add(dto);
		}
		return chargelist;
	}
}
