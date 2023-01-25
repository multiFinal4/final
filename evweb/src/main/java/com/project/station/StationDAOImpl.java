package com.project.station;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		if(station.getStation_company().equals("환경부")) {
			station.setManager_id("EV002");
		}else if (station.getStation_company().equals("한국EV충전서비스센터")) {
			station.setManager_id("EV003");
		}else if (station.getStation_company().equals("보타리에너지")) {
			station.setManager_id("EV004");
		}else if (station.getStation_company().equals("블루네트웍스")) {
			station.setManager_id("EV005");
		}else if (station.getStation_company().equals("씨어스")) {
			station.setManager_id("EV006");
		}else {
			station.setManager_id("EV001");
		}
		return sqlSession.insert("com.project.station.insert", station);
	}

	@Override
	public List<StationDTO> stationList() {
		return sqlSession.selectList("com.project.station.list");
	}
	@Override
	public List<StationDTO> stationList(String endNo) {
		return sqlSession.selectList("com.project.station.selectall", endNo);
	} 
	@Override
	public List<StationDTO> stationListCate(String category) {
		return sqlSession.selectList("com.project.station.listCate", category);
	}
	@Override
	public List<StationDTO> stationListCate(String category, String endNo) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("endNo", endNo);
		return sqlSession.selectList("com.project.station.categorySelect", map);
	}
	@Override
	public List<StationDTO> companyList() {
		return sqlSession.selectList("com.project.station.selectCom");
	}
	@Override
	public List<StationDTO> companyList(String manager_id) {
		return sqlSession.selectList("com.project.station.selectComMgr",manager_id);
	}
	@Override
	public List<StationDTO> findbynameAll(String stationName) {
		return sqlSession.selectList("com.project.station.findbynameAll", stationName);
	}
	@Override
	public List<StationDTO> findByName(String category, String stationName) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("stationName", stationName);	
		return sqlSession.selectList("com.project.station.findbyname",map);
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

	@Override
	public int deleteAll() {
		return sqlSession.delete("com.project.station.delAll");
	}

	@Override
	public List<StationDTO> stationListMgr(String manager_id, String endNo) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("manager_id", manager_id);
		map.put("endNo", endNo);	
		return sqlSession.selectList("com.project.station.selectmanager",map);
	}

	@Override
	public List<StationDTO> stationListMgr(String manager_id) {
		return sqlSession.selectList("com.project.station.listMgr",manager_id);
	}
	@Override
	public List<StationDTO> findByNameMgr(String category, String stationName,String manager_id) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("manager_id", manager_id);
		map.put("category", category);
		map.put("stationName", stationName);	
		return sqlSession.selectList("com.project.station.findbynameMgr",map);
	}
	@Override
	public List<StationDTO> findbynameAllMgr(String stationName, String manager_id) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("manager_id", manager_id);
		map.put("stationName", stationName);	
		return sqlSession.selectList("com.project.station.findbynameAllMgr", map);
	}
	


}
