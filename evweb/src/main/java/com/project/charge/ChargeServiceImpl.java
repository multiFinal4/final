package com.project.charge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChargeServiceImpl implements ChargeService {
	ChargeDAO dao;
	@Autowired
	public ChargeServiceImpl(ChargeDAO dao) {
		super();
		this.dao = dao;
	}
	@Override
	public int insert(ChargeDTO dto) {
		return dao.insert(dto);
	}
	@Override
	public Boolean cheak(String station_id, String charger_id, String start_time) {
		return dao.cheak(station_id, charger_id, start_time);
	}
	@Override
	public String sumchargeAmount(String station_id, String charging_date) {
		return dao.sumchargeAmount(station_id, charging_date);
	}
	
}
