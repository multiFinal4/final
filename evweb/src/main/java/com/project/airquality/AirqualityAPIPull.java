package com.project.airquality;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.project.weather.WeatherDTO;

import java.io.BufferedReader;
import java.io.IOException;

//시도별 실시간 측정정보 조회
//https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15073861
//요청주소 http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty
//서비스URL http://apis.data.go.kr/B552584/ArpltnInforInqireSvc

public class AirqualityAPIPull {
	public static void main(String[] args) throws IOException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
				+ "=wBIi6XmZTSSDCA0D96alN%2Fpz0o6zAqN%2BkjrsB4AMlYty5FEL9KE8%2B0AGY%2FUyaa3MifurBesU%2Bp9myAc9wPByLQ%3D%3D"); /*
																																 * 서비스
																																 * 키
																																 */

		urlBuilder.append("&" + URLEncoder.encode("returnType", "UTF-8") + "="
				+ URLEncoder.encode("json", "UTF-8")); /* xml 또는 json */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode("100", "UTF-8")); /* 한 페이지 결과 수 */
		urlBuilder
				.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("sidoName", "UTF-8") + "=" + URLEncoder.encode("제주",
				"UTF-8")); /*
							 * 시도 이름(전국, 서울, 부산, 대구, 인천, 광주, 대전, 울산, 경기, 강원, 충북, 충남, 전북, 전남, 경북, 경남, 제주, 세종)
							 */
		urlBuilder.append(
				"&" + URLEncoder.encode("ver", "UTF-8") + "=" + URLEncoder.encode("1.0", "UTF-8")); /* 버전별 상세 결과 참고 */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());
	}

//	public List<AirqualityDTO> DataSave(String name, String result) {
//		
////		String name = "";
////		String result = "";
//		
//		BufferedReader bf;
//		bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
//		result = bf.readLine();
//		
//		JSONParser jsonParser = new JSONParser();
//		JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
//		JSONObject movieInfoResult = (JSONObject)jsonObject.get("movieInfoResult");
//		JSONObject movieInfo = (JSONObject)movieInfoResult.get("movieInfo");
//
//		// https://velog.io/@garam0410/Java-OPEN-API-%ED%8C%8C%EC%8B%B1%ED%95%98%EA%B8%B0-JSON
//	}
}
