package com.project.service;

import java.util.List;

public interface ServiceReply_TBService {
	// ~~1:1문의 답변은 답변삭제, 답변수정기능은 없음!!~~
	
	//1:1문의 답변등록하기
	int insert(ServiceReply_TBDTO reply);
	//1:1문의 답변목록보기
	List<ServiceReply_TBDTO> replyList(String board_no);
	
	//답변상세조회
	Service_TBDTO getBoardInfo(String board_no);
}
