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
	public List<WeatherDTO> readList(String station_id) {
		return sqlSession.selectList("com.project.weather.select",station_id);
	}
	@Override
	public int delete(String station_id) {
		return sqlSession.delete("com.project.weather.delete",station_id);
	}

	
}
