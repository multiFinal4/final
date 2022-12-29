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
	public List<NoticeDTO> NoticeList() {
		return dao.noticeList();

	}

	@Override
	public NoticeDTO getNoticeInfo(String Notice_no) {
		return dao.read(Notice_no);
	}

	@Override
	public int update(NoticeDTO Notice) {
		return dao.update(Notice);
	}

	@Override
	public int delete(String Notice_no) {
		return dao.delete(Notice_no);
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
	public List<NoticeFileDTO> getFileList(String Noticeno) {
		return dao.getFileList(Noticeno);
	}
	@Override
	public int insert(NoticeDTO Notice, List<NoticeFileDTO> noticefiledtolist) {
		dao.insert(Notice);
		dao.insertFile(noticefiledtolist);
		return 0;
	}

	@Override
	public NoticeFileDTO getFile(NoticeFileDTO inputdata) {
		// TODO Auto-generated method stub
		return dao.getFile(inputdata);
	}
}
