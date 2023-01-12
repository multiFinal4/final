package com.project.weather;

public class WeatherAPIDTO {
	 private String base_date;
	 private String base_time; 
	 private String nx; 
	 private String ny;
	 
	public WeatherAPIDTO() {
	}
	
	public WeatherAPIDTO(String base_date, String base_time, String nx, String ny) {
		super();
		this.base_date = base_date;
		this.base_time = base_time;
		this.nx = nx;
		this.ny = ny;
	}

	@Override
	public String toString() {
		return "WeatherAPIDTO [base_date=" + base_date + ", base_time=" + base_time + ", nx=" + nx + ", ny=" + ny + "]";
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
