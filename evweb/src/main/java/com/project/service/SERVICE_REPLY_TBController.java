package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SERVICE_REPLY_TBController {
	SERVICE_REPLY_TBService service;
	@Autowired
	public SERVICE_REPLY_TBController(SERVICE_REPLY_TBService service) {
		super();
		this.service = service;
	}
	@RequestMapping(value = "/reply/write.do", method = RequestMethod.GET)
	public String writePage() {
		return "글작성하는 뷰로 이동";
	}
	
	@RequestMapping(value = "/service/write.do", method = RequestMethod.POST)
	public ModelAndView write(SERVICE_REPLY_TBDTO user) {
		ModelAndView mav = new ModelAndView("board/list ~글작성완료하면 글리스트화면으로 이동");
		service.insert(user);
		mav.addObject("list", user);
		return mav;
	}
	
	@RequestMapping("/board/list.do")
	public ModelAndView list(String board_no) {
		ModelAndView mav = new ModelAndView("글 상세화면에 댓글뿌리기");
		List<SERVICE_REPLY_TBDTO> list = service.replyList(board_no);
		mav.addObject("list", list);
		return mav;
	}
}
