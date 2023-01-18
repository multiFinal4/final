package com.project.airquality;

import java.util.List;

public interface AirqualityDAO {
	List<AirqualityDTO> readList(String stationname);
	int insert(AirqualityDTO dto);
	int delete();
	AirqualityDTO read(String stationname, String datatime);
	
}
