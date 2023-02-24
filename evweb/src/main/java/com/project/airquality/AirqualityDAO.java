package com.project.airquality;

import java.util.List;

import com.project.station.StationDTO;

public interface AirqualityDAO {
	List<AirqualityDTO> readList(String statilonname);
	int insert(AirqualityDTO dto);
	int delete();
	AirqualityDTO read(String stationname);
	List<AirqualityDTO> allReadList();
}
