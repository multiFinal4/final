package com.project.service;

import java.util.List;

import com.project.file.BoardFileDTO;

public interface Service_TBDAO {
	//게시글등록
	int insert(Service_TBDTO board);
	//게시글목록보기
	List<Service_TBDTO> boardList();
	
	// --------게시글목록보기(페이징)--------
	List<Service_TBDTO> list(SearchCriteria scri);
	// 게시글 리스트 count
	int listCount(SearchCriteria scri);
	
	//게시글상세조회
	Service_TBDTO getBoardInfo(String board_no);
	//게시글수정
	int update(Service_TBDTO board);
	//게시글삭제
	int delete(String board_no);
	//첨부파일삭제
	int delete_file(String board_no);
	//댓글삭제
	int delete_reply(String board_no);
	//제목,작성자, 본문, 작성일별로 검색
	List<Service_TBDTO> search(String tag,String data);
	//카테고리별로 게시글목록보기
	List<Service_TBDTO> findByCategory(String board_category);
	
	//답변달리면 state '대기'에서 '완료'로 변경하기
	int updateState(String board_no);
	
	//---------------------첨부파일-----------------------
	//첨부파일을 저장하기 위한 메소드	
	int insertFile(List<BoardFileDTO> boardfiledtolist);
	//내문의내역
	List<Service_TBDTO> selectbyId(SearchCriteria scri,String id, String type);
	int listCountId(SearchCriteria scri,String id, String type);
}
