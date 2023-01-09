package com.project.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("map/main");
		List<StationDTO> stationList = stationService.stationList();
		List<StationDTO> companyList = stationService.companyList();
		mv.addObject("stationList", stationList);
		mv.addObject("listCount", stationList.size());
		mv.addObject("companyList", companyList);
		return mv;
	}
//	
//	@RequestMapping("/map/list")
//	public ModelAndView list(String category, String endNo, String pageNo){
//		ModelAndView mv = new ModelAndView("station/list");
//		List<StationDTO> stationlist = service.stationList();
//		
//		int showList = 10; // 리스트 보여줄 갯수
//		endNo = Integer.toString((Integer.parseInt(pageNo)*showList));
//		List<StationDTO> stationlistPage = service.stationListCate(category, endNo);
//		int endPage = 0; // 페이징 넘버 유동적으로 
//		if (category.equals("all")) {
//			if (stationlist.size() <= showList) {
//				endPage = 1;
//			}else {
//				endPage = (stationlist.size()/showList)+1;
//			}
//		}
//		else {
//			if (stationlistPage.size() <= showList) {
//				endPage = 1;
//			}else {
//
//				endPage = (stationlistPage.size()/showList)+1;
//			}
//		}
//		List<StationDTO> companyList = service.companyList();
//		
//		mv.addObject("stationlistPage", stationlistPage);
//		mv.addObject("stationlist", stationlist);
//		mv.addObject("companyList", companyList);
//		
//		mv.addObject("category", category);
//		mv.addObject("endPage", endPage);
//		mv.addObject("pageNo", pageNo);
//		
//		return mv;
//	}
	
}
