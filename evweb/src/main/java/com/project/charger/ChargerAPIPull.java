package com.project.charger;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.map.MapAPIPull;

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
		String chgerType;
		String chgerStat;
		
		for (Map<String, Object> charger : itemList) {
			
			ChargerDTO list = new ChargerDTO();
			
			list.setStation_id(charger.get("statId").toString());
			list.setCharger_id(charger.get("chgerId").toString());
			
			// 충전기타입(01:DC차데모,	02: AC완속,	03: DC차데모+AC3상,04: DC콤보,05: DC차데모+DC콤보,06: DC차데모+AC3상	+DC콤보,	07: AC3상)
			chgerType = charger.get("chgerType").toString();
			switch (chgerType) {
			case "01":
				chgerType = "DC차데모";
				break;
			case "02":
				chgerType = "AC완속";
				break;
			case "03":
				chgerType = "DC차데모+AC3상";
				break;
			case "04":
				chgerType = "DC콤보";
				break;
			case "05":
				chgerType = "DC차데모+DC콤보";
				break;
			case "06":
				chgerType = "DC차데모+AC3상";
				break;
			default:
				chgerType = "AC3상";
				break;
			}
			list.setCharger_type(chgerType);
			
			// 충전기상태 (1: 통신이상, 2: 충전대기,3: 충전중, 4: 운영중지,5: 점검중, 9: 상태미확인)
			chgerStat = charger.get("stat").toString();
			switch (chgerStat) {
			case "1":
				chgerStat = "통신이상";
				break;
			case "2":
				chgerStat = "충전대기";
				break;
			case "3":
				chgerStat = "충전중";
				break;
			case "4":
				chgerStat = "운영중지";
				break;
			case "5":
				chgerStat = "점검중";
				break;
			default:
				chgerStat = "상태미확인";
				break;
			}
			list.setStat(chgerStat);
			
			list.setStat_UpdDt(charger.get("statUpdDt").toString());
			list.setLast_Tsdt(charger.get("lastTsdt").toString());
			list.setLast_Tedt(charger.get("lastTedt").toString());
			list.setNow_Tsdt(charger.get("nowTsdt").toString());
			list.setOutput(charger.get("output").toString());
			list.setMethod(charger.get("method").toString());
			list.setDelYn(charger.get("delYn").toString());
			list.setDel_detail(charger.get("delDetail").toString());
			
			chargerList.add(list);
			
		}

		return chargerList;
	}
		

}
