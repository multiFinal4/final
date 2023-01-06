package com.project.weather;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.station.StationDTO;
import com.project.station.StationService;
@Controller
public class WeatherController {
	ChangeNxNy change;
	WeatherAPIPull pull;
	StationService stationservice;
	WeatherService weatherService;	
	@Autowired
	public WeatherController(ChangeNxNy change, WeatherAPIPull pull, StationService stationservice,
			WeatherService weatherService) {
		super();
		this.change = change;
		this.pull = pull;
		this.stationservice = stationservice;
		this.weatherService = weatherService;
	}

	@RequestMapping("/weather/getData.do")
	public String WeathergetData(StationDTO station, Model model) throws IOException{
	        String base_date = getDate(); // 발표 날짜 
	        String base_time = getTime(); // 발표 시간
	        station.setStation_id("BNJG3401");
	        StationDTO stationInfo = stationservice.read(station.getStation_id()); //충전소 위치 정보 받아오기
	        String code = "1"; // 0 (격자->위경도), 1 (위경도->격자)
	        String location_no = stationInfo.getMap_code(); //지역구분 상세
	        String location_name = stationInfo.getAddr_sigun()+" "+stationInfo.getAddr_detail(); // 주소 시군구+읍면동
	        //위경도 -> 격자값 변환 127.08453333333333	37.535738888888886

	        String[] nxny = change.changenxny(new String[]{"", code, stationInfo.getMap_longtude(),stationInfo.getMap_latitude()});
	       	String nx = nxny[0];	/*예보지점의 X 좌표값*/
	       	String ny = nxny[1]; 	/*예보지점의 Y 좌표값*/
	        WeatherAPIDTO dto = new WeatherAPIDTO(base_date, base_time, nx, ny);
	        //api호출, json값 받음
	        String result = pull.getAPIData(dto);
			List<WeatherDTO> weatherList = pull.DataSave(result, location_no, location_name);
			for (int i = 0; i < weatherList.size(); i++) {
				weatherService.insert(weatherList.get(i));
				System.out.println(weatherList.get(i));
			}
			model.addAttribute("weatherList", weatherList);
			return "monitoring/weather";
	}
	
	public String getDate() {
        LocalDate now = LocalDate.now();	// 현재 날짜 구하기
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");   // 포맷 정의
        String formatedNow = now.format(formatter);    // 포맷 적용
		System.out.println(formatedNow); // 2021-12-02
		return formatedNow;
	}
	
	//Base_time : 0200, 0500, 0800, 1100, 1400, 1700, 2000, 2300 (1일 8회)
	//- API 제공 시간(~이후) : 02:10, 05:10, 08:10, 11:10, 14:10, 17:10, 20:10, 23:10
	public String getTime() {
		
        LocalTime now = LocalTime.now();	// 현재 날짜 구하기
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmm");   // 포맷 정의
        String formatedNow = now.format(formatter);    // 포맷 적용
        String baseTime = "";
        if(Integer.parseInt(formatedNow)>2310) {
        	baseTime = "2300";
        }else if(Integer.parseInt(formatedNow)>2010) {
        	baseTime = "2000";
        }else if(Integer.parseInt(formatedNow)>1710) {
        	baseTime = "1700";
        }else if(Integer.parseInt(formatedNow)>1410) {
        	baseTime = "1400";
        }else if(Integer.parseInt(formatedNow)>1110) {
        	baseTime = "1100";
        }else if(Integer.parseInt(formatedNow)>810) {
        	baseTime = "0800";
        }else if(Integer.parseInt(formatedNow)>510) {
        	baseTime = "0500";
        }else if(Integer.parseInt(formatedNow)>210) {
        	baseTime = "0200";
        }else {
        	baseTime = "2300";
        }
		return baseTime;
	}
}
