package com.project.map;

import java.util.List;

import com.project.station.StationDTO;

public interface MapService {
	int insert(MapStationDTO station);
	List<MapStationDTO> stationList();
	List<StationDTO> companyList();
	List<StationDTO> search(String category, String keyword);
	List<StationDTO> search(MapStationDTO mDto);
}
