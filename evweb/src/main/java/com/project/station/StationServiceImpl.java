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
	public List<StationDTO> companyList(){
		return dao.companyList();
	}
	@Override
	public List<StationDTO> stationListCate(String category) {
		List<StationDTO> list = null;
		if (category != null) {
			if (category.equals("all")) {
				list = dao.stationList();
			} else {
				list = dao.stationListCate(category);
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



}
