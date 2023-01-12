package com.project.charge;

import java.sql.Date;

public class ChargeDTO {
	private String station_id;
	private String charger_id;
	private	String charging_date;
	private String start_time;
	private String end_time;
	private double charging_amount;
	
	
	public ChargeDTO() {
	}
	public ChargeDTO(String station_id, String charger_id ) {
		super();
		this.charger_id = charger_id;
		this.station_id = station_id;
	}
	public ChargeDTO(String station_id, String charger_id, String charging_date, String start_time, String end_time,
			double charging_amount) {
		super();
		this.station_id = station_id;
		this.charger_id = charger_id;
		this.charging_date = charging_date;
		this.start_time = start_time;
		this.end_time = end_time;
		this.charging_amount = charging_amount;
	}
	@Override
	public String toString() {
		return "ChargeDTO [station_id=" + station_id + ", charger_id=" + charger_id + ", charging_date=" + charging_date
				+ ", start_time=" + start_time + ", end_time=" + end_time + ", charging_amount=" + charging_amount
				+ "]";
	}
	public String getStation_id() {
		return station_id;
	}
	public void setStation_id(String station_id) {
		this.station_id = station_id;
	}
	public String getCharger_id() {
		return charger_id;
	}
	public void setCharger_id(String charger_id) {
		this.charger_id = charger_id;
	}
	public String getCharging_date() {
		return charging_date;
	}
	public void setCharging_date(String charging_date) {
		this.charging_date = charging_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public double getCharging_amount() {
		return charging_amount;
	}
	public void setCharging_amount(double charging_amount) {
		this.charging_amount = charging_amount;
	}
	
	
}
