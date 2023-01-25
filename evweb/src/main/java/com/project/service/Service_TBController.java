package com.project.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.project.file.BoardFileDTO;
import com.project.file.BoardFileService;
import com.project.file.FileUploadLogic;

@Controller
public class Service_TBController {
	FileUploadLogic fileuploadService;
	Service_TBService service;
	BoardFileService boardservice;
	ServiceReply_TBService servicereply;
	@Autowired
	public Service_TBController(Service_TBService service, FileUploadLogic fileuploadService, BoardFileService boardservice, ServiceReply_TBService servicereply) {
		super();
		this.service = service;
		this.fileuploadService = fileuploadService;
		this.boardservice = boardservice;
		this.servicereply = servicereply;
	}
	
	@RequestMapping(value = "/service/write.do", method = RequestMethod.GET)
	public String insertPage() {
		return "service_insert";
	}
	
	// 1:1문의글 작성하기(글+파일첨부 디비에 정보넘기기)
	@RequestMapping(value = "/service/write.do", method = RequestMethod.POST)
	public String insert(Service_TBDTO board, HttpSession session) throws IllegalStateException, IOException {
		List<MultipartFile> files = board.getFiles();
		String path = "/opt/tomcat/webapps/upload";
		// String path = WebUtils.getRealPath(session.getServletContext(), "/WEB-INF/upload");
		List<BoardFileDTO> boardfiledtolist = fileuploadService.uploadFiles(files, path);
		if(boardfiledtolist.isEmpty()) {
			service.insert(board);
		}else {
			int count = 1;
			for(BoardFileDTO boardfiledto:boardfiledtolist) {
				boardfiledto.setFile_no(count+"");
				count++;
			}
			service.insert(board, boardfiledtolist);
		}
		return "redirect:/insertok.do";
	}
	
	
	@RequestMapping("/service/list.do")
	public ModelAndView list(String board_category) {
		ModelAndView mav = new ModelAndView("admin_service");
		List<Service_TBDTO> list = service.findByCategory(board_category);
		mav.addObject("board_category", board_category);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/service/read.do")
	public String read(String board_no, Model model, @ModelAttribute("scri") SearchCriteria scri) {
		Service_TBDTO board = service.getBoardInfo(board_no);
		List<BoardFileDTO> boardfiledtolist = boardservice.getFileList(board_no);
		model.addAttribute("list", board);
		model.addAttribute("boardfiledtolist", boardfiledtolist);
		model.addAttribute("scri", scri);
		
		//댓글
		List<ServiceReply_TBDTO> replylist = servicereply.replyList(board_no);
		model.addAttribute("replylist", replylist);
		
		return "admin_service_read";
	}
	
	
	@RequestMapping("/service/delete.do")
	public String delete(String board_no, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) {
		service.delete_file(board_no);
		service.delete_reply(board_no);
		service.delete(board_no);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/service/boardListPaging.do";
	}
	
	
	@RequestMapping("/service/boardListPaging.do")
	public String boardListPaging(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		model.addAttribute("list", service.list(scri));
		
		PageDTO pageMaker = new PageDTO();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		return "admin_service";
	}
	
	
	
	
//	1:1문의글 수정기능은 없음
//	@RequestMapping("/service/update.do")
//	public String update(Service_TBDTO board) {
//		service.update(board);
//		return "redirect:/service/list.do?category=all";
//	}

	
}





