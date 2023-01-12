package com.project.weather;

public class WeatherDTO {
	private String location_no;
	private String location_name;
	private String sky;
	private String tmp;
	private String tmn;
	private String tmx;
	private String pop;
	private String day;
	private String time;
	
	public WeatherDTO() {
		super();
	}
	
	public WeatherDTO(String location_no, String location_name) {
		super();
		this.location_no = location_no;
		this.location_name = location_name;
	}

	public WeatherDTO(String location_no, String location_name, String sky, String tmp, String tmn, String tmx,
			String pop, String day, String time) {
		super();
		this.location_no = location_no;
		this.location_name = location_name;
		this.sky = sky;
		this.tmp = tmp;
		this.tmn = tmn;
		this.tmx = tmx;
		this.pop = pop;
		this.day = day;
		this.time = time;
	}


	@Override
	public String toString() {
		return "WeatherDTO [location_no=" + location_no + ", location_name=" + location_name + ", sky=" + sky + ", tmp="
				+ tmp + ", tmn=" + tmn + ", tmx=" + tmx + ", pop=" + pop + ", day=" + day + ", time=" + time + "]";
	}
	public String getLocation_no() {
		return location_no;
	}

	public void setLocation_no(String location_no) {
		this.location_no = location_no;
	}

	public String getLocation_name() {
		return location_name;
	}

	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}

	public String getSky() {
		return sky;
	}

	public void setSky(String sky) {
		this.sky = sky;
	}

	public String getTmn() {
		return tmn;
	}

	public void setTmn(String tmn) {
		this.tmn = tmn;
	}

	public String getTmx() {
		return tmx;
	}

	public void setTmx(String tmx) {
		this.tmx = tmx;
	}

	public String getPop() {
		return pop;
	}

	public void setPop(String pop) {
		this.pop = pop;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}
	public String getTmp() {
		return tmp;
	}
	public void setTmp(String tmp) {
		this.tmp = tmp;
	}
	
	
	
}
