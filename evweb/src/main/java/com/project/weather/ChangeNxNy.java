package com.project.weather;

import org.springframework.stereotype.Service;

@Service
public class ChangeNxNy {
	
	//argv[] = {a.out , 1, <X-grid>,<Y-grid>) or {a.out , 0, <longitude>,<latitude>"}
	public String[] changenxny(String argv[]){
		String[] nxny = new String[2]; 
		double lon = 0;
		double lat = 0;
		double x = 0;
		double y = 0;
		double NX = 149f; /* X축 격자점 수 */
		double NY = 253f; /* Y축 격자점 수 */
		if (argv.length != 4) {
			System.exit(0);
		}
		if ((argv[1]).equals("0")) {
			x = Double.parseDouble(argv[2]);
			y = Double.parseDouble(argv[3]);

			if (x < 1 || x > NX || y < 1 || y > NY) {
				System.exit(0);
			}
		} else if ((argv[1]).equals("1")) {
			lon = Double.parseDouble(argv[2]);
			lat = Double.parseDouble(argv[3]);
		}
		//
		// 단기예보 지도 정보
		//
		double Re = 6371.00877; // 지도반경
		double grid = 5.0; // 격자간격 (km)
		double slat1 = 30.0; // 표준위도 1
		double slat2 = 60.0; // 표준위도 2
		double olon = 126.0; // 기준점 경도
		double olat = 38.0; // 기준점 위도
		double xo = 43; // 기준점 X좌표
		double yo = 136; // 기준점 Y좌표
		int first = 0;
		MapDTO standard = new MapDTO(Re, grid, slat1, slat2, olon, olat, xo, yo, first);
		

		//
		// 단기예보
		//
		double[] resultarr = new double[2];
		// Character.getNumericValue(argv[1]) = 0 (격자->위경도), 1 (위경도->격자)
		resultarr = map_conv(lon, lat, x, y, Integer.parseInt(argv[1]), standard);
		if ((argv[1]).equals("0")) {
		}else {
		}

		nxny[0] = (int)resultarr[0]+"";
		nxny[1] = (int)resultarr[1]+"";
		return nxny;
		
	}
	/*
	 * ============================================================================*
	 * 좌표변환
	 * ============================================================================
	 */
	//lon :경도(degree)	lat :위도(degree)	x : X격자 (grid) y : Y격자 (grid) code : 0 (격자->위경도), 1 (위경도->격자) map // 지도정보
	public double[] map_conv(double lon, double lat, double x, 	double y, int code, MapDTO map) {
		double[] resultarr = new double[2];
		double lon1 = 0;
		double lat1 = 0;
		double x1 = 0;
		double y1 = 0;
			//
			// 위경도 -> (X,Y)
			//

			if (code == 1) {
				lon1 = lon;
				lat1 = lat;
				resultarr = lamcproj(lon1, lat1, x1, y1, 1, map);
				x = (int)(resultarr[0] + 0.5);
				y = (int)(resultarr[1] + 0.5);
				resultarr[0] = x;
				resultarr[1] = y;
			}

			//
			// (X,Y) -> 위경도
			//

			if (code == 0) {
				x1 = x - 1;
				y1 = y - 1;
				resultarr = lamcproj(lon1, lat1, x1, y1, 0, map);
				//lon = floatarr[0];
				//lat = floatarr[1];
				//floatarr[0] = lat;
				//floatarr[1] = lon;
			}
			return resultarr;
	}
	/***************************************************************************
		*
		* [ Lambert Conformal Conic Projection ]
		*
		* olon, lat : (longitude,latitude) at earth [degree]
		* o x, y : (x,y) cordinate in map [grid]
		* o code = 0 : (lon,lat) --> (x,y)
		* 1 : (x,y) --> (lon,lat)
		*
		***************************************************************************/
	public double[] lamcproj(double lon,double lat,double x,double y,int code,MapDTO map){
		double[] floatarr = new double[2];
		double PI = 0;
		double DEGRAD = 0;
		double RADDEG = 0;
		double re = 0;
		double olon = 0;
		double olat = 0;
		double sn = 0;
		double sf = 0;
		double ro = 0;
		double slat1 = 0;
		double slat2 = 0;
		double alon = 0;
		double alat = 0;
		double xn = 0;
		double yn = 0;
		double ra = 0;
		double theta = 0;
		if(map.getFirst()==0){
			PI = Math.asin(1.0)*2.0;
			DEGRAD = PI/180.0;
			RADDEG = 180.0/PI;

			re = map.getRe()/map.getGrid();
			slat1 = map.getSlat1() * DEGRAD;
			slat2 = map.getSlat2() * DEGRAD;
			olon = map.getOlon() * DEGRAD;
			olat = map.getOlat() * DEGRAD;

			sn = Math.tan(PI*0.25 + slat2*0.5)/Math.tan(PI*0.25 + slat1*0.5);
			sn = Math.log(Math.cos(slat1)/Math.cos(slat2))/Math.log(sn);
			sf = Math.tan(PI*0.25 + slat1*0.5);
			sf = Math.pow(sf,sn)*Math.cos(slat1)/sn;
			ro = Math.tan(PI*0.25 + olat*0.5);
			ro = re*sf/Math.pow(ro,sn);
			map.setFirst(1);
		}
		if(code==1)	{
			ra = Math.tan(PI*0.25+(lat)*DEGRAD*0.5);
			ra = re*sf/Math.pow(ra,sn);
			theta = (lon)*DEGRAD - olon;
			if (theta > PI) {
				theta -= 2.0*PI;
			}
			if (theta < -PI) {
				theta += 2.0*PI;
			}
			theta *= sn;
			x = (double)(ra*Math.sin(theta)) + map.getXo();
			y = (double)(ro - ra*Math.cos(theta)) + map.getYo();
			floatarr[0] = x;
			floatarr[1] = y;
		}else{
			xn = x - map.getXo();
			yn = ro - y + map.getYo();
			ra = Math.sqrt(xn*xn+yn*yn);
			if (sn< 0.0) {
				ra = -ra;
			}
			alat = Math.pow((re*sf/ra),(1.0/sn));
			alat = 2.0*Math.atan(alat) - PI*0.5;
			if (Math.abs(xn) <= 0.0) {
				theta = 0.0;
			} else {
				if (Math.abs(yn) <= 0.0) {
					theta = PI*0.5;
					if(xn< 0.0 ) {
						theta = -theta;
					}
				} else
					theta = Math.atan2(xn,yn);
			}
			alon = theta/sn + olon;
			lat = (double)(alat*RADDEG);
			lon = (double)(alon*RADDEG);
			floatarr[0] = lat;
			floatarr[1] = lon;
		}
		return floatarr;
	}
}
