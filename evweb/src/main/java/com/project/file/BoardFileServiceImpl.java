package com.project.file;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class BoardFileServiceImpl implements BoardFileService {
	BoardFileDAO dao;
	@Autowired
	public BoardFileServiceImpl(BoardFileDAO dao) {
		super();
		this.dao = dao;
	}

	//------------------첨부파일-------------------
	@Override
	public List<BoardFileDTO> getFileList(String board_no) {
		return dao.getFileList(board_no);
	}
	
	@Override
	public List<BoardFileDTO> getFileListNo(String notice_no) {
		return dao.getFileListNo(notice_no);
	}

	@Override
	public BoardFileDTO getFile(BoardFileDTO inputdata) {
		return dao.getFile(inputdata);
	}

	@Override
	public BoardFileDTO getFileNo(BoardFileDTO inputdata) {
		return dao.getFileNo(inputdata);
	}
	
}
