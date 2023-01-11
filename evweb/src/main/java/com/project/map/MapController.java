package com.project.map;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.charger.ChargerService;
import com.project.manager.ManagerDTO;
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
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("map/main");
		List<StationDTO> stationList = stationService.stationList();
		List<String> companyList = new ArrayList<>();
		
		// 검색한 리스트에서 충전소운영기관 목록 받기
		for(StationDTO item :stationList){
	        String comName = item.getStation_company();
	        if(!companyList.contains(comName)) {
	        	companyList.add(comName);
	        }
	    }
		
		mv.addObject("stationList", stationList);
		mv.addObject("listCount", stationList.size());
		mv.addObject("companyList", companyList);
		mv.addObject("category","all");
		return mv;
	}

	// ajax로 충전소 정보 확인하기
	@RequestMapping(value = "/ajax/mapStation", produces = "application/json;charset=utf-8")
	@ResponseBody
	public StationDTO stationInfo(String stationId, Model model){
		StationDTO stationInfo = stationService.read(stationId);
		model.addAttribute("info", stationInfo);
		return stationInfo;
	}

	// 충전소 검색하기
	@RequestMapping("/map/search.do")
	public ModelAndView search(String category,String keyword, String park, String type) {
		ModelAndView mv = new ModelAndView("map/main");
		List<StationDTO> stationList = service.search(category, keyword);
		List<String> companyList = new ArrayList<String>();
		
		List<StationDTO> resultListParkY = new ArrayList<>();// 주차여부 검색
		
		for(StationDTO item :stationList) {
			String parkType = item.getParking_free();
			if (parkType.equals("Y")) {
				resultListParkY.add(item);
			} 
		}
		
		// 검색한 리스트에서 충전소운영기관 목록 받기
		for(StationDTO item :stationList){
	        String comName = item.getStation_company();
	        if(!companyList.contains(comName)) {
	        	companyList.add(comName);
	        }
	    }

		mv.addObject("stationList", stationList);
		mv.addObject("category",category);
		mv.addObject("companyList", companyList);
		mv.addObject("keyword",keyword);
		return mv;
	}
	

	// ajax로 충전소 정보 검색하기(체크박스)
	@RequestMapping(value = "/ajax/map/search.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<StationDTO> chckList(String category,String keyword, String park, String type) {
		List<StationDTO> stationList;
		if (category == null || keyword == null) {
			stationList = stationService.stationList();
		}
		else {
			stationList = service.search(category, keyword);
		}
		
		
		List<StationDTO> resultListParkY = new ArrayList<>();// 주차여부 검색
		
		for(StationDTO item :stationList) {
			String parkType = item.getParking_free();
			if (parkType.equals("Y")) {
				resultListParkY.add(item);
			} 
		}
		if (park.equals("Y")) {
			System.out.println(resultListParkY.size()); 
			return resultListParkY;
		}
		else {

			System.out.println(stationList.size()); 
			return stationList;
		}
		
	}
}
