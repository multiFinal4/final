package com.project.file;

import java.util.List;

public interface BoardFileDAO {
	//게시글을 상세보기한 경우 보여질 업로드한 파일의 목록 조회
	List<BoardFileDTO> getFileList(String board_no);
	List<BoardFileDTO> getFileListNo(String notice_no);
	BoardFileDTO getFile(BoardFileDTO inputdata);
	BoardFileDTO getFileNo(BoardFileDTO inputdata);
}
