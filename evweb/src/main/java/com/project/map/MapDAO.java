package com.project.map;

import java.util.List;

import com.project.station.StationDTO;

public interface MapDAO {
	MapStationDTO mapStationList(String stationId);
	List<MapStationDTO> mapStationList();
	List<MapStationDTO> search(String category, String keyword);
}
