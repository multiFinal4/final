package com.project.station;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.map.MapAPIPull;

@Service
public class StationAPIPull{
	
	private MapAPIPull mapAPIPull;
	
	@Autowired
	public StationAPIPull(MapAPIPull mapAPIPull) {
		super();
		this.mapAPIPull = mapAPIPull;
	}


	public List<StationDTO> stationList() throws Exception{
		List<Map<String, Object>> itemList = mapAPIPull.stationAPI();
		List<Map<String,Object>> distinctList = new ArrayList<Map<String,Object>>(); // 중복제거된 리스트
	    List<String> distinctId = new ArrayList<String>(); // 충전소 ID 리스트
	    List<StationDTO> stationList = new ArrayList<StationDTO>(); // 최종 넘겨질 충전소리스트 JSON  
	    List<String> chargerCount = new ArrayList<String>(); // 충전소별 충전기 갯수 구하는 배열
	    
	    
	    
	    // 충전기 정보
	    for(Map<String, Object> item :itemList)
	    {
	        String statId = (String)item.get("statId");
	    	chargerCount.add(statId); // 충전소 아이디만 중복허용 담기
	        if(!distinctId.contains(statId)) {
	        	distinctId.add(statId);  // 충전소 아이디만 중복제거 담기
	        	distinctList.add(item);// 중복 데이터 제거된 리스트 다시 담기
	        }
	    }
	    
	    
	    // 충전소 리스트 추가 (충전소ID 중복제거된 데이터)
	    String addr = "";
	    for (Map<String, Object> item : distinctList) {
	    	addr = item.get("addr").toString();
			String[] addrArr = addr.split(" ",3);
	        StationDTO list = new StationDTO();
	      	list.setStation_id(item.get("statId").toString());
	      	list.setStation_name(item.get("statNm").toString().trim());
	      	list.setAddr_do(addrArr[0]);
	      	list.setAddr_sigun(addrArr[1]);
	  		if (item.get("location").toString().equals("null")) {
	  			list.setAddr_detail(addrArr[2]);
			}
	  		else {
	  			list.setAddr_detail(addrArr[2] + " " + item.get("location").toString());
			}
	      	list.setStation_company(item.get("bnm").toString());
	      	list.setBusi_call(item.get("busiCall").toString());
	      	list.setManager_id("EV001");
	      	list.setService_date("2022/12/31");

		    int aFrequency = Collections.frequency(chargerCount, item.get("statId").toString()); // 충전소 ID중복 횟수로 충전기 갯수 입력
	      	list.setCharger_no(aFrequency);
	      	list.setKind(item.get("kind").toString());
	      	list.setMap_code(item.get("zscode").toString());
	      	list.setMap_latitude(item.get("lat").toString());
	      	list.setMap_longtude(item.get("lng").toString());
	      	list.setUse_time(item.get("useTime").toString());
	      	list.setParking_free(item.get("parkingFree").toString());
	      	list.setNote(item.get("note").toString());
	      	list.setLimitYn(item.get("limitYn").toString());
	      	list.setLimit_detail(item.get("limitDetail").toString());
	      	list.setTrafficYn(item.get("trafficYn").toString());
	      	stationList.add(list);
	      	
		}

		return stationList;
	}

}
