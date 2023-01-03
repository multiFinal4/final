package com.project.map;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.station.StationDTO;

@Service
public class MapServiceImpl implements MapService {

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
