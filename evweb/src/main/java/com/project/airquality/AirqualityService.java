package com.project.airquality;

import java.util.List;

import com.project.station.StationDTO;

public interface AirqualityService {
	List<AirqualityDTO> airqualityList(String stationname);
	int insert(AirqualityDTO dto);
	int delete();
	AirqualityDTO read(StationDTO station);
	List<AirqualityDTO> allReadList();
}
