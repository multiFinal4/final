package com.project.airquality;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.station.StationDTO;
import com.project.station.StationService;
import com.project.weather.WeatherUtil;


@Controller
public class AirqualityController {
	AirqualityAPIPull pull;
	StationService stationservice;
	AirqualityService airqualityService;
	
	@Autowired
	public AirqualityController(AirqualityAPIPull pull, StationService stationservice,
			AirqualityService airqualityService) {
		super();
		this.pull = pull;
		this.stationservice = stationservice;
		this.airqualityService = airqualityService;
	}
	
	@RequestMapping("/airquality/getlist.do")
	public String getAirqualityList(String stationId, Model model) {
		List<AirqualityDTO> dustList = airqualityService.airqualityList(stationId);
		//메뉴관리를 위한 변수 state
		String state = "weather";
		model.addAttribute("state", state);
		model.addAttribute("dustList", dustList);
		model.addAttribute("stationId",stationId);
		return "monitoring/airquality";
	}

//	@RequestMapping("/airquality/getAirqualityData.do")
//	public String AirqualityAllData(Model model) throws IOException{
//		WeatherUtil util = new WeatherUtil();    
//        String base_time = util.getTime(); // 발표 시간
//        String base_date = "";
//        if(LocalTime.now().getHour()<2 || LocalTime.now().getMinute()<10) {
//        	base_date = util.getDate(LocalDate.now().minusDays(1), "yyyyMMdd"); // 발표 날짜 
//        }else {
//        	base_date = util.getDate(LocalDate.now(), "yyyyMMdd"); // 발표 날짜 
//        }
//        
//        List<StationDTO> stationlist = stationservice.stationList();
//        String station_id = "";
//        for(int i=0; i<stationlist.size();i++) {
//        	station_id = stationlist.get(i).getStation_id();
//        	StationDTO stationInfo = stationservice.read(station_id); //충전소 위치 정보 받아오기
//            String code = "1"; // 0 (격자->위경도), 1 (위경도->격자)
//            String location_name = stationInfo.getAddr_sigun()+" "+stationInfo.getAddr_detail(); // 주소 시군구+읍면동
//             //위경도 -> 격자값 변환 127.08453333333333	37.535738888888886
//            
//            String[] nxny = util.changenxny(new String[]{"", code, stationInfo.getMap_longtude(),stationInfo.getMap_latitude()});
//            	String nx = nxny[0];	/*예보지점의 X 좌표값*/
//            	String ny = nxny[1]; 	/*예보지점의 Y 좌표값*/
//            WeatherAPIDTO dto = new WeatherAPIDTO(base_date, base_time, nx, ny);
//             //api호출, json값 받음
//            String result = pull.getAPIData(dto);
//            weatherService.delete(station_id);
//     		List<AirqualityDTO> dustList = pull.DataSave(result, station_id, location_name);
//     		for (int j = 0; j < dustList.size(); j++) {
//     			dustList.get(j).setWeatherrow(j+1);
//     			weatherService.insert(dustList.get(j));
//     		}
//     		
//        }
//	}
	
	
//	@RequestMapping("/test")
//	public String test(AirqualityDTO dto) throws IOException {
//		String result = pull.GetAPIDataDust(dto);
//		return result;
//	}
}
