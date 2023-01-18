package com.project.weather;

import java.util.HashMap;
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
	public List<WeatherDTO> readList(String nx,String ny) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("nx", nx);
		map.put("ny", ny);
		return sqlSession.selectList("com.project.weather.select",map);
	}
	@Override
	public int delete(String nx,String ny) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("nx", nx);
		map.put("ny", ny);
		return sqlSession.delete("com.project.weather.delete",map);
	}
	@Override
	public WeatherDTO read(String nx,String ny, String day, String time) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("nx", nx);
		map.put("ny", ny);
		map.put("day", day);
		map.put("time", time);
		return sqlSession.selectOne("com.project.weather.read",map);
	}

	
}
