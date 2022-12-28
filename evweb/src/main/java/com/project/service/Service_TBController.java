package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Service_TBController {
	Service_TBService service;
	@Autowired
	public Service_TBController(Service_TBService service) {
		super();
		this.service = service;
	}
	
	
	@RequestMapping(value = "/service/write.do", method = RequestMethod.GET)
	public String writePage() {
		return "service_insert";
	}
	
	@RequestMapping(value = "/service/write.do", method = RequestMethod.POST)
	public String write(Service_TBDTO user) {
		service.insert(user);
		return "redirect:/service/list.do?board_category=all";
	}
	
	@RequestMapping("/service/list.do")
	public ModelAndView list(String board_category) {
		//System.out.println("board_category===============> "+board_category);
		ModelAndView mav = new ModelAndView("admin_service");
		List<Service_TBDTO> list = service.findByCategory(board_category);
		mav.addObject("board_category", board_category);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/service/read.do")
	public String read(String board_no,String state,Model model) {
		Service_TBDTO board = service.getBoardInfo(board_no);
		String view = "";
		if(state.equals("READ")) {
			view = "admin_service_read";
		}else {
			view = "admin_service_update";
		}
		model.addAttribute("list", board);
		return view;
	}
	
//	1:1문의글 수정기능은 없음
//	@RequestMapping("/service/update.do")
//	public String update(Service_TBDTO board) {
//		service.update(board);
//		return "redirect:/service/list.do?category=all";
//	}
	
	//삭제 시도 시 로그인 유무 체크해서 로그인을 하지 않은 사용자는 로그인을 할 수 있도록 로그인페이지로 리다이렉트 =>추가작업해야함
	@RequestMapping("/service/delete.do")
	public String delete(String board_no) {
		service.delete(board_no);
		return "redirect:/service/list.do?board_category=all";
	}
	
	@RequestMapping("/service/search.do")
	public ModelAndView search(String tag,String data) {
		ModelAndView mav = new ModelAndView("admin_service");
		List<Service_TBDTO> list = service.search(tag, data);
		mav.addObject("list", list);
		return mav;
	}
	
}





