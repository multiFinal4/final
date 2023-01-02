package com.project.file;

import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

// 파일첨부 insert메소드는 Service_TBController에 구현함

@Controller
public class BoardFileController {
	BoardFileService service;
	@Autowired
	public BoardFileController(BoardFileService service) {
		super();
		this.service = service;
	}
	// ResponseEntity는 HttpEntity의 하위객체
	// HttpEntity => Http요청과 응답을 관리하는 객체 - 요청헤더, 바디, 응답헤더, 바디를 관리하는 객체
	// ResponseEntity => 응답의 데이터를 관리하는 객체 - Http헤더, Http바디, Http상태정보..
	// UrlResource => 파일객체를 다루기 위해서 스프링내부에서 사용하는 객체
	
	// 첨부파일 다운로드하기
	@RequestMapping("/service/download/{manager_id}/{board_no}/{file_no}")
	public ResponseEntity<UrlResource> downloadFile(@PathVariable String manager_id,@PathVariable String board_no,
													@PathVariable String file_no, HttpSession session) throws MalformedURLException, FileNotFoundException, UnsupportedEncodingException {
		//System.out.println(manager_id+", "+board_no+", "+file_no);
		// 1. 파일을 다운로드하기 위해서 디비에 저장된 파일의 정보를 가져오기 - 다운로드를 요청한 경우 요청된 파일을 resposne
		BoardFileDTO selectFileInfo =  service.getFile(new BoardFileDTO("", Integer.valueOf(board_no), file_no, "", ""));
		//System.out.println("selectFileInfo =====> "+selectFileInfo);
		
		// 2. 파일명을 이용해서 다운로드할 파일을 객체로 생성하기
		// UrlResource resource = new UrlResource("file:"+파일의 풀 경로);
		// WebUtil => 실제 서버가 인식하는 우리 프로젝트의 경로를 추출하기 위해 사용하는 클래스
		// getRealPath => 실제 서버에 배포된 프로젝트의 위치를 구하는 메소드
		// /WEB-INF/upload 이 위치에 지정
		UrlResource resource = 
				new UrlResource("file:"+WebUtils.getRealPath(session.getServletContext(), 
						"/WEB-INF/upload/"+selectFileInfo.getStoreFilename()));
		
		// 3. 파일명에 한글이 있는 경우 오류가 발생하지 않도록 처리 - 다운로드되는 파일명
		String encodedFilename = UriUtils.encode(selectFileInfo.getOriginalFilename(), "UTF-8");
		// 응답헤더의 CONTENT_DISPOSITION속성에 셋팅할 문자열의 형식. 이 형식으로 지정해야 파일다운로드를 할 수 있다.
		String mycontenttype = "attachment; filename=\"" + encodedFilename +"\"";
		//System.out.println(selectFileInfo);
		
		// 4. 파일다운로드
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, mycontenttype)
				.body(resource);
		
		// .ok() : 정상응답
		// => ok는 http응답의 header와 body를 만들 수 있는 객체인 BodyBuilder를 리턴한다.
	}
}
