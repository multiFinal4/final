package com.project.weather;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;
import org.springframework.web.filter.ShallowEtagHeaderFilter;
@Service
public class WeatherAPIPull {

	public String getAPIData(WeatherAPIDTO dto) throws IOException  {
		String baseURL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"; /*URL*/
        String ServiceKey = "B35yFEIlrauOO3JQDnm6glct7e2T9VGHZICX9W6GhFLnaMGZVcJYiFOrF5KFrNG4r4oPNz8Kqn8gdo70S%2BypUA%3D%3D";
        String pageNo = "1"; /*페이지번호*/
        String numOfRows = "1000"; /*한 페이지 결과 수*/
        String dataType = "JSON"; /*요청자료형식(XML/JSON) Default: XML*/
        String detailURL = 	"?serviceKey=" +  ServiceKey + 
        					"&pageNo=" + pageNo +	
        					"&numOfRows=" + numOfRows +	
        					"&dataType=" + dataType +	
        					"&base_date=" + dto.getBase_date() +	
        					"&base_time=" + dto.getBase_time() +	
        					"&nx=" + dto.getNx() +	
        					"&ny=" + dto.getNy(); 
       
        URL url = new URL(baseURL + detailURL);
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
	
	public List<WeatherDTO>  DataSave(String result, String location_no, String location_name)  {
		// Json parser를 만들어 만들어진 문자열 데이터를 객체화
		List<WeatherDTO> weatherList = new ArrayList<WeatherDTO>();
		WeatherDTO weather = new WeatherDTO(location_no,location_name);
		JSONParser parser = new JSONParser();
		JSONObject obj;
		try {
			obj = (JSONObject) parser.parse(result);
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
			String time = ((JSONObject) parse_item.get(0)).get("fcstTime").toString();
			for (int i = 0; i < parse_item.size(); i++) {
				
				data = (JSONObject) parse_item.get(i);
				Object fcstValue = data.get("fcstValue");
				Object fcstDate = data.get("fcstDate");
				Object fcstTime = data.get("fcstTime");
				if(!time.equals(fcstTime.toString())) {
					if(weather.getTmn()==null) {
						weather.setTmn("없음");
					}
					if(weather.getTmx()==null) {
						weather.setTmx("없음");
					}
					if(weather.getTmp()==null) {
						weather.setTmp("없음");
					}
					if(weather.getPop()==null) {
						weather.setPop("없음");
					}
					weatherList.add(weather);
					weather = new WeatherDTO(location_no,location_name);
					day = fcstDate.toString();
					time = fcstTime.toString();
				}
				// double형으로 받고싶으면 아래내용 주석 해제
				// double fcstValue = Double.parseDouble(weather.get("fcstValue").toString());
				category = (String) data.get("category");
				weather.setTime(time);
				weather.setDay(day);
				if (category.equals("TMN")) {
					weather.setTmn((String)fcstValue);
				}else if(category.equals("TMX")) {
					weather.setTmx((String)fcstValue);
				}else if(category.equals("SKY")) {
					weather.setSky((String)fcstValue);
				}else if(category.equals("POP")) {
					weather.setPop((String)fcstValue);
				}else if(category.equals("TMP")) {
					weather.setTmp((String)fcstValue);
				}
				// 출력
				if (!day.equals(fcstDate.toString())) {
					day = fcstDate.toString();
				}
				if (!time.equals(fcstTime.toString())) {
					time = fcstTime.toString();
					System.out.println(day + "  " + time);
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return weatherList;
    }
	
}