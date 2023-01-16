package com.project.airquality;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AirqualityDAOImpl implements AirqualityDAO{
//	SqlSession sqlSession;
//	
//	public AirqualityDAOImpl(SqlSession sqlSession) {
//		super();
//		this.sqlSession = sqlSession;
//	}
//	
//	@Override
//	public List<AirqualityDTO> readList(String stationname) {
//		return sqlSession.selectList("com.project.airquality.select", stationname);
//	}
//
//	@Override
//	public int insert(AirqualityDTO dto) {
//		return sqlSession.insert("com.project.airquality.insert", dto);
//	}
//
//	@Override
//	public int delete(String stationname) {
//		return sqlSession.delete("com.project.airquality.delete",stationname);
//	}
//
//	@Override
//	public AirqualityDTO read(String stationname, String datatime) {
//		HashMap<String, String> map = new HashMap<String, String>();
//		map.put("stationname", stationname);
//		map.put("datatime", datatime);
//		return sqlSession.selectOne("com.project.airquality.read",map);
//	}

}
