package com.project.airquality;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
//import java.util.List;
//
//import javax.xml.parsers.DocumentBuilderFactory;
//
//import org.json.simple.JSONObject;
//import org.json.simple.parser.JSONParser;
//
//import com.project.dust.dustDTO;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;

//시도별 실시간 측정정보 조회
//https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15073861
//요청주소 http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty
//서비스URL http://apis.data.go.kr/B552584/ArpltnInforInqireSvc

@Service
public class AirqualityAPIPull {
	public String GetAPIData(AirqualityDTO dto) throws IOException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
				+ "=wBIi6XmZTSSDCA0D96alN%2Fpz0o6zAqN%2BkjrsB4AMlYty5FEL9KE8%2B0AGY%2FUyaa3MifurBesU%2Bp9myAc9wPByLQ%3D%3D"); /*
																																 * 서비스
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
		return sb.toString();
	}

	public List<AirqualityDTO> DataSave(String result, String stationName) {
		// Json parser를 만들어 만들어진 문자열 데이터를 객체화
		List<AirqualityDTO> dustList = new ArrayList<AirqualityDTO>();
		AirqualityDTO dust = new AirqualityDTO(stationName);
		JSONParser parser = new JSONParser();
		JSONObject obj;

		try {
			obj = (JSONObject) parser.parse(result);
			// response 키를 가지고 데이터를 파싱
			JSONObject parse_response = (JSONObject) obj.get("response");
			// response 로 부터 body 찾기
			JSONObject parse_body = (JSONObject) parse_response.get("body");
			// body 로 부터 items 찾기
			JSONObject parse_items = (JSONObject) parse_body.get("items");

			// items로 부터 itemlist 를 받기
			JSONArray parse_item = (JSONArray) parse_items.get("item");
			String category;
			JSONObject data; // parse_item은 배열형태이기 때문에 하나씩 데이터를 하나씩 가져올때 사용
			// 카테고리와 값만 받아오기
			String dataTime = ((JSONObject) parse_item.get(0)).get("fcstdataTime").toString();
			for (int i = 0; i < parse_item.size(); i++) {
				data = (JSONObject) parse_item.get(i);
				Object fcstValue = data.get("fcstValue"); // 1.14 숙제 ..
				Object fcstDate = data.get("fcstDate");
				Object fcstdataTime = data.get("fcstdataTime");
				if (!dataTime.equals(fcstdataTime.toString())) {
					if (dust.getPm10() == null) {
						dust.setPm10("없음");
					}
					if (dust.getPm25() == null) {
						dust.setPm25("없음");
					}
					dustList.add(dust);
					dust = new AirqualityDTO(stationName);
					dataTime = fcstdataTime.toString();
				}
				//
				category = (String) data.get("category");
				dust.setdatatime(dataTime);
				if (category.equals("pm10")) {
					dust.setPm10((String) fcstValue);
				} else if (category.equals("pm25")) {
					dust.setPm25((String) fcstValue);
				}
				// 출력
				if (!dataTime.equals(fcstDate.toString())) {
					dataTime = fcstDate.toString();
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return dustList;
	}
}