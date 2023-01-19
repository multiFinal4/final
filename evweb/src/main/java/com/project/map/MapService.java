package com.project.map;

import java.util.List;

import com.project.station.StationDTO;

public interface MapService {
	MapStationDTO mapStationList(String stationId);
	List<StationDTO> search(String category, String keyword);
}
