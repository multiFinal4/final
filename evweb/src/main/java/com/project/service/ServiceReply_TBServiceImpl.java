package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ServiceReply_TBServiceImpl implements ServiceReply_TBService {
	ServiceReply_TBDAO dao;
	@Autowired
	public ServiceReply_TBServiceImpl(ServiceReply_TBDAO dao) {
		super();
		this.dao = dao;
	}

	@Override //1:1문의 답변등록하기
	public int insert(ServiceReply_TBDTO reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override //1:1문의 답변목록보기
	public List<ServiceReply_TBDTO> replyList(String board_no) {
		// TODO Auto-generated method stub
		return null;
	}

}
