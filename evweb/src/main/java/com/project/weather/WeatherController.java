package com.project.weather;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.airquality.AirqualityDTO;
import com.project.airquality.AirqualityService;
import com.project.station.StationDTO;
import com.project.station.StationService;
@Controller
public class WeatherController {
	WeatherAPIPull pull;
	StationService stationservice;
	WeatherService weatherService;	
	AirqualityService airqualityService;
	
	
	@Autowired
	public WeatherController(WeatherAPIPull pull, StationService stationservice, WeatherService weatherService,
			AirqualityService airqualityService) {
		super();
		this.pull = pull;
		this.stationservice = stationservice;
		this.weatherService = weatherService;
		this.airqualityService = airqualityService;
	}
	
	@RequestMapping("/weather/getlist.do")
	public String getWeatherList(String stationId, Model model) {
		if(stationId.equals("all")){
			stationId = "BNJG3401";
		}
		WeatherUtil util = new WeatherUtil();
		StationDTO stationInfo = stationservice.read(stationId); //충전소 위치 정보 받아오기
		List<StationDTO> stationList = stationservice.stationList(); //충전소 위치 정보 받아오기
		String code = "1"; // 0 (격자->위경도), 1 (위경도->격자)
		String[] nxny = util.changenxny(new String[]{"", code, stationInfo.getMap_longtude(),stationInfo.getMap_latitude()});
	    String nx = nxny[0];	/*예보지점의 X 좌표값*/
	    String ny = nxny[1]; 	/*예보지점의 Y 좌표값*/
	    List<WeatherDTO> weatherList = weatherService.readList(nx,ny);
	    // System.out.println(weatherList);
		String tmx  =  util.getTmx(weatherList, util.getDate(LocalDate.now() ,"yyyy-MM-dd"));
		if(tmx.equals("-")) {
			tmx = util.getTmx(weatherList, util.getDate(LocalDate.now().plusDays(1) ,"yyyy-MM-dd"));
		}
		//메뉴관리를 위한 변수 state
		String state = "weather";
		model.addAttribute("state", state);
		model.addAttribute("stationlist", stationList);
		model.addAttribute("station", stationInfo);
		model.addAttribute("weatherList", weatherList);
		model.addAttribute("tmx",tmx);
		model.addAttribute("stationId",stationId);
		
		List<AirqualityDTO> airqualityInfo  = airqualityService.allReadList();
		model.addAttribute("airqualityInfo",airqualityInfo);
		// System.out.println("미세먼지정보리스트"+airqualityInfo);
		
		return "monitoring/weather";
	}

	@RequestMapping("/weather/getData.do")
	public String WeathergetData(String stationId, String path,Model model) throws IOException{
		String view = "";
		if(path.equals("refresh")) {
			view = "redirect:/monitoring/main?stationId="+stationId;
		}else {
			view = "redirect:/weather/getlist.do?stationId="+stationId;
		}
    	WeatherUtil util = new WeatherUtil();    
        String base_time = util.getTime(); // 발표 시간
        String base_date = "";
        if(LocalTime.now().getHour()<2 || LocalTime.now().getMinute()<10) {
        	base_date = util.getDate(LocalDate.now().minusDays(1), "yyyyMMdd"); // 발표 날짜 
        }else {
        	base_date = util.getDate(LocalDate.now(), "yyyyMMdd"); // 발표 날짜 
        }
        
        StationDTO stationInfo = stationservice.read(stationId); //충전소 위치 정보 받아오기
        String code = "1"; // 0 (격자->위경도), 1 (위경도->격자)
        //String location_name = stationInfo.getAddr_sigun()+" "+stationInfo.getAddr_detail(); // 주소 시군구+읍면동
        //위경도 -> 격자값 변환 127.08453333333333	37.535738888888886

        String[] nxny = util.changenxny(new String[]{"", code, stationInfo.getMap_longtude(),stationInfo.getMap_latitude()});
       	String nx = nxny[0];	/*예보지점의 X 좌표값*/
       	String ny = nxny[1]; 	/*예보지점의 Y 좌표값*/
        WeatherAPIDTO dto = new WeatherAPIDTO(base_date, base_time, nx, ny);
        //api호출, json값 받음
        String result = pull.getAPIData(dto);
        weatherService.delete(nx, ny);
		List<WeatherDTO> weatherList = pull.DataSave(result, nx, ny);
		for (int i = 0; i < weatherList.size(); i++) {
			weatherList.get(i).setWeatherrow(i+1);
			weatherService.insert(weatherList.get(i));
		}
		return view;
	}
	
	@RequestMapping("/weather/getWeatherData.do")
	public String WeatherAllData(Model model) throws IOException{
    	WeatherUtil util = new WeatherUtil();    
        String base_time = util.getTime(); // 발표 시간
        String base_date = "";
        if(LocalTime.now().getHour()<2 || LocalTime.now().getMinute()<10) {
        	base_date = util.getDate(LocalDate.now().minusDays(1), "yyyyMMdd"); // 발표 날짜 
        }else {
        	base_date = util.getDate(LocalDate.now(), "yyyyMMdd"); // 발표 날짜 
        }
        String[] nx = {"48","49","50","51","52","53","53","54","46","47","48","49","50","51","52","53","54",
        			   "55","56","46","48","49","50","51","54","57","58","46","47","48","49","50","58","59",
        			   "47","48","49","50","51","52","53","54","55","58","48","49","50","51","52","53","54",
        			   "55","56","57","58","60","50","51","52","53","54","55","56","58","59","60","54","55",
        			   "56","57","58","59","52","48"};
        String[] ny = {"32","32","32","32","32","32","32","32","33","33","33","33","33","33","33","33","33",
        			   "33","33","34","34","34","34","34","34","34","34","35","35","35","35","35","35","35",
        			   "36","36","36","36","36","36","36","36","36","36","37","37","37","37","37","37","37",
        			   "37","37","37","37","37","38","38","38","38","38","38","38","38","38","38","39","39",
        			   "39","39","39","39","45","48"};
        for(int j=0; j<nx.length;j++) {
         	WeatherAPIDTO dto = new WeatherAPIDTO(base_date, base_time, nx[j], ny[j]);
         	//api호출, json값 받음
         	String result = pull.getAPIData(dto);
         	weatherService.delete(nx[j], ny[j]);
         	List<WeatherDTO> weatherList = pull.DataSave(result, nx[j], ny[j]);
         	for (int i = 0; i < weatherList.size(); i++) {
         		weatherList.get(i).setWeatherrow(i+1);
         		weatherService.insert(weatherList.get(i));
         	}
        }
		return "redirect:/admin/station/list?category=all&pageNo=1";
	}
	
	
	
}
