package com.project.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.customer.CustomerDTO;
import com.project.customer.customerService;
import com.project.file.BoardFileDTO;
import com.project.file.BoardFileService;
import com.project.service.PageDTO;
import com.project.service.SearchCriteria;
import com.project.service.ServiceReply_TBDTO;
import com.project.service.ServiceReply_TBService;
import com.project.service.Service_TBDTO;
import com.project.service.Service_TBService;
import com.project.station.StationDTO;
import com.project.station.StationService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	ManagerService service;
	customerService customerservice;
	Service_TBService questionservice;
	BoardFileService boardservice;
	ServiceReply_TBService servicereply;
	StationService stationService;
	@Autowired
	public ManagerController(ManagerService service, customerService customerservice, Service_TBService questionservice,
			BoardFileService boardservice,ServiceReply_TBService servicereply,StationService stationService) {
		super();
		this.service = service;
		this.customerservice = customerservice;
		this.questionservice = questionservice;
		this.boardservice = boardservice;
		this.servicereply = servicereply;
		this.stationService = stationService;
	}
	
	
	//타입으로 분류
	@RequestMapping("/list.do")
	public ModelAndView list(String type, String endNo, String pageNo, String name) {
		ModelAndView mav = new ModelAndView("adminList");
		List<ManagerDTO> managerlist = service.findByName(type, name);
		String state = "";
		if(type.equals("all") || type.equals("일반 사용자")) {
			state = "all";
		}else {
			state = "불러오지마";
		}
		List<CustomerDTO> customerlist = customerservice.findByName(state, name);	
		int showList = 10; // 리스트 보여줄 갯수
		endNo = Integer.toString((Integer.parseInt(pageNo)*showList));
		String remainNo = Integer.toString(Integer.parseInt(endNo)-managerlist.size());
		List<ManagerDTO> managerlistPage = service.findListByType(type, endNo, name);
		List<CustomerDTO> customerlistPage = customerservice.findListByState(state, remainNo, name);
		int endPage = 0; // 페이징 넘버 유동적으로
		int sizeList = managerlist.size() + customerlist.size();
		if (type.equals("all")) {
			if (sizeList <= showList) {
				endPage = 1;
			}else {
				endPage = (int) Math.ceil(sizeList/(double)showList);
			}
		}
		else {
			if (sizeList<= showList) {
				endPage = 1;
			}else {

				endPage = (int) Math.ceil(sizeList/(double)showList);
			}
		}
		mav.addObject("managerlistPage", managerlistPage);
		mav.addObject("managerlist", managerlist);
		mav.addObject("customerlistPage", customerlistPage);
		mav.addObject("customerlist", customerlist);
		mav.addObject("name", name);
		mav.addObject("type", type);
		mav.addObject("endPage", endPage);
		mav.addObject("pageNo", pageNo);
		return mav;
	}
	//list.do에 search기능 통합 -미사용메소드-
	@RequestMapping("/search.do")
	public ModelAndView search(String type,String name) {
		ModelAndView mav = new ModelAndView("adminList");
		List<ManagerDTO> managerlist = service.findByName(type,name);
		mav.addObject("managerlist", managerlist);
		mav.addObject("type",type);
		return mav;
	}
	@RequestMapping("/read.do")
	public String read(String manager_id,String read,Model model) {
		ManagerDTO managerinfo = service.getManagerInfo(manager_id);
		String view = "";
		if(read.equals("READ")) {
			view  = "adminRead";
		}else if(read.equals("UPDATE")) {
			view  = "adminUpdate";
		}else if(read.equals("MYPAGE")) {
			view  = "manager_mypage";
		}else if(read.equals("MPUPDATE")) {
			view  = "manager_update";
		}
		model.addAttribute("managerinfo", managerinfo);
		return view;
	}
	@RequestMapping("/update.do")
	public String update(ManagerDTO manager) {
		service.update(manager);
		return "redirect:/manager/list.do?type=all&pageNo=1&name=";
	}
	
	@RequestMapping("/myupdate.do")
	public String myupdate(ManagerDTO manager) {
		service.update(manager);
		return "redirect:/manager/read.do?read=MYPAGE&manager_id="+manager.getManager_id();
	}
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String registerpage() {
		return "adminRegister";
	}
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String register(ManagerDTO manager) {
		service.register(manager);
		return "redirect:/manager/list.do?type=all&pageNo=1&name=";
	}
	@RequestMapping("/delete.do")
	public String delete(String manager_id,String customer_id) {
		if(manager_id!=null) {
			service.delete(manager_id);
		}
		if(customer_id!=null) {
			customerservice.delete(customer_id);
		}
		return "redirect:/manager/list.do?type=all&pageNo=1&name="; 	
	}
	@RequestMapping(value = "/idcheak", produces = "application/json; charset=utf-8")
	@ResponseBody
	public boolean idcheak(String manager_id) {
		return service.idCheck(manager_id); 
	
	}
	@RequestMapping("/customerRead.do")
	public String customerread(String customer_id,String read,Model model) {
		CustomerDTO customerinfo = customerservice.getCustomerInfo(customer_id);
		String view = "";
		if(read.equals("READ")) {
			view  = "admin_customer_read";
		}else if(read.equals("UPDATE")) {
			view  = "admin_customer_update";
		}
		model.addAttribute("customerinfo", customerinfo);
		return view;
	}
	@RequestMapping("/change.do")
	public String cusToMgr(ManagerDTO manager, Model model) {
		System.out.println(manager);
		service.register(manager);
		customerservice.change(manager.getManager_id());
		return "redirect:/manager/list.do?type=all&pageNo=1&name=";
	}
	@RequestMapping("/realdelete.do")
	public String realdelete(String manager_id) {
		service.realdelete(manager_id);
		return "redirect:/manager/list.do?type=all&pageNo=1&name="; 	
	}
	
	@RequestMapping("/boardListPaging.do")
	public String boardListPaging(Model model, @ModelAttribute("scri") SearchCriteria scri,String manager_id) {
		String type = "관리자";
		model.addAttribute("list", questionservice.selectbyId(scri,manager_id,type));
		
		PageDTO pageMaker = new PageDTO();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(questionservice.listCountId(scri,manager_id,type));
		
		model.addAttribute("pageMaker", pageMaker);
		return "manager_service";
	}
	@RequestMapping("/serviceread.do")
	public String read(String board_no, Model model, @ModelAttribute("scri") SearchCriteria scri) {
		Service_TBDTO board = questionservice.getBoardInfo(board_no);
		List<BoardFileDTO> boardfiledtolist = boardservice.getFileList(board_no);
		model.addAttribute("list", board);
		model.addAttribute("boardfiledtolist", boardfiledtolist);
		model.addAttribute("scri", scri);
		
		//댓글
		List<ServiceReply_TBDTO> replylist = servicereply.replyList(board_no);
		model.addAttribute("replylist", replylist);
		
		return "manager_service_read";
	}
	
	@RequestMapping("/servicedelete.do")
	public String delete(String board_no, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr,String manager_id) {
		questionservice.delete(board_no);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/manager/boardListPaging.do?manager_id="+manager_id;
	}
	
	@RequestMapping("/stationlist.do")
	public ModelAndView list(String manager_id, String endNo, String pageNo){
		ModelAndView mv = new ModelAndView("manager_station_list");
		List<StationDTO> stationlist = stationService.stationList();
		List<StationDTO> stationlistMgr = stationService.stationListMgr(manager_id);
		
		int showList = 10; // 리스트 보여줄 갯수
		endNo = Integer.toString((Integer.parseInt(pageNo)*showList));
		List<StationDTO> stationlistPage = stationService.stationListMgr(manager_id, endNo);
		int endPage = 0; // 페이징 넘버 유동적으로 
		
		
		if (stationlistMgr.size() <= showList) {
			endPage = 1;
		}else {
			endPage = (stationlistMgr.size()/showList)+1;
		}
	
		List<StationDTO> companyList = stationService.companyList();
		
		mv.addObject("stationlistPage", stationlistPage);
		mv.addObject("stationlist", stationlist);
		mv.addObject("companyList", companyList);
		
		mv.addObject("manager_id", manager_id);
		mv.addObject("endPage", endPage);
		mv.addObject("pageNo", pageNo);
		return mv;
	}
	
	@RequestMapping("/station/read.do")
	public String readStation(String stationId, String state, Model model) {
		StationDTO read = stationService.read(stationId);
		String path = "";
		
		if (state.equals("READ")) {
			path = "manager_station_read";
		} else {
			path = "manager_station_update";
		}
		model.addAttribute("read", read);
		return path;
	}
	
	@RequestMapping("/station/delete.do")
	public String delete(String stationId,HttpServletRequest request) {
		HttpSession session = request.getSession();
		ManagerDTO dto = (ManagerDTO) session.getAttribute("user");
		String manager_id = dto.getManager_id();
		
		stationService.delete(stationId);
		return "redirect:/manager/stationlist.do?manager_id="+manager_id+"all&pageNo=1";
	}
	
	@RequestMapping("/station/update.do")
	public String update(StationDTO station,HttpServletRequest request ) {
		HttpSession session = request.getSession();
		ManagerDTO dto = (ManagerDTO) session.getAttribute("user");
		String manager_id = dto.getManager_id();
		
		stationService.update(station);
		return "redirect:/manager/stationlist.do?manager_id="+manager_id+"&pageNo=1";
	}
}

