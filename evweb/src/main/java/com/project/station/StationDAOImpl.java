package com.project.station;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StationDAOImpl implements StationDAO {

	SqlSession sqlSession;
	
	
	@Autowired
	public StationDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public int insert(StationDTO station) {
		return sqlSession.insert("com.project.station.insert", station);
	}
 
	@Override
	public List<StationDTO> stationList() {
		return sqlSession.selectList("com.project.station.selectall");
	} 
	@Override
	public List<StationDTO> companyList() {
		return sqlSession.selectList("com.project.station.selectCom");
	}
	@Override
	public List<StationDTO> stationListCate(String category) {
		return sqlSession.selectList("com.project.station.categorySelect", category);
	}

	@Override
	public StationDTO read(String stationId) {
		return sqlSession.selectOne("com.project.station.read", stationId);
	}

	@Override
	public int update(StationDTO station) {
		return sqlSession.update("com.project.station.update", station);
	}

	@Override
	public int delete(String stationId) {
		return sqlSession.delete("com.project.station.del", stationId);
	}



}
