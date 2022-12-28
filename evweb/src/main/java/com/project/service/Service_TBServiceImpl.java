package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class Service_TBServiceImpl implements Service_TBService {
	Service_TBDAO dao;
	@Autowired
	public Service_TBServiceImpl(Service_TBDAO dao) {
		super();
		this.dao = dao;
	}

	@Override
	public int insert(Service_TBDTO board) {
		return dao.insert(board);
	}

	@Override
	public List<Service_TBDTO> boardList() {
		return dao.boardList();
	}

	@Override
	public Service_TBDTO getBoardInfo(String board_no) {
		return dao.getBoardInfo(board_no);
	}

	@Override
	public int update(Service_TBDTO board) {
		return dao.update(board);
	}

	@Override
	public int delete(String board_no) {
		return dao.delete(board_no);
	}

	@Override
	public List<Service_TBDTO> search(String tag, String data) {
		return dao.search(tag, data);
	}

	@Override
	public List<Service_TBDTO> findByCategory(String board_category) {
		List<Service_TBDTO> list = null;
		if(board_category!=null) {
			if(board_category.equals("all")) {
				list = dao.boardList();
			}else {
				list = dao.findByCategory(board_category);
			}
		}
		return list;
	}

}



