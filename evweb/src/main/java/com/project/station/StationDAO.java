package com.project.station;

import java.util.List;

import com.project.manager.ManagerDTO;

public interface StationDAO{
	int insert(StationDTO station);
	List<StationDTO> stationList();
	List<StationDTO> stationList(String endNo);
	List<StationDTO> stationListCate(String category);
	List<StationDTO> stationListCate(String category, String endNo);
	List<StationDTO> companyList();
	List<StationDTO> findbynameAll(String stationName); 
	List<StationDTO> findByName(String category,String stationName); 
	StationDTO read(String stationId);
	int update(StationDTO station);
	int delete(String stationId);
	int deleteAll();

}
 