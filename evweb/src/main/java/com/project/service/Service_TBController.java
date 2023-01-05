package com.project.service;

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
public class Service_TBController {
	FileUploadLogic fileuploadService;
	Service_TBService service;
	BoardFileService boardservice;
	@Autowired
	public Service_TBController(Service_TBService service, FileUploadLogic fileuploadService, BoardFileService boardservice) {
		super();
		this.service = service;
		this.fileuploadService = fileuploadService;
		this.boardservice = boardservice;
	}
	
	@RequestMapping(value = "/service/write.do", method = RequestMethod.GET)
	public String insertPage() {
		return "service_insert";
	}
	
	// 1:1문의글 작성하기(글+파일첨부 디비에 정보넘기기)
	@RequestMapping(value = "/service/write.do", method = RequestMethod.POST)
	public String insert(Service_TBDTO board, HttpSession session) throws IllegalStateException, IOException {
		//System.out.println("board=>"+board);
		// 1. MultipartFile정보를 추출하기(바이너리 형태의 파일 데이터 받아오기)
		List<MultipartFile> files = board.getFiles();
		//System.out.println("files?----> "+files);
		
		// 2. 업로드될 서버의 경로 - 실제 서버의 경로를 추출하기 위해서 context의 정보를 담고 있는 ServletContext객체를 추출
		// => ServletContext는 우리가 생성한 프로젝트가 서버에 배포되는 실제 경로와 context에 대한 정보를 담고 있는 객체
		String path = WebUtils.getRealPath(session.getServletContext(), "/WEB-INF/upload");
		//System.out.println("파일패스는?------=> "+path);
		
		// 3. 파일업로드 서비스를 호출해서 실제 서버에 업로드되도록 작업하기
		List<BoardFileDTO> boardfiledtolist = fileuploadService.uploadFiles(files, path);
		// 첨부파일없이 글 등록하면 500에러 해결하기 위해 if문 사용
		//System.out.println("---------------1:1문의 boardfiledtolist-------------"+boardfiledtolist);
		if(boardfiledtolist.equals(null)) {
			service.insert(board);
		}else {
			// 업로드된 파일의 file_no의 값을 셋팅 - 1부터 1,2,3,4....첨부파일마지막번호
			int count = 1;
			for(BoardFileDTO boardfiledto:boardfiledtolist) {
				boardfiledto.setFile_no(count+"");
				count++;
				//System.out.println("1:1문의 boardfiledto????????  "+boardfiledto);
			}
			// 4. 게시글에 대한 일반적인 정보와 첨부되는 파일의 정보를 db에 저장하기
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
	public String read(String board_no,String state,Model model) {
		Service_TBDTO board = service.getBoardInfo(board_no);
		List<BoardFileDTO> boardfiledtolist = boardservice.getFileList(board_no);
		//System.out.println("read.do의 파일리스트 가져오기~!!! "+boardfiledtolist);
		String view = "";
		if(state.equals("READ")) {
			view = "admin_service_read";
		}else {
			view = "admin_service_update";
		}
		model.addAttribute("list", board);
		model.addAttribute("boardfiledtolist", boardfiledtolist);
		return view;
	}
	
	//삭제 시도 시 로그인 유무 체크해서 로그인을 하지 않은 사용자는 로그인을 할 수 있도록 로그인페이지로 리다이렉트 =>추가작업해야함
	@RequestMapping("/service/delete.do")
	public String delete(String board_no) {
		service.delete_file(board_no);
		service.delete_reply(board_no);
		service.delete(board_no);
		return "redirect:/service/list.do?board_category=all";
	}
	
	
	
	
	
//	1:1문의글 수정기능은 없음
//	@RequestMapping("/service/update.do")
//	public String update(Service_TBDTO board) {
//		service.update(board);
//		return "redirect:/service/list.do?category=all";
//	}
	
//	문의글리스트 검색기능 없음(추후 추가될것을 고려해 남겨둠)	
//	@RequestMapping("/service/search.do")
//	public ModelAndView search(String tag,String data) {
//		ModelAndView mav = new ModelAndView("admin_service");
//		List<Service_TBDTO> list = service.search(tag, data);
//		mav.addObject("list", list);
//		return mav;
//	}
	
}





