package com.project.weather;

import java.sql.Time;

public class WeatherDTO {
	private String location_no;
	private String location_name;
	private String sky;
	private int tmn;
	private int tmx;
	private int pop;
	private Time time;
	
	public WeatherDTO() {
		super();
	}

	public WeatherDTO(String location_no, String location_name, String sky, int tmn, int tmx, int pop, Time time) {
		super();
		this.location_no = location_no;
		this.location_name = location_name;
		this.sky = sky;
		this.tmn = tmn;
		this.tmx = tmx;
		this.pop = pop;
		this.time = time;
	}

	@Override
	public String toString() {
		return "WeatherDTO [location_no=" + location_no + ", location_name=" + location_name + ", sky=" + sky + ", tmn="
				+ tmn + ", tmx=" + tmx + ", pop=" + pop + ", time=" + time + "]";
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

	public int getTmn() {
		return tmn;
	}

	public void setTmn(int tmn) {
		this.tmn = tmn;
	}

	public int getTmx() {
		return tmx;
	}

	public void setTmx(int tmx) {
		this.tmx = tmx;
	}

	public int getPop() {
		return pop;
	}

	public void setPop(int pop) {
		this.pop = pop;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}
	
	
	
}
