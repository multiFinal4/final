package com.project.ranking;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RankingDAOImpl implements RankingDAO {
	SqlSession sqlSession;
	public RankingDAOImpl() {};
	@Autowired
	public RankingDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	@Override
	public List<RankingDTO> chargingAmountRank() {
		return sqlSession.selectList("com.project.ranking.chargingAmountRank");
	}
}
