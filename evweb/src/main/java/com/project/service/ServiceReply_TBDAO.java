package com.project.service;

import java.util.List;

public interface ServiceReply_TBDAO {
	//  1:1문의 답변 삭제, 수정기능은 없음!!
	
	//1:1문의 답변등록
	int insert(ServiceReply_TBDTO reply);
	//1:1문의 답변목록보기
	List<ServiceReply_TBDTO> replyList(String board_no);
}
