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
		return "글작성하는 뷰로 이동";
	}
	
	@RequestMapping(value = "/service/write.do", method = RequestMethod.POST)
	public ModelAndView write(Service_TBDTO user) {
		ModelAndView mav = new ModelAndView("board/list ~글작성완료하면 글리스트화면으로 이동");
		service.insert(user);
		mav.addObject("list", user);
		return mav;
	}
	
	@RequestMapping("/board/list.do")
	public ModelAndView list(String category) {
		ModelAndView mav = new ModelAndView("board/list ~글리스트화면으로 이동");
		List<Service_TBDTO> list = service.boardList();
		mav.addObject("category", category);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/board/read.do")
	public String read(String board_no,String state,Model model) {
		Service_TBDTO board = service.getBoardInfo(board_no);
		String view = "";
		if(state.equals("READ")) {
			view = "board/read ~read화면으로 이동";
		}else {
			view = "board/update ~update화면으로 이동";
		}
		model.addAttribute("list", board);
		return view;
	}
	
	@RequestMapping("/board/update.do")
	public String update(Service_TBDTO board) {
		service.update(board);
		return "redirect:/board/list.do?category=all";
	}
	
	//삭제 시도 시 로그인 유무 체크해서 로그인을 하지 않은 사용자는 로그인을 할 수 있도록 로그인페이지로 리다이렉트 =>추가작업해야함
	@RequestMapping("/board/delete.do")
	public String delete(String board_no) {
		service.delete(board_no);
		return "redirect:/board/list.do?category=all";
	}
	
	@RequestMapping("/board/search.do")
	public ModelAndView search(String tag,String data) {
		ModelAndView mav = new ModelAndView("board/list ~글리스트화면으로 이동");
		List<Service_TBDTO> list = service.search(tag, data);
		mav.addObject("list", list);
		return mav;
	}
	
}





