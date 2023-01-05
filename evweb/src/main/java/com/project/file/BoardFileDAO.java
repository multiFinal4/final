package com.project.file;

import java.util.List;

public interface BoardFileDAO {
	//---------------------첨부파일-----------------------
	//첨부파일을 저장하기 위한 메소드	 => Service_TBService.java에 있음
	
	//게시글을 상세보기한 경우 보여질 업로드한 파일의 목록 조회
	List<BoardFileDTO> getFileList(String board_no);
	BoardFileDTO getFile(BoardFileDTO inputdata);
}
