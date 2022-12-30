package com.project.weather;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class WeatherAPIPull {
	
	public String getAPIData(WeatherAPIDTO dto) throws IOException  {
        String detailURL = 	"?serviceKey=" +  dto.getServiceKey() + 
        					"&pageNo=" + dto.getPageNo() +	
        					"&numOfRows=" + dto.getNumOfRows() +	
        					"&dataType=" + dto.getDataType() +	
        					"&base_date=" + dto.getBase_date() +	
        					"&base_time=" + dto.getBase_time() +	
        					"&nx=" + dto.getNx() +	
        					"&ny=" + dto.getNy(); 
       
        URL url = new URL(dto.getBaseURL() + detailURL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        return sb.toString();
	}
	
	public WeatherDTO DataSave(String result) throws ParseException {
		// Json parser를 만들어 만들어진 문자열 데이터를 객체화
		WeatherDTO weather = new WeatherDTO();
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(result);
		// response 키를 가지고 데이터를 파싱
		JSONObject parse_response = (JSONObject) obj.get("response");
		// response 로 부터 body 찾기
		JSONObject parse_body = (JSONObject) parse_response.get("body");
		// body 로 부터 items 찾기
		JSONObject parse_items = (JSONObject) parse_body.get("items");

		// items로 부터 itemlist 를 받기
		JSONArray parse_item = (JSONArray) parse_items.get("item");
		String category;
		JSONObject data; // parse_item은 배열형태이기 때문에 하나씩 데이터를 하나씩 가져올때 사용
		// 카테고리와 값만 받아오기
		String day = "";
		String time = "";
		for (int i = 0; i < parse_item.size(); i++) {
			data = (JSONObject) parse_item.get(i);
			Object fcstValue = data.get("fcstValue");
			Object fcstDate = data.get("fcstDate");
			Object fcstTime = data.get("fcstTime");
			// double형으로 받고싶으면 아래내용 주석 해제
			// double fcstValue = Double.parseDouble(weather.get("fcstValue").toString());
			category = (String) data.get("category");
			// 출력
			if (!day.equals(fcstDate.toString())) {
				day = fcstDate.toString();
			}
			if (!time.equals(fcstTime.toString())) {
				time = fcstTime.toString();
				System.out.println(day + "  " + time);
			}
			System.out.print("\tcategory : " + category);
			System.out.print(", fcst_Value : " + fcstValue);
			System.out.print(", fcstDate : " + fcstDate);
			System.out.println(", fcstTime : " + fcstTime);
			
			
			
			
		}

		return weather;
    }
	
}