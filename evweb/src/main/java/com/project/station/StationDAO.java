package com.project.station;

import java.util.List;

public interface StationDAO{
	int insert(StationDTO station);
	List<StationDTO> stationList();
	List<StationDTO> stationListCate(String category);
	List<StationDTO> companyList();
	StationDTO read(String stationId);
	int update(StationDTO station);
	int delete(String stationId);

}
 