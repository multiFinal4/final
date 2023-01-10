package com.project.map;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.station.StationDTO;

@Repository
public class MapDAOImpl implements MapDAO {
	
	SqlSession session;
	
	public MapDAOImpl() {}

	@Autowired
	public MapDAOImpl(SqlSession session) {
		super();
		this.session = session;
	}

	@Override
	public int insert(MapStationDTO station) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MapStationDTO> stationList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StationDTO> companyList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StationDTO> search(MapStationDTO mDto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<StationDTO> search(String category, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);
		return session.selectList("com.project.station.mapSearch", map);
	}
	
	@Override
	public List<MapStationDTO> findbynameAll(String stationName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MapStationDTO> findByName(String category, String stationName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StationDTO read(String stationId) {
		// TODO Auto-generated method stub
		return null;
	}



}
