package com.project.weather;

public class WeatherAPIDTO {
	 private String baseURL;
	 private String ServiceKey; 
	 private String pageNo;
	 private String numOfRows; 
	 private String dataType;
	 private String base_date;
	 private String base_time; 
	 private String nx; 
	 private String ny;
	 
	public WeatherAPIDTO() {
	}
	public WeatherAPIDTO(String baseURL, String serviceKey, String pageNo, String numOfRows, String dataType,
			String base_date, String base_time, String nx, String ny) {
		super();
		this.baseURL = baseURL;
		ServiceKey = serviceKey;
		this.pageNo = pageNo;
		this.numOfRows = numOfRows;
		this.dataType = dataType;
		this.base_date = base_date;
		this.base_time = base_time;
		this.nx = nx;
		this.ny = ny;
	}
	
	@Override
	public String toString() {
		return "WeatherAPIDTO [baseURL=" + baseURL + ", ServiceKey=" + ServiceKey + ", pageNo=" + pageNo
				+ ", numOfRows=" + numOfRows + ", dataType=" + dataType + ", base_date=" + base_date + ", base_time="
				+ base_time + ", nx=" + nx + ", ny=" + ny + "]";
	}
	public String getBaseURL() {
		return baseURL;
	}
	public void setBaseURL(String baseURL) {
		this.baseURL = baseURL;
	}
	public String getServiceKey() {
		return ServiceKey;
	}
	public void setServiceKey(String serviceKey) {
		ServiceKey = serviceKey;
	}
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	public String getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(String numOfRows) {
		this.numOfRows = numOfRows;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public String getBase_date() {
		return base_date;
	}
	public void setBase_date(String base_date) {
		this.base_date = base_date;
	}
	public String getBase_time() {
		return base_time;
	}
	public void setBase_time(String base_time) {
		this.base_time = base_time;
	}
	public String getNx() {
		return nx;
	}
	public void setNx(String nx) {
		this.nx = nx;
	}
	public String getNy() {
		return ny;
	}
	public void setNy(String ny) {
		this.ny = ny;
	} 
	
	
}
