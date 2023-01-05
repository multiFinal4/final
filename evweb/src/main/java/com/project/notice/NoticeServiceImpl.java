package com.project.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.file.BoardFileDTO;

@Service
public class NoticeServiceImpl implements NoticeService{
	NoticeDAO dao;
	
	public NoticeServiceImpl() {
	}
	
	@Autowired
	public NoticeServiceImpl(NoticeDAO dao) {
		super();
		this.dao = dao;
	}

	@Override
	public List<NoticeDTO> noticeList() {
		return dao.noticeList();
	}

	@Override
	public NoticeDTO getNoticeInfo(String notice_no) {
		return dao.read(notice_no);
	}

	@Override
	public int update(NoticeDTO notice) {
		return dao.update(notice);
	}

	@Override
	public int delete(String notice_no) {
		return dao.delete(notice_no);
	}

	@Override
	public List<NoticeDTO> search(String data) {
		return dao.search(data);
	}

	@Override
	public List<NoticeDTO> search(String tag, String data) {
		return dao.search(tag, data);
	}
	
	@Override
	public int insert(NoticeDTO Notice, List<BoardFileDTO> boardfiledtolist) {
		dao.insert(Notice);
		dao.insertFile(boardfiledtolist);
		return 0;
	}

//	@Override
//	public BoardFileDTO getFile(BoardFileDTO inputdata) {
//		// TODO Auto-generated method stub
//		return /*dao.getFile(inputdata);*/ null;
//	}
//
//	@Override
//	public List<BoardFileDTO> getFileList(String notice_no) {
//		return dao.getFileList(notice_no);
//	}

}
