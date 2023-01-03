package com.project.map;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.station.StationDTO;

@Service
public class MapAPIPull {
	public List<StationDTO> stationList() throws IOException{
		 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552584/EvCharger/getChargerInfo"); /*URL*/
	        urlBuilder.append("?serviceKey=cZV1q75xcpjSPd3lN4EwPkRZKrcqrgXOD3UDR%2F1yletcEpNhUYfAOuzOepjx5RbJ3gFP1fG7WWdKZo5ywuDfUQ%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("500", "UTF-8")); /*한 페이지 결과 수*/
	        //urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("80", "UTF-8")); /*페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("zcode","UTF-8") + "=" + URLEncoder.encode("50", "UTF-8")); /*지역구분 코드*/
	        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*데이터타입*/

	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader bf;
	        
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	        	bf = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	        	bf = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        
	        StringBuilder sb = new StringBuilder();
	        String line;
	        
	        while ((line = bf.readLine()) != null) {
	            sb.append(line);
	        }
	        
	        // json 파싱
	        ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> map = new HashMap<String, Object>();
            map= objectMapper.readValue(sb.toString(),  new TypeReference <Map<String,Object>>(){});

            String totalCount = String.valueOf(map.get("totalCount"));
            System.out.println(totalCount);
            Map<String, Object> items = (Map<String, Object>) map.get("items");
            List<Map<String, Object>> itemList =  (List<Map<String, Object>>) items.get("item"); // 원본값 있던 리스트
            List<Map<String,Object>> distinctList = new ArrayList<Map<String,Object>>(); // 중복제거된 리스트
            List<String> distinctId = new ArrayList<String>(); // 충전소 ID 리스트 중복확인
            
            List<StationDTO> stationList = new ArrayList<StationDTO>();
            
            // 중복 데이터 제거
            for(Map<String, Object> item :itemList)
            {
	            String a = (String)item.get("statId");
	            if(!distinctId.contains(a)) {
	            	distinctId.add(a);
	            	distinctList.add(item);
	            }
            }
            
            // 리스트 추가
            String addr = "";
            for (Map<String, Object> item : distinctList) {
            	addr = item.get("addr").toString();
				String[] addrArr = addr.split(" ",3);
	            StationDTO list = new StationDTO();
	          	list.setStation_id(item.get("statId").toString());
	          	list.setStation_name(item.get("statNm").toString().trim());
	          	list.setAddr_do(addrArr[0]);
	          	list.setAddr_sigun(addrArr[1]);
	          	try {
	          		if (item.get("location").toString() == null) {
	          			list.setAddr_detail(addrArr[2]);
					}
				  	list.setAddr_detail(addrArr[2] + " " + item.get("location").toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
	          	list.setStation_company(item.get("bnm").toString());
	          	list.setManager_id("EV001");
	          	list.setService_date("2022/12/31");
	          	stationList.add(list);
			}

        	System.out.println(stationList);
            System.out.println(distinctId.size());
            System.out.println(distinctList.size());
            bf.close();
            conn.disconnect();
            

			return stationList;
            
	}

      
}
