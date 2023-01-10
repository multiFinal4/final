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
	WeatherAPIPull pull;
	StationService stationservice;
	WeatherService weatherService;	
	@Autowired
	public WeatherController(WeatherAPIPull pull, StationService stationservice,
			WeatherService weatherService) {
		super();
		this.pull = pull;
		this.stationservice = stationservice;
		this.weatherService = weatherService;
	}
	@RequestMapping("/weather/getlist.do")
	public String getWeatherList(String station_id, Model model) {
		station_id = "BNJG3401";
		StationDTO stationInfo = stationservice.read(station_id); //충전소 위치 정보 받아오기
		List<WeatherDTO> weatherList = weatherService.readList(stationInfo.getMap_code());
		WeatherUtil util = new WeatherUtil();
		String tmx  =  util.getTmx(weatherList, util.getDate(LocalDate.now() ,"yyyy-MM-dd"));
		if(tmx.equals("-")) {
			tmx = util.getTmx(weatherList, util.getDate(LocalDate.now().plusDays(1) ,"yyyy-MM-dd"));
		}
		model.addAttribute("weatherList", weatherList);
		model.addAttribute("tmx",tmx);
		return "monitoring/weather";
	}
	
	@RequestMapping("/weather/getData.do")
	public String WeathergetData(StationDTO station, Model model) throws IOException{
    	WeatherUtil util = new WeatherUtil();    
        String base_time = util.getTime(); // 발표 시간
        String base_date = "";
        if(LocalTime.now().getHour()<2 || LocalTime.now().getMinute()<10) {
        	base_date = util.getDate(LocalDate.now().minusDays(1), "yyyyMMdd"); // 발표 날짜 
        }else {
        	base_date = util.getDate(LocalDate.now(), "yyyyMMdd"); // 발표 날짜 
        }
        
        station.setStation_id("BNJG3401");
        StationDTO stationInfo = stationservice.read(station.getStation_id()); //충전소 위치 정보 받아오기
        String code = "1"; // 0 (격자->위경도), 1 (위경도->격자)
        String location_no = stationInfo.getMap_code(); //지역구분 상세
        String location_name = stationInfo.getAddr_sigun()+" "+stationInfo.getAddr_detail(); // 주소 시군구+읍면동
        //위경도 -> 격자값 변환 127.08453333333333	37.535738888888886

        String[] nxny = util.changenxny(new String[]{"", code, stationInfo.getMap_longtude(),stationInfo.getMap_latitude()});
       	String nx = nxny[0];	/*예보지점의 X 좌표값*/
       	String ny = nxny[1]; 	/*예보지점의 Y 좌표값*/
        WeatherAPIDTO dto = new WeatherAPIDTO(base_date, base_time, nx, ny);
        //api호출, json값 받음
        String result = pull.getAPIData(dto);
        weatherService.delete(location_no);
		List<WeatherDTO> weatherList = pull.DataSave(result, location_no, location_name);
		for (int i = 0; i < weatherList.size(); i++) {
			weatherList.get(i).setWeatherrow(i+1);
			weatherService.insert(weatherList.get(i));
			System.out.println(weatherList.get(i));
		}
		return "redirect:/weather/getlist.do";
	}
	
}
