package com.project.file;

import java.util.List;

public interface BoardFileService {
	//---------------첨부파일----------------
	List<BoardFileDTO> getFileList(String board_no);
	List<BoardFileDTO> getFileListNo(String notice_no);
	BoardFileDTO getFile(BoardFileDTO inputdata);
	BoardFileDTO getFileNo(BoardFileDTO inputdata);
}
