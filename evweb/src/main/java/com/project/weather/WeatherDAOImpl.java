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
		System.out.println(dto);
		return sqlSession.insert("com.project.weather.insert", dto);
	}
	@Override
	public List<WeatherDTO> readList() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int delete(String day, String time) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
