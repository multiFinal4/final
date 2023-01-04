package com.project.map;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class MapAPIPull {
	public List<Map<String, Object>> stationAPI() throws Exception{
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
	        //System.out.println("Response code: " + conn.getResponseCode());
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

            //String totalCount = String.valueOf(map.get("totalCount"));
            Map<String, Object> items = (Map<String, Object>) map.get("items");
            List<Map<String, Object>> itemList =  (List<Map<String, Object>>) items.get("item"); // 원본값 있던 리스트

    	    bf.close();
    	    conn.disconnect();
			return itemList;
            
	}

      
}
