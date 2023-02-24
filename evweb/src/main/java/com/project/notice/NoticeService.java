package com.project.notice;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.file.BoardFileDTO;

@Service
public interface NoticeService {
		//게시글등록 - tbNotice테이블과 Notice_file테이블에 저장
	int insert(NoticeDTO Notice, List<BoardFileDTO> boardfiledtolist);
	//게시글 그냥 등록
	int insert(NoticeDTO Notice);
	//게시글목록보기
	List<NoticeDTO> noticeList();
	//게시글상세조회
	NoticeDTO getNoticeInfo(String Notice_no);
	//게시글수정
	int update(NoticeDTO Notice);
	//게시글삭제
	int delete(String notice_no);
	//제목으로 검색
	List<NoticeDTO> search(String data);
	//제목,작성자, 본문, 작성일별로 검색
	List<NoticeDTO> search(String tag,String data);
	//게시글을 상세보기한 경우 보여질 업로드한 파일의 목록
//	List<BoardFileDTO> getFileList(String boardno);
//	BoardFileDTO getFile(BoardFileDTO inputdata);
}