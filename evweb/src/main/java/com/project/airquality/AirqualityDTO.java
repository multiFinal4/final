package com.project.airquality;

public class AirqualityDTO {
	private String stationName; //측정소 이름
	private String dataTime;	//데이터 시간
	private String pm10;		//미세먼지
	private String pm25;		//초미세먼지
	
	public AirqualityDTO() {
		super();
	}
	
	public AirqualityDTO(String dataTime, String pm10, String pm25, String stationName) {
		super();
		this.dataTime = dataTime;
		this.pm10 = pm10;
		this.pm25 = pm25;
		this.stationName = stationName;
	}
	
	public AirqualityDTO(String stationName) {
		super();
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
