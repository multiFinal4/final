package com.project.station;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StationServiceImpl implements StationService {

	StationDAO dao;
	
	
	@Autowired
	public StationServiceImpl(StationDAO dao) {
		super();
		this.dao = dao;
	}

	@Override
	public int insert(StationDTO station) {
		dao.insert(station);
		return 0;
	}

	@Override
	public List<StationDTO> stationList() {
		return dao.stationList();
	}
	@Override
	public List<StationDTO> stationList(String endNo) {
		return dao.stationList(endNo);
	}
	@Override
	public List<StationDTO> stationListCate(String category) {
		return dao.stationListCate(category);
	}
	@Override
	public List<StationDTO> companyList(){
		return dao.companyList();
	}
	@Override
	public List<StationDTO> findbynameAll(String stationName) {
		return null;
	}
	@Override
	public List<StationDTO> findByName(String category, String stationName) {
		List<StationDTO> list = null;
		if (category != null) {
			if (category.equals("all")) {
				list = dao.findbynameAll(stationName);
			} else {
				list = dao.findByName(category, stationName);
			}
		}
		return list;
	}
	@Override
	public List<StationDTO> stationListCate(String category,String endNo) {
		List<StationDTO> list = null;
		if (category != null) {
			if (category.equals("all")) {
				list = dao.stationList(endNo);
			} else {
				list = dao.stationListCate(category, endNo);
			}
		}
		return list;
	}

	@Override 
	public StationDTO read(String stationId) {
		return dao.read(stationId);
	}

	@Override
	public int update(StationDTO station) {
		return dao.update(station);
	}

	@Override
	public int delete(String stationId) {
		return dao.delete(stationId);
	}

	@Override
	public int deleteAll() {
		return dao.deleteAll();
	}

	@Override
	public List<StationDTO> stationListMgr(String manager_id, String endNo) {
		return dao.stationListMgr(manager_id, endNo);
	}

	@Override
	public List<StationDTO> stationListMgr(String manager_id) {
		return dao.stationListMgr(manager_id);
	}






}
