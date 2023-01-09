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
	
	public FaqController() {
	}
	
	@Autowired
	public FaqController(FaqMongoService service) {
		super();
		this.service = service;
	}
	
	//inset페이지로 이동
	@RequestMapping(value = "/service/faqinsert", method = RequestMethod.GET)
	public String insertPage() {
		return "service_faqinsert"; //.jsp
	}
	//faq에 insert하기
	@RequestMapping(value = "/service/faqinsert", method = RequestMethod.POST)
	public String insert(FaqDTO document) {
		//System.out.println("컨트롤러:"+document);
		service.insertDocument(document);
		return "redirect:/admin_faq.do?pageNo=0";
	}
	//search
	@RequestMapping(value="/faq/search",method=RequestMethod.GET)
	public String searchPage() {
		return "search";
	}
	
	@RequestMapping(value="/faq/search",method=RequestMethod.POST)
	public ModelAndView search(String field, String criteria, String value) {
		List<FaqDTO> docs = service.findCriteria(field+","+criteria, value);
		return new ModelAndView("list","faqlist",docs);
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
	
	@RequestMapping("/faq/list")
	public String mongolist(Model model) {
		List<FaqDTO> faqlist = service.findAll();
		model.addAttribute("faqlist", faqlist);
		return "list";
	}
	
	@RequestMapping("/faq/paginglist")
	public ModelAndView pagemongolist(String pageNo) {
		List<FaqDTO> faqlist = service.findAll(Integer.parseInt(pageNo));
		//System.out.println(pageNo);
		return new ModelAndView("service_faq", "faqlist", faqlist);
	}
	@RequestMapping("/admin_faq.do")
	public ModelAndView pagemongolist2(String pageNo) {
		List<FaqDTO> faqlist = service.findAll(Integer.parseInt(pageNo));
		//System.out.println(pageNo);
		return new ModelAndView("admin_faqlist", "faqlist", faqlist);
	}
	
	
	@RequestMapping(value = "/service/delete", method = RequestMethod.GET)
	public String delete() {
		return "service_faqinsert"; //.jsp
	}
}
