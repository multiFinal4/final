package com.project.charge;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChargeDAOImpl implements ChargeDAO {
	SqlSession sqlSession;
	
	@Autowired
	public ChargeDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	
	
}
