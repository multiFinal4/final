package com.project.ranking;

public class RankingDTO {
	private String station_name;
	private double charging_amount;
	
	public RankingDTO() {};
	public RankingDTO(String station_name, double charging_amount) {
		super();
		this.station_name = station_name;
		this.charging_amount = charging_amount;
	}
	@Override
	public String toString() {
		return "RankingDTO [station_name=" + station_name + ", charging_amount=" + charging_amount + "]";
	}
	public String getStation_name() {
		return station_name;
	}
	public void setStation_name(String station_name) {
		this.station_name = station_name;
	}
	public double getCharging_amount() {
		return charging_amount;
	}
	public void setCharging_amount(double charging_amount) {
		this.charging_amount = charging_amount;
	}
	
}
