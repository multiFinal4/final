package com.project.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.project.file.BoardFileDTO;
import com.project.file.BoardFileService;
import com.project.file.FileUploadLogic;

@Controller
public class NoticeController {
	FileUploadLogic fileuploadService;
	NoticeService service;
	BoardFileService boardservice;

	public NoticeController() {
	}

	@Autowired
	public NoticeController(NoticeService service, FileUploadLogic fileuploadService, BoardFileService boardservice) {
		super();
		this.service = service;
		this.fileuploadService = fileuploadService;
		this.boardservice = boardservice;
	}

	// insert 페이지로 이동
	@RequestMapping(value = "/service/noticeinsert", method = RequestMethod.GET)
	public String insert() {
		return "service_noticeinsert";
	}

	@RequestMapping(value = "/service/noticeinsert", method = RequestMethod.POST)
	public String insert(NoticeDTO Notice, HttpSession session) throws IllegalStateException, IOException {
		// System.out.println("Notice=>" + Notice);
		// 1. MultipartFile 정보를 추출하기
		List<MultipartFile> files = Notice.getFiles();
		// 2. 업로드될 서버의 경로 - 실제 서버의 경로를 추출하기 위해서 context의 정보를 담고 있는 ServletContext객체를 추출
		// =>getServletContext는 우리가 생성한 프로젝트가 서버에 배포되는 실제 경로와 context에 대한 정보를 담고 있는 객체
		String path = "/opt/tomcat/webapps/upload";
		// String path = WebUtils.getRealPath(session.getServletContext(), "/WEB-INF/upload");
		// System.out.println(path);
		// 3. 파일업로드 서비스를 호출해서 실제 서버에 업로드되도록 작업하기

		List<BoardFileDTO> boardfiledtolist = fileuploadService.uploadFiles(files, path);
		// 업로드된 파일의 file_no의 값을 셋팅 - 1부터 1,2,3,4....첨부파일마지막번호

		// System.out.println("boardfiledtolist???????? " + boardfiledtolist);

		// 4. 게시글에 대한 일반적인 정보와 첨부되는 파일의 정보를 db에 저장하기
		if (boardfiledtolist.isEmpty()) {
			service.insert(Notice);
		} else {
			int count = 1;
			for (BoardFileDTO boardfiledto : boardfiledtolist) {
				boardfiledto.setFile_no(count + "");
				count++;
			}
			service.insert(Notice, boardfiledtolist);
		}
		return "redirect:/admin_notice.do";
	}

	@RequestMapping("/Notice/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("service_notice");
		List<NoticeDTO> noticelist = service.noticeList();
		mav.addObject("noticelist", noticelist);
		return mav;
	}

	@RequestMapping("/admin_notice.do")
	public ModelAndView list2() {
		ModelAndView mav = new ModelAndView("admin_noticelist");
		List<NoticeDTO> noticelist = service.noticeList();
		mav.addObject("noticelist", noticelist);
		return mav;
	}

	// User notice read
	@RequestMapping("/notice/read.do")
	public String read(String notice_no, String state, Model model) {
		NoticeDTO notice = service.getNoticeInfo(notice_no);
		List<BoardFileDTO> boardfiledtolist = boardservice.getFileListNo(notice_no);
		// System.out.println("공지사항boardfiledtolist: " + boardfiledtolist);
		String view = "";
		if (state.equals("READ")) {
			view = "service_noticeread";
		} else {
			view = "service_noticeupdate";
		}
		model.addAttribute("notice", notice);
		model.addAttribute("boardfiledtolist", boardfiledtolist);
		return view;
	}

	// admin notice read
	@RequestMapping("/notice/readadmin.do")
	public String read2(String notice_no, String state, Model model) {
		NoticeDTO notice = service.getNoticeInfo(notice_no);
		List<BoardFileDTO> boardfiledtolist = boardservice.getFileListNo(notice_no);
		// System.out.println("공지사항boardfiledtolist: "+boardfiledtolist);
		String view = "";
		if (state.equals("READ")) {
			view = "service_noticereadadmin";
		} else {
			view = "service_noticeupdate";
		}
		model.addAttribute("notice", notice);
		model.addAttribute("boardfiledtolist", boardfiledtolist);
		return view;
	}

	// delete를 시도하면 로그인 유무를 체크해서 로그인을 하지 않은 사용자는 로그인을 할 수 있도록 로그인페이지로 리다이렉트
	@RequestMapping("/notice/delete.do")
	public String delete(String notice_no, HttpSession session) {
//		MemberDTO user = (MemberDTO) session.getAttribute("user");
		String view = "";
//		if(user==null) { //로그인 하지 않은 상태
//			 view = "redirect:/emp/login.do";
//		}else { //로그인 성공 상태
//			int result = service.delete(Notice_no);
//			view = "redirect:/Notice/list.do?category=all";
//		}
		service.delete(notice_no);
		view = "redirect:/admin_notice.do";
		return view;
	}

	// 실제 업데이트기능을 처리
	@RequestMapping("/notice/update.do")
	public String update(NoticeDTO noticeboard) {
		// System.out.println(noticeboard + "-----------업데이트---------------------");
		service.update(noticeboard);
		return "redirect:/admin_notice.do";
	}

	@RequestMapping("/notice/search.do")
	public ModelAndView search(String tag, String data) {
		ModelAndView mav = new ModelAndView("notice/list");
		List<NoticeDTO> Noticelist = service.search(tag, data);
		// System.out.println(Noticelist);
		mav.addObject("Noticelist", Noticelist);
		return mav;
	}

}
