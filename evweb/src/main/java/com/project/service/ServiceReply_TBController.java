package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import oracle.net.aso.l;

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
	
	//답변 작성하기 화면
	@RequestMapping(value = "/reply/write.do", method = RequestMethod.GET)
	public ModelAndView writePage(String board_no) {
		ModelAndView mav = new ModelAndView("admin_service_reply");
		Service_TBDTO list = servicetb.getBoardInfo(board_no);
		mav.addObject("list", list);
		return mav;
	}
	
	//답변 작성하기 실행
	@RequestMapping(value = "/reply/write.do", method = RequestMethod.POST)
	public ModelAndView write(ServiceReply_TBDTO user, String board_no) {
		servicetb.updateState(board_no); //답글이 달리면 그 게시글의 답변상태가 '대기'에서 '완료'로 바뀜
		ModelAndView mav = new ModelAndView("redirect:/service/list.do?board_category=all");
		service.insert(user);
		mav.addObject("list", user);
		return mav;
	}
	
	//1:1문의 답변목록보기
//	@RequestMapping("/reply/list.do")
//	public ModelAndView list(String board_no) {
//		ModelAndView mav = new ModelAndView("admin_service_reply_read");
//		List<ServiceReply_TBDTO> replylist = service.replyList(board_no);
//		System.out.println(replylist);
//		mav.addObject("replylist", replylist);
//		return mav; 
//	}
}