package com.project.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	// inset페이지로 이동
	@RequestMapping(value = "/service/faqinsert", method = RequestMethod.GET)
	public String insertPage() {
		return "service_faqinsert"; // .jsp
	}

	// faq에 insert하기
	@RequestMapping(value = "/service/faqinsert", method = RequestMethod.POST)
	public String insert(FaqDTO document) {
		// System.out.println("컨트롤러:"+document);
		service.insertDocument(document);
		System.out.println("FAQ컨트롤러 ~~"+document);
		return "redirect:/admin_faq.do?pageNo=0";
	}

	// search 화면으로 이동
//	@RequestMapping(value = "/faq/search", method = RequestMethod.GET)
//	public String searchPage() {
//		return "faq_search";
//	}

	// search 하기.
	@RequestMapping(value = "/faq/search", method = RequestMethod.POST)
	public ModelAndView search(String field, String criteria, String value) {
		List<FaqDTO> docs = service.findCriteria(field + "," + criteria, value);
		return new ModelAndView("faq_search", "faqlist", docs);
		
//		return new ModelAndView("list", "faqlist", docs);
	}

	// 읽기
	@RequestMapping("/faq/detail")
	public ModelAndView findById(String key, String value, String action) {
		System.out.println("findById _id 1234 : "+ value);
		FaqDTO list = service.findById(key, value);
		System.out.println("list 1234 : "+ list);
		String view = "";
		if (action.equals("read")) {
			view = "service_faqread";
		} else {
			view = "service_faqupdate";
		}
		return new ModelAndView(view, "list", list);
	}

	// get : 디비에서 데이터 가져올 때
	// post : 디비에 데이터 생성, 수정 할 때
	
	// RESTful API 
	//
	// get.article
	// post.article
	// put.article 기존 게시글에 덮어 씌우기 (업데이트. 통째로 덮어씌움)
	// patch.article 기존 게시글에 일부만 바꿔서 업데이트 (업데이트. 일부만 업데이트 함)
	// 개발자끼리 이렇게 개발하자고 약속 
	

	@RequestMapping("/faq/list")
	public String mongolist(Model model) {
		List<FaqDTO> faqlist = service.findAll();
		model.addAttribute("faqlist", faqlist);
		return "list";
	}

	// user list
	@RequestMapping("/faq/paginglist")
	public ModelAndView pagemongolist(String pageNo) {
		
		List<FaqDTO> faqlist = service.findAll();
		int total_article = faqlist.size();
//		model.addAttribute("faqlist", faqlist);
//
//		List<FaqDTO> faqlist = service.findAll(Integer.parseInt(pageNo));
		// System.out.println(pageNo);
		return new ModelAndView("service_faq", "faqlist", faqlist);
	}

	// admin list
	@RequestMapping("/admin_faq.do")
	public ModelAndView pagemongolist2(String pageNo) {
		List<FaqDTO> faqlist = service.findAll(Integer.parseInt(pageNo));
		// System.out.println(pageNo);
		return new ModelAndView("admin_faqlist", "faqlist", faqlist);
	}
	
	@RequestMapping(value = "/faq/update", method = RequestMethod.POST)
	public String update(FaqDTO document, @RequestParam String _id) {
		System.out.println("update test1234 : " + document);
		System.out.println("_id test1234 : " + _id);
		document.set_id(_id);
		service.update(document);	
		
		return "redirect:/admin_faq.do?pageNo=0";
	}
	
	// admin delete
	@RequestMapping(value = "/faq/delete.do", method = RequestMethod.GET)
	public String delete (String _id) {
		System.out.println("FAQ 컨트롤러 ~~삭제하기 눌려짐");
		service.delete(_id);
		System.out.println("컨트롤러 document > "+_id);
		return "redirect:/admin_faq.do?pageNo=0";
		
	}
}
