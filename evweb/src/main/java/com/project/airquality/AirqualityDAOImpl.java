package com.project.airquality;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AirqualityDAOImpl implements AirqualityDAO{
	SqlSession sqlSession;
	
	@Autowired
	public AirqualityDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<AirqualityDTO> readList(String stationname) {
		return sqlSession.selectList("com.project.airquality.select", stationname);
	}

	@Override
	public int insert(AirqualityDTO dto) {
		return sqlSession.insert("com.project.airquality.insert", dto);
	}

	@Override
	public int delete() {
		return sqlSession.delete("com.project.airquality.delete");
	}

	@Override
	public AirqualityDTO read(String stationname) {
		return sqlSession.selectOne("com.project.airquality.read", stationname);
	}

}
