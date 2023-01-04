package com.project.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	public NoticeController() {
	}
	
	@Autowired
	public NoticeController(NoticeService service, FileUploadLogic fileuploadService) {
		super();
		this.service = service;
		this.fileuploadService = fileuploadService;
	}
	
	//insert 페이지로 이동
	@RequestMapping(value = "/service/noticeinsert", method = RequestMethod.GET)
	public String insert() {
		return "service_noticeinsert";
	}
	
	//notice에 insert하기
	@RequestMapping(value = "/service/noticeinsert", method = RequestMethod.POST)
	public String insert(NoticeDTO noticeboard, HttpSession session) throws IllegalStateException, IOException {
		System.out.println("Notice=>"+noticeboard);
		//1. MultipartFile 정보를 추출하기
		List<MultipartFile> files = noticeboard.getFiles();
		//2. 업로드될 서버의 경로 - 실제 서버의 경로를 추출하기 위해서 context의 정보를 담고 있는 ServletContext객체를 추출
		//=>getServletContext는 우리가 생성한 프로젝트가 서버에 배포되는 실제 경로와  context에 대한 정보를 담고 있는 객체
		String path = 
				WebUtils.getRealPath(session.getServletContext(), "/WEB-INF/upload");
		System.out.println(path);
		//3. 파일업로드 서비스를 호출해서 실제 서버에 업로드되도록 작업하기
		List<NoticeFileDTO> noticefiledtolist = fileuploadService.uploadFiles(files, path);
		int count = 1;
		//업로드된 파일의 Noticefileno의 값을 셋팅 - 1부터 1,2,3,4,... 첨부파일 마지막 번호
		for(NoticeFileDTO noticefiledto:noticefiledtolist) {
			noticefiledto.setNoticeFileno(count+"");
			count++;
		}
		System.out.println(noticefiledtolist);
		//4. 게시글에 대한 일반적인 정보와 첨부되는 파일의 정보를 db에 저장하기
		service.insert(noticeboard,noticefiledtolist);
		return "redirect:/notice/list.do?category=all";
	}
	
	/*
	 * @RequestMapping("/notice/download/{manager_id}/{notice_no}/{noticeFileno}")
	 * public ResponseEntity<UrlResource> downloadFile(@PathVariable String
	 * manager_id, @PathVariable String notice_no,
	 * 
	 * @PathVariable String NoticeFileno, HttpSession session) throws
	 * MalformedURLException, FileNotFoundException, UnsupportedEncodingException {
	 * System.out.println(manager_id+","+notice_no+","+NoticeFileno); //파일을 다운로드 하기
	 * 위해서 디비에 저장된 파일의 정보를 가져오기 - 다운로드를 요청한 경우 요청된 파일을 responsne NoticeFileDTO
	 * selectFileInfo = service.getFile(new NoticeFileDTO(notice_no, manager_id,
	 * notice_no, NoticeFileno));
	 * 
	 * //파일명을 이용해서 다운로드할 파일을 객체로 생성하는 작업 UrlResource resource = new
	 * UrlResource("file:"+WebUtils.getRealPath(session.getServletContext(),
	 * "/WEB-INF/upload/"+selectFileInfo.getStoreFilename())); //파일명에 한글이 있는 경우 오류가
	 * 발생하지 않도록 처리 - 다운로드되는 파일명 String encodedFilename =
	 * UriUtils.encode(selectFileInfo.getOriginalFilename(), "UTF-8"); String
	 * mycontenttype = "attachment; filename=\"" + encodedFilename + "\"";
	 * System.out.println(selectFileInfo); //파일다운로드 return ResponseEntity.ok()
	 * .header(HttpHeaders.CONTENT_DISPOSITION,null, mycontenttype) .body(resource);
	 * }
	 */
	
	@RequestMapping("/Notice/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("service_notice");
		List<NoticeDTO> noticelist = service.noticeList();
		mav.addObject("noticelist", noticelist);
		return mav;
	}
	
	//글 읽기
	@RequestMapping("/notice/read.do")
	public String read(String notice_no,String state, Model model) {
//		ModelAndView mav = new ModelAndView();
		NoticeDTO notice = service.getNoticeInfo(notice_no);
//		List<NoticeFileDTO> noticefiledtolist = service.getFileList(notice_no);
		String view = "";
		if(state.equals("READ")) {
			view = "service_noticeread";
		}else {
			view = "notice/update";
		}
//		mav.setViewName(view);
//		System.out.println("model로 수정하기 -----------------------------");
//		System.out.println(Notice);
		model.addAttribute("notice", notice);
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
	@RequestMapping("/notice/update.do")
	public String update(NoticeDTO noticeboard) {
		System.out.println(noticeboard+"-----------업데이트---------------------");
		int result = service.update(noticeboard);
		return "redirect:/Notice/list.do?category=all";
	}
	@RequestMapping("/notice/search.do")
	public ModelAndView search(String tag, String data) {
		ModelAndView mav = new ModelAndView("notice/list");
		List<NoticeDTO> Noticelist = service.search(tag, data);
		System.out.println(Noticelist);
		mav.addObject("Noticelist", Noticelist);
		return mav;
	}
	
}
