package com.project.station;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.manager.ManagerDTO;
import com.project.manager.ManagerService;

@Controller
public class StationController {
	StationService service;
	ManagerService managerService;

	@Autowired
	public StationController(StationService service, ManagerService managerService) {
		super();
		this.service = service;
		this.managerService = managerService;
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
	public ModelAndView list(String category, String endNo, String pageNo) {
		ModelAndView mv = new ModelAndView("station/list");
		List<StationDTO> stationlist = service.stationList();

		int showList = 7; // 리스트 보여줄 갯수
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
			if (stationlistPage.size() <= showList) {
				endPage = 1;
			}else {

				endPage = (stationlistPage.size()/showList)+1;
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
		category = "사이트 관리자";
		List<ManagerDTO> mainlist = managerService.findByType(category);
		return mainlist;
	}
	
}
