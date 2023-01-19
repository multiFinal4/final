package com.project.airquality;

public class AirqualityDTO {
	private String stationname; //측정소 이름
	private String datatime;	//데이터 시간
	private String pm10value;		//미세먼지
	private String pm25value;		//초미세먼지
	
	public AirqualityDTO() {
		super();
	}

	public AirqualityDTO(String stationname, String datatime, String pm10value, String pm25value) {
		super();
		this.stationname = stationname;
		this.datatime = datatime;
		this.pm10value = pm10value;
		this.pm25value = pm25value;
	}

	@Override
	public String toString() {
		return "AirqualityDTO [stationname=" + stationname + ", datatime=" + datatime + ", pm10value=" + pm10value
				+ ", pm25value=" + pm25value + "]";
	}

	public String getStationname() {
		return stationname;
	}

	public void setStationname(String stationname) {
		this.stationname = stationname;
	}

	public String getDatatime() {
		return datatime;
	}

	public void setDatatime(String datatime) {
		this.datatime = datatime;
	}

	public String getPm10value() {
		return pm10value;
	}

	public void setPm10value(String pm10value) {
		this.pm10value = pm10value;
	}

	public String getPm25value() {
		return pm25value;
	}

	public void setPm25value(String pm25value) {
		this.pm25value = pm25value;
	}
	
	
	
}
