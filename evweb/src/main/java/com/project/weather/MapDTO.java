package com.project.weather;

public class MapDTO {
	private double re; /* 사용할 지구반경 [ km ] */
	private double grid; /* 격자간격 [ km ] */
	private double slat1; /* 표준위도 [degree] */
	private double slat2; /* 표준위도 [degree] */
	private double olon; /* 기준점의 경도 [degree] */
	private double olat; /* 기준점의 위도 [degree] */
	private double xo; /* 기준점의 X좌표 [격자거리] */
	private double yo; /* 기준점의 Y좌표 [격자거리] */
	private int first; /* 시작여부 (0 = 시작) */
	
	public MapDTO() {
	}

	public MapDTO(double re, double grid, double slat1, double slat2, double olon, double olat, double xo, double yo,
			int first) {
		super();
		this.re = re;
		this.grid = grid;
		this.slat1 = slat1;
		this.slat2 = slat2;
		this.olon = olon;
		this.olat = olat;
		this.xo = xo;
		this.yo = yo;
		this.first = first;
	}

	public double getRe() {
		return re;
	}

	public void setRe(double re) {
		this.re = re;
	}

	public double getGrid() {
		return grid;
	}

	public void setGrid(double grid) {
		this.grid = grid;
	}

	public double getSlat1() {
		return slat1;
	}

	public void setSlat1(double slat1) {
		this.slat1 = slat1;
	}

	public double getSlat2() {
		return slat2;
	}

	public void setSlat2(double slat2) {
		this.slat2 = slat2;
	}

	public double getOlon() {
		return olon;
	}

	public void setOlon(double olon) {
		this.olon = olon;
	}

	public double getOlat() {
		return olat;
	}

	public void setOlat(double olat) {
		this.olat = olat;
	}

	public double getXo() {
		return xo;
	}

	public void setXo(double xo) {
		this.xo = xo;
	}

	public double getYo() {
		return yo;
	}

	public void setYo(double yo) {
		this.yo = yo;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}


}
