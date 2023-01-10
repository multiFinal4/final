package com.project.weather;

public class WeatherDTO {
	private int weatherrow;
	
	private String station_id;
	private String location_name;
	private String sky;
	private String tmp;
	private String tmn;
	private String tmx;
	private String pty;
	private String pcp;
	private String reh;
	private String sno;
	private String vec;
	private String wsd;
	private String pop;
	private String day;
	private String time;
	private String ftmp;
	
	public WeatherDTO() {
		super();
	}
	
	public WeatherDTO(String station_id, String location_name) {
		super();
		this.station_id = station_id;
		this.location_name = location_name;
	}

	
	public WeatherDTO(int weatherrow, String station_id, String location_name, String sky, String tmp, String tmn, String tmx,
			String pty, String pcp, String reh, String sno, String vec, String wsd, String pop, String day,
			String time,String ftmp) {
		super();
		this.weatherrow = weatherrow;
		this.station_id = station_id;
		this.location_name = location_name;
		this.sky = sky;
		this.tmp = tmp;
		this.tmn = tmn;
		this.tmx = tmx;
		this.pty = pty;
		this.pcp = pcp;
		this.reh = reh;
		this.sno = sno;
		this.vec = vec;
		this.wsd = wsd;
		this.pop = pop;
		this.day = day;
		this.time = time;
		this.ftmp = ftmp;
	}

	@Override
	public String toString() {
		return "WeatherDTO [station_id=" + station_id + ", location_name=" + location_name + ", sky=" + sky + ", tmp="
				+ tmp + ", tmn=" + tmn + ", tmx=" + tmx + ", pty=" + pty + ", pcp=" + pcp + ", reh=" + reh + ", sno="
				+ sno + ", vec=" + vec + ", wsd=" + wsd + ", pop=" + pop + ", day=" + day + ", time=" + time + ", ftmp=" + ftmp +"]" ;
	}

	public String getStation_id() {
		return station_id;
	}

	public void setStation_id(String station_id) {
		this.station_id = station_id;
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

	public String getPty() {
		return pty;
	}

	public void setPty(String pty) {
		this.pty = pty;
	}

	public String getPcp() {
		return pcp;
	}

	public void setPcp(String pcp) {
		this.pcp = pcp;
	}

	public String getReh() {
		return reh;
	}

	public void setReh(String reh) {
		this.reh = reh;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getVec() {
		return vec;
	}

	public void setVec(String vec) {
		this.vec = vec;
	}

	public String getWsd() {
		return wsd;
	}

	public void setWsd(String wsd) {
		this.wsd = wsd;
	}

	public String getFtmp() {
		return ftmp;
	}

	public void setFtmp(String ftmp) {
		this.ftmp = ftmp;
	}
	public int getWeatherrow() {
		return weatherrow;
	}
	public void setWeatherrow(int weatherrow) {
		this.weatherrow = weatherrow;
	}

	
	
}
