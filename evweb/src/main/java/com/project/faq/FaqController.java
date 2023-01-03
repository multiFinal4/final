package com.project.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FaqController {
	FaqMongoService service;
	
	@Autowired
	public FaqController(FaqMongoService service) {
		super();
		this.service = service;
	}
	
	public FaqController() {
	}
	
	//inset페이지보기
	@RequestMapping(value = "/faq/insert", method = RequestMethod.GET)
	public String insertPage() {
		return "mongo_insert";
	}
	//mongodb에 insert하기
	@RequestMapping(value = "/faq/insert", method = RequestMethod.POST)
	public String insert(FaqDTO document) {
		System.out.println("컨트롤러:"+document);
		service.insertDocument(document);
		return "redirect:/faq/list";
	}
	//search
	@RequestMapping(value="/faq/search",method=RequestMethod.GET)
	public String searchPage() {
		return "search";
	}
	
	@RequestMapping(value="/faq/search",method=RequestMethod.POST)
	public ModelAndView search(String field, String criteria, String value) {
		List<FaqDTO> docs = service.findCriteria(field+","+criteria, value);
		return new ModelAndView("list","mongolist",docs);
	}
	
	@RequestMapping("/faq/list")
	public String mongolist(Model model) {
		List<FaqDTO> mongolist = service.findAll();
		model.addAttribute("mongolist", mongolist);
		return "list";
	}
	
	@RequestMapping("/faq/detail")
	public ModelAndView findById(String key, String value, String action) {
		FaqDTO document = service.findById(key, value);
		String view = "";
		if(action.equals("read")) {
			view = "mongo_detail";
		}else {
			view = "mongo_update";
		}
		return new ModelAndView(view, "document",document);
	}
	
	@RequestMapping("/faq/update")
	public String update(FaqDTO document) {
		service.update(document);
		return "redirect:/faq/paginglist?pageNo=0";
	}
	
	@RequestMapping("/faq/paginglist")
	public ModelAndView pagemongolist(String pageNo) {
		List<FaqDTO> mongolist = service.findAll(Integer.parseInt(pageNo));
		return new ModelAndView("list", "mongolist", mongolist);
	}
}
