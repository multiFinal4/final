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
	@Autowired
	public ServiceReply_TBController(ServiceReply_TBService service) {
		super();
		this.service = service;
	}
	
	//1:1문의 답변등록하기
	@RequestMapping(value = "/reply/write.do", method = RequestMethod.GET)
	public String writePage() {
		return "admin_service_reply";
	}
	@RequestMapping(value = "/reply/write.do", method = RequestMethod.POST)
	public ModelAndView write(ServiceReply_TBDTO user) {
		ModelAndView mav = new ModelAndView("admin_service");
		service.insert(user);
		mav.addObject("list", user);
		return mav;
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
