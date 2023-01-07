package com.project.weather;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class WeatherDAOImpl implements WeatherDAO {
	SqlSession sqlSession;
	@Autowired
	public WeatherDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	@Override
	public int insert(WeatherDTO dto) {
		return sqlSession.insert("com.project.weather.insert", dto);
	}
	@Override
	public List<WeatherDTO> readList(String location_no) {
		return sqlSession.selectList("com.project.weather.select",location_no);
	}
	@Override
	public int delete(String location_no) {
		return sqlSession.delete("com.project.weather.delete",location_no);
	}

	
}
