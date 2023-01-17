package com.project.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.file.BoardFileDTO;
import com.project.file.BoardFileService;
import com.project.service.PageDTO;
import com.project.service.SearchCriteria;
import com.project.service.ServiceReply_TBDTO;
import com.project.service.ServiceReply_TBService;
import com.project.service.Service_TBDTO;
import com.project.service.Service_TBService;

@Controller
public class CustomerController {
	customerService service;
	Service_TBService questionservice;
	BoardFileService boardservice;
	ServiceReply_TBService servicereply;
	@Autowired
	public CustomerController(customerService service, Service_TBService questionservice, BoardFileService boardservice,
			ServiceReply_TBService servicereply) {
		super();
		this.service = service;
		this.questionservice = questionservice;
		this.boardservice = boardservice;
		this.servicereply = servicereply;
	}
	@RequestMapping("/customer/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("customerList");
		List<CustomerDTO> customerlist = service.customerList();
		mav.addObject("customerlist", customerlist);
		return mav;
	}
	

	
	@RequestMapping("/customer/read.do")//마이페이지 
	public String read(String customer_id,String state,Model model) {
		//System.out.println(customer_id+state);
		ModelAndView mav = new ModelAndView();
		CustomerDTO customerinfo = service.getCustomerInfo(customer_id);
		String view = "";
		if(state.equals("READ")) {
			if(customerinfo.getState().equals("정상")) {
				view = "customer_read";
			}else {
				view = "customer_read_kakao";
			}
		}else if(state.equals("UPDATE")){
			if(customerinfo.getState().equals("정상")) {
				view = "customer_update";
			}else {
				view = "customer_update_kakao";
			}
		}
		model.addAttribute("customerinfo", customerinfo);
		return view;
	}
	
	
	
	//회원가입 페이지 호출 
	@RequestMapping(value ="/customer/register.do", method = RequestMethod.GET)
	public String registerPage() {
		return "customer_register";
	}
	
	
	//회원가입 처리
	@RequestMapping(value ="/customer/register.do", method=RequestMethod.POST)
	public String register(CustomerDTO customer) {
		service.register(customer);
		return "login";  
	}
	

	
	//
	@RequestMapping("/customer/update.do")
	public String update(CustomerDTO customer) {
		service.update(customer);
		return "redirect:/customer/read.do?customer_id="+customer.getCustomer_id()+"&state=READ";
	}
	
	
	@RequestMapping("/customer/delete.do")
	public String delete(String customer_id) {
		service.delete(customer_id);
		return "redirect:/index"; 	
	}
	
	@RequestMapping(value = "/idcheak", produces = "application/json; charset=utf-8")
	@ResponseBody
	public boolean idcheak(String customer_id) {
		return service.idCheck(customer_id); 
	}
	
	@RequestMapping("/customer/realdelete.do")
	public String realdelete(String customer_id) {
		service.realdelete(customer_id);
		return "redirect:/customer/list.do?type=all&pageNo=1&name="; 	
	}
	
	
	@RequestMapping("/customer/boardListPaging.do")
	public String boardListPaging(Model model, @ModelAttribute("scri") SearchCriteria scri,String customer_id) {
		String type = "회원";
		model.addAttribute("list", questionservice.selectbyId(scri,customer_id,type));
		
		PageDTO pageMaker = new PageDTO();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(questionservice.listCountId(scri,customer_id,type));
		
		model.addAttribute("pageMaker", pageMaker);
		return "customer_service";
	}
	@RequestMapping("/customer/serviceread.do")
	public String read(String board_no, Model model, @ModelAttribute("scri") SearchCriteria scri) {
		Service_TBDTO board = questionservice.getBoardInfo(board_no);
		List<BoardFileDTO> boardfiledtolist = boardservice.getFileList(board_no);
		model.addAttribute("list", board);
		model.addAttribute("boardfiledtolist", boardfiledtolist);
		model.addAttribute("scri", scri);
		
		//댓글
		List<ServiceReply_TBDTO> replylist = servicereply.replyList(board_no);
		model.addAttribute("replylist", replylist);
		
		return "customer_service_read";
	}
	
	@RequestMapping("/customer/servicedelete.do")
	public String delete(String board_no, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr,String customer_id) {
		questionservice.delete(board_no);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/customer/boardListPaging.do?customer_id="+customer_id;
	}
	
}
