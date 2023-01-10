package com.project.station;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.charger.ChargerAPIPull;
import com.project.charger.ChargerDTO;
import com.project.charger.ChargerService;
import com.project.manager.ManagerDTO;
import com.project.manager.ManagerService;

@Controller
public class StationController {
	StationService service;
	ChargerService chargerService;
	ManagerService managerService;
	StationAPIPull stationAPIPull;
	ChargerAPIPull chargerAPIPull;

	public StationController() {}
	@Autowired
	public StationController(StationService service, ChargerService chargerService, ManagerService managerService,
			StationAPIPull stationAPIPull, ChargerAPIPull chargerAPIPull) {
		super();
		this.service = service;
		this.chargerService = chargerService;
		this.managerService = managerService;
		this.stationAPIPull = stationAPIPull;
		this.chargerAPIPull = chargerAPIPull;
	}
	
	@RequestMapping(value = "/admin/station/insert", method = RequestMethod.GET)
	public String insertPage() {
		return "station/insert";
	}

	
	@RequestMapping(value = "/admin/station/insert.do", method = RequestMethod.POST)
	public String insert(StationDTO station) {
		service.insert(station);
		return "redirect:/admin/station/list?category=all&pageNo=1";
	}
	
	@RequestMapping("/admin/station/list")
	public ModelAndView list(String category, String endNo, String pageNo){
		ModelAndView mv = new ModelAndView("station/list");
		List<StationDTO> stationlist = service.stationList();
		List<StationDTO> stationlistCate = service.stationListCate(category);
		
		int showList = 10; // 리스트 보여줄 갯수
		endNo = Integer.toString((Integer.parseInt(pageNo)*showList));
		List<StationDTO> stationlistPage = service.stationListCate(category, endNo);
		int endPage = 0; // 페이징 넘버 유동적으로 
		
		if (category.equals("all")) {
			if (stationlist.size() <= showList) {
				endPage = 1;
			}else {
				endPage = (stationlist.size()/showList)+1;
			}
		}
		else {
			if (stationlistCate.size() <= showList) {
				endPage = 1;
			}else {

				endPage = (stationlistCate.size()/showList)+1;
			}
		}
		List<StationDTO> companyList = service.companyList();
		
		mv.addObject("stationlistPage", stationlistPage);
		mv.addObject("stationlist", stationlist);
		mv.addObject("companyList", companyList);
		
		mv.addObject("category", category);
		mv.addObject("endPage", endPage);
		mv.addObject("pageNo", pageNo);
		
		
		return mv;
	}

	@RequestMapping("/admin/station/search.do")
	public ModelAndView search(String category,String stationName, String pageNo) {
		ModelAndView mv = new ModelAndView("station/list");
		List<StationDTO> stationlistPage = service.findByName(category,stationName);
		List<StationDTO> companyList = service.companyList();
		int endPage = 0;
		int showList = 10;
		if (stationlistPage.size() <= showList) {
			endPage = 1;
		}else {
			endPage = (stationlistPage.size()/showList)+1;
		}
		mv.addObject("stationlistPage", stationlistPage);
		mv.addObject("companyList", companyList);
		mv.addObject("category",category);
		mv.addObject("stationName",stationName);
		mv.addObject("endPage", endPage);
		mv.addObject("pageNo", 1);
		return mv;
	}
	
	@RequestMapping("/admin/station/read")
	public String read(String stationId, String state, Model model) {
		StationDTO read = service.read(stationId);
		String path = "";
		
		if (state.equals("READ")) {
			path = "station/read";
		} else {
			path = "station/update";
		}
		model.addAttribute("read", read);
		return path;
	}

	@RequestMapping("/admin/station/delete.do")
	public String delete(String stationId) {
//		StationDTO station = (StationDTO) session.getAttribute("user");
//		String view = "";
//		if (station == null) {
//			view = "redirect:/emp/login.do";
//		}
//		else {
//			int result = service.delete(stationId);
//			view = "redirect:/admin/station/list?category=all";
//		}
		System.out.println(stationId);
		service.delete(stationId);
		return "redirect:/admin/station/list?category=all&pageNo=1";
	}

	@RequestMapping("/admin/station/update.do")
	public String update(StationDTO station) {
		service.update(station);
		return "redirect:/admin/station/list?category=all&pageNo=1";
	}
	
	// ajax로 충전소 관리자 리스트 가져오기
	@RequestMapping(value = "/ajax/managerList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<ManagerDTO> mainlist(String category) {
		List<ManagerDTO> mainlist = managerService.findByType(category);
		return mainlist;
	}
	
	// ajax로 충전소리스트 업데이트하기
	@RequestMapping(value = "/ajax/updateList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public void stationUpdate() throws Exception {
		chargerService.deleteAll();
		service.deleteAll();
		// 충전소 업데이트
		for (StationDTO stationDTO : stationAPIPull.stationList()) {
			service.insert(stationDTO);
		}
		// 충전기 업데이트
		for (ChargerDTO chargerDTO : chargerAPIPull.chargerList()) {
			chargerService.insert(chargerDTO);
		}

	}
	
	
}
