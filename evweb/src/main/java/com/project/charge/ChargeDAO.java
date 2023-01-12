package com.project.charge;

public interface ChargeDAO {
	int insert(ChargeDTO dto);
	Boolean cheak(String station_id, String charger_id, String start_time);
	String sumchargeAmount(String station_id, String charging_date);
}
