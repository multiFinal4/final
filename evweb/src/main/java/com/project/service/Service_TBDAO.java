package com.project.service;

import java.util.List;


public interface Service_TBDAO {
	//게시글등록  - tbboard테이블과 board_file테이블에 저장
	int insert(Service_TBDTO board);
	//게시글목록보기
	List<Service_TBDTO> boardList();
	//게시글상세조회
	Service_TBDTO getBoardInfo(String board_no);
	//게시글수정
	int update(Service_TBDTO board);
	//게시글삭제
	int delete(String board_no);
	//제목,작성자, 본문, 작성일별로 검색
	List<Service_TBDTO> search(String tag,String data);
	List<Service_TBDTO> findByCategory(String category);
}
