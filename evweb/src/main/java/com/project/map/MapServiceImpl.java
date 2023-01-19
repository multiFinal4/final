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
	public List<MapStationDTO> search(String category, String keyword) {
		return dao.search(category, keyword);
	}

	@Override
	public MapStationDTO mapStationList(String stationId) {
		return dao.mapStationList(stationId);
	}

	@Override
	public List<MapStationDTO> mapStationList() {
		return dao.mapStationList();
	}



}
