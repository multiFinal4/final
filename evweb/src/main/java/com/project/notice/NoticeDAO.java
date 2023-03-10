package com.project.notice;

import java.util.List;

import com.project.file.BoardFileDTO;


public interface NoticeDAO {
	//게시글등록 - db에 처리
	int insert(NoticeDTO noticeBoard);
	//게시글목록보기 - db에 처리
	List<NoticeDTO> noticeList();
	//게시글상세조회 - db에 처리
	NoticeDTO read(String notice_no);
	//게시글수정 - db에 처리
	int update(NoticeDTO noticeBoard);
	//게시글삭제 - db에 처리
	int delete(String notice_no);
	//제목으로 검색
	List<NoticeDTO> search(String data);
	//제목,작성자, 본문, 작성일별로 검색
	List<NoticeDTO> search(String tag,String data);
	
	// *************** 첨파 ***************
	//첨부파일을 저장하기 위한 메소드
	int insertFile(List<BoardFileDTO> boardfiledtolist);
//	List<BoardFileDTO> getFileList(String notice_no);
//	BoardFileDTO getFile(String inputdata);

}
