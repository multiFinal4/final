package com.project.file;

import java.util.List;

public interface BoardFileService {
	//---------------첨부파일----------------
	List<BoardFileDTO> getFileList(String board_no);
	BoardFileDTO getFile(BoardFileDTO inputdata);
}
