package com.project.notice;

import java.util.List;

public class NoticeServiceImpl implements NoticeService{
	NoticeDAO dao;
	
	public NoticeServiceImpl() {
	}
	
	public NoticeServiceImpl(NoticeDAO dao) {
		super();
		this.dao = dao;
	}

	@Override
	public List<NoticeDTO> boardList() {
		
		return null;
	}

	@Override
	public NoticeDTO getBoardInfo(String board_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(NoticeDTO board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String board_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NoticeDTO> search(String data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<NoticeDTO> search(String tag, String data) {
		// TODO Auto-generated method stub
		return null;
	}

}
