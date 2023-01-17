package com.project.airquality;

import java.util.List;

public interface AirqualityService {
	List<AirqualityDTO> airqualityList(String stationname);
	int insert(AirqualityDTO dto);
	int delete(String stationname);
	AirqualityDTO read(String stationname, String datatime);
}
