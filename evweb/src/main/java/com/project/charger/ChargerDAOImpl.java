package com.project.charger;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public class ChargerDAOImpl implements ChargerDAO {

	SqlSession sqlSession;
	
	public ChargerDAOImpl(){}
	@Autowired
	public ChargerDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int insert(ChargerDTO charger) {
		return sqlSession.insert("com.project.charger.insert", charger);
	}

	@Override
	public List<ChargerDTO> chargerList() {
		return sqlSession.selectList("com.project.charger.selectAll");
	}

	@Override
	public List<ChargerDTO> chargerList(String stationId) {
		return sqlSession.selectList("com.project.charger.findById", stationId);
	}

	@Override
	public List<ChargerDTO> chargerList(Map<String, Object> select) {
		return null;
	}

	@Override
	public ChargerDTO info(String stationId, String chargerId) {
		return null;
	}
	@Override
	public int deleteAll() {
		return sqlSession.delete("com.project.charger.delAll");
	}

}
