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
		return sqlSession.delete("com.project.service.reply_insert", reply);
	}

	@Override //1:1문의 답변목록보기
	public List<ServiceReply_TBDTO> replyList(String board_no) {
		return sqlSession.selectList("com.project.service.reply_select", board_no);
	}

}
