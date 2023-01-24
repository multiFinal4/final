package com.project.map;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.charger.ChargerDTO;
import com.project.charger.ChargerService;
import com.project.station.StationDTO;
import com.project.station.StationService;

@Controller
public class MapController {
	MapService service;
	StationService stationService;
	ChargerService chargerService;
	MapAPIPull mapAPIPull;
	
	public MapController() {}
	@Autowired
	public MapController(MapService service, StationService stationService, ChargerService chargerService,
			MapAPIPull mapAPIPull) {
		super();
		this.service = service;
		this.stationService = stationService;
		this.chargerService = chargerService;
		this.mapAPIPull = mapAPIPull;
	}
	

	@RequestMapping("/map")
	public ModelAndView list(String myLat, String myLong) {
		ModelAndView mv = new ModelAndView("map/main");
		List<StationDTO> stationList = stationService.stationList();
		List<String> companyList = new ArrayList<>();
		List<StationDTO> myLocList = new ArrayList<>();

		// 메인에서 클릭한 위치 주변 보여주기
		if (myLat != null) {
			for (StationDTO item : stationList) {

				double cx = Double.parseDouble(myLat);
				double cy = Double.parseDouble(myLong);
				double r = 0.019;
				double x = Double.parseDouble(item.getMap_latitude());
				double y = Double.parseDouble(item.getMap_longtude());
				
				if((cx-x)*(cx-x) + (cy-y)*(cy-y) <= r*r) {
					myLocList.add(item);
				}
			}
			stationList = myLocList;
		}
		
		// 검색한 리스트에서 충전소운영기관 목록 받기
		for(StationDTO item :stationList){
	        String comName = item.getStation_company();
	        if(!companyList.contains(comName)) {
	        	companyList.add(comName);
	        }
	    }

		System.out.println(myLat+","+myLong);
		mv.addObject("myLat",myLat);
		mv.addObject("myLong",myLong);
		
		mv.addObject("stationList", stationList);
		mv.addObject("listCount", stationList.size());
		mv.addObject("companyList", companyList);
		mv.addObject("category","all");
		mv.addObject("lat",stationList.get(0).getMap_latitude());
		mv.addObject("longt",stationList.get(0).getMap_longtude());

		
		return mv;
	}

	// ajax로 충전소 정보 확인하기
	@RequestMapping(value = "/ajax/mapStation", produces = "application/json;charset=utf-8")
	@ResponseBody
	public MapStationDTO stationInfo(String stationId, Model model){
		MapStationDTO stationInfo = service.mapStationList(stationId);
		model.addAttribute("info", stationInfo);
		return stationInfo;
	}

	// 충전소 검색하기
	@RequestMapping("/map/search.do")
	public ModelAndView search(String category,String keyword, String park, String type) {
		ModelAndView mv = new ModelAndView("map/main");
		List<MapStationDTO> stationList = service.search(category, keyword);
		List<String> companyList = new ArrayList<String>();
		
		if (stationList.size() == 0) {
			stationList = service.mapStationList();
			mv.addObject("noResult", "0");
		} 		
		// 검색한 리스트에서 충전소운영기관 목록 받기
		for(MapStationDTO item :stationList){
	        String comName = item.getStation_company();
	        if(!companyList.contains(comName)) {
	        	companyList.add(comName);
	        }
	    }

		mv.addObject("stationList", stationList);
		mv.addObject("category",category);
		mv.addObject("companyList", companyList);
		mv.addObject("keyword",keyword);
		mv.addObject("lat",stationList.get(0).getMap_latitude());
		mv.addObject("longt",stationList.get(0).getMap_longtude());
		return mv;
	}
	

