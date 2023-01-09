package com.project.weather;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class WeatherUtil {

	public String getDate(LocalDate now, String pattern) { //날짜, 패턴
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);   // 포맷 정의
        String formatedNow = now.format(formatter);    // 포맷 적용
		return formatedNow;
	}
	
	//Base_time : 0200, 0500, 0800, 1100, 1400, 1700, 2000, 2300 (1일 8회)
	//- API 제공 시간(~이후) : 02:10, 05:10, 08:10, 11:10, 14:10, 17:10, 20:10, 23:10
	public String getTime() {
		
        LocalTime now = LocalTime.now();	// 현재 날짜 구하기
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmm");   // 포맷 정의
        String formatedNow = now.format(formatter);    // 포맷 적용
        String baseTime = "";
        if(Integer.parseInt(formatedNow)>2310) {
        	baseTime = "2300";
        }else if(Integer.parseInt(formatedNow)>2010) {
        	baseTime = "2000";
        }else if(Integer.parseInt(formatedNow)>1710) {
        	baseTime = "1700";
        }else if(Integer.parseInt(formatedNow)>1410) {
        	baseTime = "1400";
        }else if(Integer.parseInt(formatedNow)>1110) {
        	baseTime = "1100";
        }else if(Integer.parseInt(formatedNow)>810) {
        	baseTime = "0800";
        }else if(Integer.parseInt(formatedNow)>510) {
        	baseTime = "0500";
        }else if(Integer.parseInt(formatedNow)>210) {
        	baseTime = "0200";
        }else {
        	baseTime = "2300";
        }
		return baseTime;
	}
	
	public String getDayOfWeek(LocalDate date) {
    	DayOfWeek dayOfWeek = date.getDayOfWeek();
        int dayOfWeekNumber = dayOfWeek.getValue();
        String dayOfWeekval="";
        switch(dayOfWeekNumber){
        	case 1 : 
        		dayOfWeekval = "월";
        		break;
        	case 2 : 
        		dayOfWeekval = "화";
        		break;
        	case 3 : 
        		dayOfWeekval = "수";
        		break;
        	case 4 : 
        		dayOfWeekval = "목";
        		break;
        	case 5 : 
        		dayOfWeekval = "금";
        		break;
        	case 6 : 
        		dayOfWeekval = "토";
        		break;
        	case 7 : 
        		dayOfWeekval = "일";
        		break;
        }
        return dayOfWeekval;
	}
	
	public String getTmx(List<WeatherDTO> weatherlist, String today) {
		String tmx = "";
		for(int i=0; i<weatherlist.size();i++){
			if(weatherlist.get(i).getDay().equals(today)) {
			   	if(!weatherlist.get(i).getTmx().equals("없음")){
			   		tmx = weatherlist.get(i).getTmx();
			   	}
			}
        }
		if(tmx.equals("")) {
			tmx = "-";
		}
		return tmx;
	}
	
	public String getTmn(List<WeatherDTO> weatherlist, String today) {
		String tmn = "";
		for(int i=0; i<weatherlist.size();i++){
			if(weatherlist.get(i).getDay().equals(today)) {
	        	if(!weatherlist.get(i).getTmn().equals("없음")){
	        		tmn = weatherlist.get(i).getTmn();
	        	}
			}
        }
		if(tmn.equals("")) {
			tmn = "-";
		}
		return tmn;
	}
	
	public int getTodaySize(List<WeatherDTO> weatherlist,String today) {
		int todaysize = 0 ;
		for(int i=0; i<weatherlist.size();i++){
        	if(weatherlist.get(i).getDay().equals(today)){
        		todaysize++;
        	}
		}
		return todaysize;
	}
	
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
				System.out.println("[Usage] "+argv[0]+"1 <X-grid><Y-grid>");
				System.out.println(" "+argv[0]+" 0 <longitude><latitude>");
				System.exit(0);
			}
			if ((argv[1]).equals("0")) {
				x = Double.parseDouble(argv[2]);
				y = Double.parseDouble(argv[3]);

				if (x < 1 || x > NX || y < 1 || y > NY) {
					System.out.println("X-grid range [1,"+NX+"] / Y-grid range [1,"+NY+"]");
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
				System.out.println("X = "+(int)x+", Y = "+(int)y+" --->lon.= "+lon+", lat.= "+lat);
			}else {
				System.out.println("lon.= "+lon+", lat.= "+lat+" ---> X = "+resultarr[0]+", Y = "+resultarr[1]);
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
				System.out.println(theta);
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
