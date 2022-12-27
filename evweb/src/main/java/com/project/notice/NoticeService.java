package com.project.notice;

import java.util.List;

public interface NoticeService {
		//게시글등록 - tbboard테이블과 board_file테이블에 저장
	//	int insert(NoticeDTO board, List<BoardFileDTO> boardfiledtolist);
	//게시글목록보기
	List<NoticeDTO> boardList();
	//게시글상세조회
	NoticeDTO getBoardInfo(String board_no);
	//게시글수정
	int update(NoticeDTO board);
	//게시글삭제
	int delete(String board_no);
	//제목으로 검색
	List<NoticeDTO> search(String data);
	//제목,작성자, 본문, 작성일별로 검색
	List<NoticeDTO> search(String tag,String data);
	
//	//게시글을 상세보기한 경우 보여질 업로드한 파일의 목록
//	List<BoardFileDTO> getFileList(String boardno);
//	BoardFileDTO getFile(BoardFileDTO inputdata);
}