package com.project.airquality;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.project.weather.WeatherDTO;

import java.io.BufferedReader;
import java.io.IOException;

//시도별 실시간 측정정보 조회
//https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15073861
//요청주소 http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty
//서비스URL http://apis.data.go.kr/B552584/ArpltnInforInqireSvc

public class AirqualityAPIPullTest {
	public static void main(String[] args) {
		//public List<AirqualityDTO> DataSave() {
		// https://velog.io/@garam0410/Java-OPEN-API-%ED%8C%8C%EC%8B%B1%ED%95%98%EA%B8%B0-JSON

		// 나의 인증키
		String key = "wBIi6XmZTSSDCA0D96alN%2Fpz0o6zAqN%2BkjrsB4AMlYty5FEL9KE8%2B0AGY%2FUyaa3MifurBesU%2Bp9myAc9wPByLQ%3D%3D";

		// 파싱한 데이터를 저장할 변수
		String result = "";

		try {
			URL url = new URL("http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?serviceKey="
					+ key);
			BufferedReader bf;

			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

			result = bf.readLine();

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			JSONObject movieInfoResult = (JSONObject) jsonObject.get("movieInfoResult");
			JSONObject movieInfo = (JSONObject) movieInfoResult.get("movieInfo");

			JSONArray nations = (JSONArray) movieInfo.get("nations");
			JSONObject nations_nationNm = (JSONObject) nations.get(0);

			JSONArray directors = (JSONArray) movieInfo.get("directors");
			JSONObject directors_peopleNm = (JSONObject) directors.get(0);

			JSONArray genres = (JSONArray) movieInfo.get("genres");

			JSONArray actors = (JSONArray) movieInfo.get("actors");

			System.out.println("영화코드 : " + movieInfo.get("movieCd"));
			System.out.println("영화명(한글) : " + movieInfo.get("movieNm"));
			System.out.println("영화명(영문) : " + movieInfo.get("movieNmEn"));
			System.out.println("재생시간 : " + movieInfo.get("showTm"));
			System.out.println("개봉일 : " + movieInfo.get("openDt"));
			System.out.println("영화유형 : " + movieInfo.get("typeNm"));
			System.out.println("제작국가명 : " + nations_nationNm.get("nationNm"));

			String genreNm = "";

			for (int i = 0; i < genres.size(); i++) {
				JSONObject genres_genreNm = (JSONObject) genres.get(i);
				genreNm += genres_genreNm.get("genreNm") + " ";
			}

			System.out.println("장르 : " + genreNm);

			System.out.println("감독명 : " + directors_peopleNm.get("peopleNm"));

			String peopleNm = "";

			for (int i = 0; i < actors.size(); i++) {
				JSONObject actors_peopleNm = (JSONObject) actors.get(i);
				peopleNm += actors_peopleNm.get("peopleNm") + " ";
				peopleNm = peopleNm + actors_peopleNm.get("peopleNm") + " ";
			}

			System.out.println("출연배우 : " + peopleNm);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
