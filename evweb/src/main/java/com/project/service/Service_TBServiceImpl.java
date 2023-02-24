package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.file.BoardFileDTO;
@Service
public class Service_TBServiceImpl implements Service_TBService {
	Service_TBDAO dao;
	@Autowired
	public Service_TBServiceImpl(Service_TBDAO dao) {
		super();
		this.dao = dao;
	}
	
	// 게시글등록 - 첨부파일 없이
	@Override
	public int insert(Service_TBDTO board) {
		return dao.insert(board);
	}

	// 게시글+첨부파일 등록
	// => 게시글기본정보 저장, 첨부된 파일에 대한 정보 저장. 
	// dao클래스에 정의된 글등록, 파일등록 두 개의 기능을 각각 실행(메소드 둘 다 호출)
	@Override
	public int insert(Service_TBDTO board, List<BoardFileDTO> boardfiledtolist) {
		dao.insert(board);
		dao.insertFile(boardfiledtolist);
		return 0;
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
	public int delete_file(String board_no) {  //게시글 삭제 전 파일삭제
		return dao.delete_file(board_no);
	}
	@Override
	public int delete_reply(String board_no) {  //게시글 삭제 전 댓글삭제
		return dao.delete_reply(board_no);
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
	
	//1:1문의 글에 답변달리면 state -> '대기'에서 '완료'상태로 변경하기
	@Override
	public int updateState(String board_no) {
		return dao.updateState(board_no);
	}

	
	//---------------------페이징-----------------------
	@Override
	public List<Service_TBDTO> list(SearchCriteria scri) {
		return dao.list(scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri) {
		return dao.listCount(scri);
	}

	@Override
	public List<Service_TBDTO> selectbyId(SearchCriteria scri,String id, String type) {
		return dao.selectbyId(scri, id, type);
	}

	@Override
	public int listCountId(SearchCriteria scri, String id, String type) {
		return dao.listCountId(scri, id, type);
	}

}



