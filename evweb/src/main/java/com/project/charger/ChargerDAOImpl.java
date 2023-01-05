package com.project.charger;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChargerDAOImpl implements ChargerDAO{
	SqlSession sqlSession;
	public ChargerDAOImpl() {};
	@Autowired
	public ChargerDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ChargerDTO> chargerlist() {
		return sqlSession.selectList("com.project.charger.chargerlist");
	}

}
