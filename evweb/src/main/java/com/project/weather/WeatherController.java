package com.project.weather;

import java.io.IOException;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;

public class WeatherController {
	WeatherAPIPull pull;
	
	
	public void WeatergetData() throws IOException, ParseException{
		 	String baseURL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"; /*URL*/
	        String ServiceKey = "B35yFEIlrauOO3JQDnm6glct7e2T9VGHZICX9W6GhFLnaMGZVcJYiFOrF5KFrNG4r4oPNz8Kqn8gdo70S%2BypUA%3D%3D";
	        String pageNo = "1"; /*페이지번호*/
	        String numOfRows = "30"; /*한 페이지 결과 수*/
	        String dataType = "JSON"; /*요청자료형식(XML/JSON) Default: XML*/
	        String base_date = "20221228";  /*‘21년 6월 28일발표*/
	        String base_time = "0500"; /*05시 발표*/
	        String nx = "55";	/*예보지점의 X 좌표값*/
	        String ny = "127"; 	/*예보지점의 Y 좌표값*/
	        WeatherAPIDTO dto = new WeatherAPIDTO(baseURL, ServiceKey, pageNo, numOfRows, dataType, base_date, base_time, nx, ny);      
	        String result = pull.getAPIData(dto);
	        WeatherDTO weather = pull.DataSave(result);
	        
	}
}
