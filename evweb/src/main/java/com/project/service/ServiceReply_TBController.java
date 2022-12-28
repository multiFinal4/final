package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ServiceReply_TBController {
	ServiceReply_TBService service;
	Service_TBService servicetb;
	@Autowired
	public ServiceReply_TBController(ServiceReply_TBService service, Service_TBService servicetb) {
		super();
		this.service = service;
		this.servicetb = servicetb;
	}
	
	@RequestMapping(value = "/reply/write.do", method = RequestMethod.GET)
	public ModelAndView writePage(String board_no) {
		ModelAndView mav = new ModelAndView("admin_service_reply");
		Service_TBDTO list = servicetb.getBoardInfo(board_no);
		mav.addObject("list", list);
		return mav;
	}
	
	//1:1문의 답변등록하기
	@RequestMapping(value = "/reply/write.do", method = RequestMethod.POST)
	public String write(ServiceReply_TBDTO user) {
		service.insert(user);
		return "redirect:/service/list.do?board_category=all";
	}
	
	//1:1문의 답변목록보기
	@RequestMapping("/reply/list.do")
	public ModelAndView list(String board_no) {
		ModelAndView mav = new ModelAndView("글 상세화면에 댓글뿌리기");
		List<ServiceReply_TBDTO> list = service.replyList(board_no);
		mav.addObject("list", list);
		return mav;
	}
}
