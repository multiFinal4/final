package com.project.charger;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.map.MapAPIPull;

import oracle.net.aso.n;

@Service
public class ChargerAPIPull {
	private MapAPIPull mapAPIPull;
		
	@Autowired
	public ChargerAPIPull(MapAPIPull mapAPIPull) {
		super();
		this.mapAPIPull = mapAPIPull;
	}
	
	public List<ChargerDTO> chargerList() throws Exception{
		
		List<Map<String, Object>> itemList = mapAPIPull.stationAPI();
		List<ChargerDTO> chargerList = new ArrayList<ChargerDTO>();
		
		for (Map<String, Object> charger : itemList) {
			
			ChargerDTO list = new ChargerDTO();
			
			list.setStation_id(charger.get("statId").toString());
			list.setCharger_id(charger.get("chgerId").toString());
			list.setCharger_type(charger.get("chgerType").toString());
			list.setStat(charger.get("stat").toString());
			list.setStat_UpdDt(charger.get("statUpdDt").toString());
			list.setLast_Tsdt(charger.get("lastTsdt").toString());
			list.setLast_Tedt(charger.get("lastTedt").toString());
			list.setNow_Tsdt(charger.get("nowTsdt").toString());
			
			String output = charger.get("output").toString();
			String type = charger.get("chgerType").toString();
			
			if (output.isBlank()) { //출력값 없을 경우
				switch (type) {
				case "01":
					output = "100";
					break;
				case "02":
					output = "7";
					break;
				case "03":
					output = "50";
					break;
				case "04":
					output = "100";
					break;
				case "05":
					output = "50";
					break;
				case "06":
					output = "50";
					break;
				default:
					output = "40";
					break;
				}
			}
			
			list.setOutput(output);
			list.setMethod(charger.get("method").toString());
			list.setDelYn(charger.get("delYn").toString());
			list.setDel_detail(charger.get("delDetail").toString());
			
			chargerList.add(list);
			
		}

		return chargerList;
	}
		

}
