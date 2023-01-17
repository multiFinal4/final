package com.project.airquality;

public class AirqualityDTO {
	private String stationname; //측정소 이름
	private String datatime;	//데이터 시간
	private String pm10;		//미세먼지
	private String pm25;		//초미세먼지
	
	public AirqualityDTO() {
		super();
	}
	
	public AirqualityDTO(String datatime, String pm10, String pm25, String stationname) {
		super();
		this.datatime = datatime;
		this.pm10 = pm10;
		this.pm25 = pm25;
		this.stationname = stationname;
	}
	
	public AirqualityDTO(String stationname) {
		super();
		this.stationname = stationname;
	}

	@Override
	public String toString() {
		return "AirqualityDTO [datatime=" + datatime + ", pm10=" + pm10 + ", pm25=" + pm25 + ", stationname="
				+ stationname + "]";
	}

	public String getdatatime() {
		return datatime;
	}

	public void setdatatime(String datatime) {
		this.datatime = datatime;
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

	public String getstationname() {
		return stationname;
	}

	public void setstationname(String stationname) {
		this.stationname = stationname;
	}
	
}
