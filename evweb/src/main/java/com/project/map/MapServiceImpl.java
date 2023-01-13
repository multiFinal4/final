package com.project.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.station.StationDTO;

@Service
public class MapServiceImpl implements MapService {
	
	MapDAO dao;
	
	
	public MapServiceImpl() {}
	
	@Autowired
	public MapServiceImpl(MapDAO dao) {
		super();
		this.dao = dao;
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
	public List<StationDTO> search(String category, String keyword) {
		return dao.search(category, keyword);
	}

	@Override
	public List<StationDTO> search(MapStationDTO mDto) {
		// TODO Auto-generated method stub
		return null;
	}



}
