package com.project.airquality;

public class AirqualityDTO {
	private String dataTime;
	private String pm10;
	private String pm25;
	private String stationName;
	
	public AirqualityDTO() {
	}
	
	public AirqualityDTO(String dataTime, String pm10, String pm25, String stationName) {
		super();
		this.dataTime = dataTime;
		this.pm10 = pm10;
		this.pm25 = pm25;
		this.stationName = stationName;
	}

	@Override
	public String toString() {
		return "AirqualityDTO [dataTime=" + dataTime + ", pm10=" + pm10 + ", pm25=" + pm25 + ", stationName="
				+ stationName + "]";
	}

	public String getDataTime() {
		return dataTime;
	}

	public void setDataTime(String dataTime) {
		this.dataTime = dataTime;
	}

	public String getPm10() {
		return pm10;
	}

	public void setPm10(String pm10) {
		this.pm10 = pm10;
	}

	public String getPm25() {
		return pm25;
	}

	public void setPm25(String pm25) {
		this.pm25 = pm25;
	}

	public String getStationName() {
		return stationName;
	}

	public void setStationName(String stationName) {
		this.stationName = stationName;
	}
	
}