	// ajax로 충전소 정보 검색하기(체크박스)
	@RequestMapping(value = "/ajax/map/search.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<MapStationDTO> chckList(String category,String keyword, String park, String quick, String standard, String company, String stFilter) {
		List<MapStationDTO> stationList;
		List<ChargerDTO> chargerList;
		if (category == null || keyword == null) {
			stationList = service.mapStationList();
		}
		else {
			stationList = service.search(category, keyword);
		}
		List<MapStationDTO> comSelectStation = new ArrayList<MapStationDTO>();
		if (!company.equals("all")) {
			for (MapStationDTO item : stationList) {
				String comName = item.getStation_company();
				if(comName.equals(company)) {
					comSelectStation.add(item);  
		        } 
			}
			stationList = comSelectStation;
		}
		List<MapStationDTO> resultListParkY = new ArrayList<>(); // 주차여부 검색
		List<String> distinctIdQuick = new ArrayList<String>(); // 급속충전소 아이디만 중복제거 담기
		List<String> distinctIdStd = new ArrayList<String>(); // 급속충전소 아이디만 중복제거 담기
		List<ChargerDTO> chrgrTypeQuick = new ArrayList<>();  // 급속충전기 여부
		List<ChargerDTO> chrgrTypeStD = new ArrayList<>();  // 완속충전기 여부
		List<MapStationDTO> resultTypeQuick = new ArrayList<>(); // 급속충전기 보유 충전소 리스트
		List<MapStationDTO> resultTypeStd = new ArrayList<>(); // 완속충전기 보유 충전소 리스트
		
		

		List<MapStationDTO> resultList = new ArrayList<>(); // 급속+주차 or 완속 + 주자 보유 충전소 리스트
		
		// 충전타입(01:DC차데모,	02: AC완속,	03: DC차데모+AC3상,04: DC콤보,05: DC차데모+DC콤보,06: DC차데모+AC3상+DC콤보,	07: AC3상)
		// 01, 04 : 급속
		// 02, 07 : 완속
		// 03, 05, 06 : 둘 다 포함
		
		
		chargerList = chargerService.chargerList();
		
		// 충전기 급속/ 완속 분류
		for(ChargerDTO item :chargerList) {
			String chrgrType = item.getCharger_type();
			if (!chrgrType.equals("02") && !chrgrType.equals("07")) { // 완속 거르기
				chrgrTypeQuick.add(item);
			} 
			else if (!chrgrType.equals("01") && !chrgrType.equals("04")) { // 급속 거르기
				chrgrTypeStD.add(item);
			} 
		}
		for(ChargerDTO item :chrgrTypeQuick) { // 완속 거른 충전기 충전소 중복 제거
			String statId = item.getStation_id();
			if(!distinctIdQuick.contains(statId)) {
				distinctIdQuick.add(statId);  
	        } 
		}
		for(ChargerDTO item :chrgrTypeStD) { // 급속 거른 충전기 충전소 중복 제거
			String statId = item.getStation_id();
			if(!distinctIdStd.contains(statId)) {
				distinctIdStd.add(statId);  
	        } 
		}
		
		// 급속충전기 있는 충전소
		for(MapStationDTO item :stationList) {
			String statId = item.getStation_id();
			if(distinctIdQuick.contains(statId)) {
	        	resultTypeQuick.add(item);
	        } 
		}

		// 완속충전기 있는 충전소
		for(MapStationDTO item :stationList) {
			String statId = item.getStation_id();
			if(distinctIdStd.contains(statId)) {
				resultTypeStd.add(item);
	        } 
		}
		
		// 주차무료 충전소
		for(MapStationDTO item :stationList) {
			String parkType = item.getParking_free();
			if (parkType.equals("Y")) {
				resultListParkY.add(item);
			} 
		}

		/* 다중체크 */
		
		// 주차 + 급속
		if (park.equals("Y") && quick.equals("Y")) {
			for(MapStationDTO item :resultTypeQuick) {
				String parkType = item.getParking_free();
				if (parkType.equals("Y")) {
					resultList.add(item);
				} 
			}
			return resultList;
		}
		// 주차 + 완속
		else if (park.equals("Y") && standard.equals("Y")) {
			for(MapStationDTO item :resultTypeStd) {
				String parkType = item.getParking_free();
				if (parkType.equals("Y")) {
					resultList.add(item);
				} 
			}
			return resultList;
		}
		// 주차 + 급속 + 완속 -> 주차되는 충전소와 동일
		else if (park.equals("Y") && quick.equals("Y") && standard.equals("Y")) {
			return resultListParkY;
		}
		
		/* 단일체크 */
		
		// 주차체크
		if (park.equals("Y")) {
			return resultListParkY;
		}
		// 급속체크
		else if (quick.equals("Y")) {
			return resultTypeQuick;
		}
		// 완속체크
		else if (standard.equals("Y")) {
			return resultTypeStd;
		}
		else{
			return stationList;
		}
		
		
		
		
		
	}
}
