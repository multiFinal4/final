package com.project.charge;

import java.util.List;

public interface ChargeService {
	int insert(ChargeDTO dto);
	Boolean cheak(String station_id, String charger_id, String start_time);
	String sumchargeAmount(String station_id, String charging_date);
	List<ChargeDTO> list(String station_id, String charging_date);
}
