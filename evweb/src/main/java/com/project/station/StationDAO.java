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
	List<StationDTO> companyList(String manager_id);
	List<StationDTO> findbynameAll(String stationName); 
	List<StationDTO> findByName(String category,String stationName); 
	StationDTO read(String stationId);
	int update(StationDTO station);
	int delete(String stationId);
	int deleteAll();
	List<StationDTO> stationListMgr(String manager_id, String endNo);
	List<StationDTO> stationListMgr(String manager_id);
	List<StationDTO> findByNameMgr(String category, String stationName, String manager_id);
	List<StationDTO> findbynameAllMgr(String stationName,String manager_id); 

}
 