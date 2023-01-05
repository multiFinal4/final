package com.project.notice;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;


@Controller
public class NoticeController {
	FileUploadLogic fileuploadService;
	NoticeService service;
	public NoticeController() {}
	@Autowired
	public NoticeController(NoticeService service, FileUploadLogic fileuploadService) {
		super();
		this.service = service;
		this.fileuploadService = fileuploadService;
	}
	@RequestMapping(value = "/Notice/write.do",method = RequestMethod.GET)
	public String writePage() {
		return "Notice/writepage";
	}
	//ResponseEntity는 HttpEntity의 하위객체
	//HttpEntity Http요청과 응답을 관리하는 객체 - 요청헤더, 바디, 응답 헤더, 바디를 관리하는 객체
	//ResponseEntity는 응답의 데이터를 관리하는 객체
	//=>Http헤더, Http바디, Http상태정보.. 등을 관리할 수 있다.
	//UrlResource는 파일객체를 다루기 위해서 스프링 내부에서 사용하는 객체
	@RequestMapping("/Notice/download/{id}/{Notice_no}/{NoticeFileno}")
	public ResponseEntity<UrlResource> downloadFile(@PathVariable String id, @PathVariable String Notice_no,
			@PathVariable String NoticeFileno, HttpSession session) throws MalformedURLException, FileNotFoundException, UnsupportedEncodingException {
		System.out.println(id+","+Notice_no+","+NoticeFileno);
		//파일을 다운로드 하기 위해서 디비에 저장된 파일의 정보를 가져오기 - 다운로드를 요청한 경우 요청된 파일을 responsne
		NoticeFileDTO selectFileInfo = service.getFile(new NoticeFileDTO(Notice_no, id, Notice_no, NoticeFileno));
		
		//파일명을 이용해서 다운로드할 파일을 객체로 생성하는 작업
		UrlResource resource =
				new UrlResource("file:"+WebUtils.getRealPath(session.getServletContext(),
									"/WEB-INF/upload/"+selectFileInfo.getStoreFilename()));
		//파일명에 한글이 있는 경우 오류가 발생하지 않도록 처리 - 다운로드되는 파일명
		String encodedFilename = UriUtils.encode(selectFileInfo.getOriginalFilename(), "UTF-8");
		String mycontenttype = "attachment; filename=\"" + encodedFilename + "\"";
		System.out.println(selectFileInfo);
		//파일다운로드
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION,null, mycontenttype)
				.body(resource);
	}
	@RequestMapping(value = "/Notice/write.do",method = RequestMethod.POST)
	public String write(NoticeDTO Notice, HttpSession session) throws IllegalStateException, IOException {
		System.out.println("Notice=>"+Notice);
		//1. MultipartFile 정보를 추출하기
		List<MultipartFile> files = Notice.getFiles();
		//2. 업로드될 서버의 경로 - 실제 서버의 경로를 추출하기 위해서 context의 정보를 담고 있는 ServletContext객체를 추출
		//=>getServletContext는 우리가 생성한 프로젝트가 서버에 배포되는 실제 경로와  context에 대한 정보를 담고 있는 객체
		String path = 
				WebUtils.getRealPath(session.getServletContext(), "/WEB-INF/upload");
		System.out.println(path);
		//3. 파일업로드 서비스를 호출해서 실제 서버에 업로드되도록 작업하기
		List<NoticeFileDTO> Noticefiledtolist = fileuploadService.uploadFiles(files, path);
		int count = 1;
		//업로드된 파일의 Noticefileno의 값을 셋팅 - 1부터 1,2,3,4,... 첨부파일 마지막 번호
		for(NoticeFileDTO Noticefiledto:Noticefiledtolist) {
			Noticefiledto.setNoticeFileno(count+"");
			count++;
		}
		System.out.println(Noticefiledtolist);
		//4. 게시글에 대한 일반적인 정보와 첨부되는 파일의 정보를 db에 저장하기
		service.insert(Notice,Noticefiledtolist);
		return "redirect:/Notice/list.do?category=all";
	}
//	@RequestMapping("/Notice/list.do")
//	public ModelAndView list(String category) {
//		System.out.println("category=>"+category);
//		ModelAndView mav = new ModelAndView("Notice/list");
//		List<NoticeDTO> Noticelist = service.findByCategory(category);
//		System.out.println(Noticelist);
//		mav.addObject("category", category); //게시판 구분을 선택해도 다시 '전체보기'로 돌아가는데 그걸 막기 위해
//		mav.addObject("Noticelist", Noticelist);
//		return mav;
//	}
	
	@RequestMapping("/Notice/read.do")
	public String read(String Notice_no,String state, Model model) {
//		ModelAndView mav = new ModelAndView();
		NoticeDTO Notice = service.getNoticeInfo(Notice_no);
		List<NoticeFileDTO> Noticefiledtolist = service.getFileList(Notice_no);
		System.out.println(Noticefiledtolist);
		String view = "";
		if(state.equals("READ")) {
			view = "Notice/read";
		}else {
			view = "Notice/update";
		}
//		mav.setViewName(view);
//		System.out.println("model로 수정하기 -----------------------------");
//		System.out.println(Notice);
		model.addAttribute("Notice", Notice);
		model.addAttribute("Noticefiledtolist", Noticefiledtolist);

		return view;
	}
//	//delete를 시도하면 로그인 유무를 체크해서 로그인을 하지 않은 사용자는 로그인을 할 수 있도록 로그인페이지로 리다이렉트
//	@RequestMapping("/Notice/delete.do")
//	public String delete(String Notice_no, HttpSession session) {
//		MemberDTO user = (MemberDTO) session.getAttribute("user");
//		String view = "";
//		if(user==null) { //로그인 하지 않은 상태
//			 view = "redirect:/emp/login.do";
//		}else { //로그인 성공 상태
//			int result = service.delete(Notice_no);
//			view = "redirect:/Notice/list.do?category=all";
//		}
//		return view;
//	}
	//실제 업데이트기능을 처리
	@RequestMapping("/Notice/update.do")
	public String update(NoticeDTO Notice) {
		System.out.println(Notice+"-----------업데이트---------------------");
		int result = service.update(Notice);
		return "redirect:/Notice/list.do?category=all";
	}
	@RequestMapping("/Notice/search.do")
	public ModelAndView search(String tag, String data) {
		ModelAndView mav = new ModelAndView("Notice/list");
		List<NoticeDTO> Noticelist = service.search(tag, data);
		System.out.println(Noticelist);
		mav.addObject("Noticelist", Noticelist);
		return mav;
	}
}
