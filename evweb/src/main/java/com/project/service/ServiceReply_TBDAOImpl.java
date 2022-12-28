package com.project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ServiceReply_TBDAOImpl implements ServiceReply_TBDAO {
	SqlSession sqlSession;
	@Autowired
	public ServiceReply_TBDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
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

	@Override
	public Service_TBDTO getBoardInfo(String board_no) {
		return sqlSession.selectOne("com.project.service.read", board_no);
	}

}