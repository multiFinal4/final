package com.project.login;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.customer.CustomerDAO;
import com.project.customer.CustomerDTO;

@Service
public class KakaoService {
	CustomerDAO dao;
	KakaoService() {};
	@Autowired
    public KakaoService(CustomerDAO dao) {
		super();
		this.dao = dao;
	}


	public String getToken(String code) throws IOException, org.json.simple.parser.ParseException {
        // 인가코드로 토큰받기
        String host = "https://kauth.kakao.com/oauth/token";
        URL url = new URL(host);
        HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
        String token = "";
        try {
            urlConnection.setRequestMethod("POST");
            urlConnection.setDoOutput(true); // 데이터 기록 알려주기

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=ce8affbe0709e40494b6d8ad31a694eb");
            sb.append("&redirect_uri=http://localhost:8088/evweb/kakao");
            sb.append("&code=" + code);

            bw.write(sb.toString());
            bw.flush();

            int responseCode = urlConnection.getResponseCode();
            System.out.println("responseCode 확인 = " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
            String line = "";
            String result = "";
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("result = " + result);

            // json parsing
            JSONParser parser = new JSONParser();
            JSONObject elem = (JSONObject) parser.parse(result);

            String access_token = elem.get("access_token").toString();
            String refresh_token = elem.get("refresh_token").toString();
            System.out.println("refresh_token = " + refresh_token);
            System.out.println("access_token = " + access_token);

            token = access_token;

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


        return token;
    }

    //선택동의한 유저 정보 받아오기
    public CustomerDTO getUserInfo(String access_token) throws IOException, org.json.simple.parser.ParseException {
        String host = "https://kapi.kakao.com/v2/user/me";
        HashMap<String, Object> result = new HashMap<String, Object>();
        try {
        	// 1.url 객체만들기
            URL url = new URL(host);
            // 2.url 에서 url connection 만들기
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            // 3.URL 연결구성
            urlConnection.setRequestProperty("Authorization", "Bearer " + access_token);
            urlConnection.setRequestMethod("GET");      
            
            //키값, 속성 적용
            int responseCode = urlConnection.getResponseCode();     // 서버에서 보낸 http 상태코드 반환
            System.out.println("responseCode = " + responseCode);
            // responsecode가 200이 아닌 경우 if문을 통해서 예외처리 가능
            
            BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
            // 버퍼 사용해 읽기
            String line = "";
            String res = "";
            while((line=br.readLine())!=null)
            {
                res+=line;
            }

            System.out.println("res = " + res);

            // json으로 파싱하기
            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject) parser.parse(res);
            JSONObject kakao_account = (JSONObject) obj.get("kakao_account");
            //JSONObject properties = (JSONObject) obj.get("properties");  //닉네임, 프로필이미지 ...
            
            String id = obj.get("id").toString();
            // 선택항목(이메일) 체크 여부 나눠서 처리
            if(kakao_account.get("email")==null) {
            	result.put("id", id);
            }else {
	            String email = kakao_account.get("email").toString();
	            result.put("id", id);
	            result.put("email", email);
            }
            
            //String birthday = kakao_account.get("birthday").toString();
            //result.put("birthday", birthday);

            br.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
        
       
        CustomerDTO dtoresult = dao.findkakao(result);
        System.out.println("dtoresult================> "+dtoresult);
        
        // dtoresult null => 디비에 저장된 정보가 없음. 디비에 저장하기
        if(dtoresult == null) {
        	// 선택항목(이메일) 체크 여부 나눠서 데이터저장하기
        	if(result.get("email")==null) {
        		dao.kakaoInsertNull(result);
        	}else {
        		dao.kakaoInsert(result);
        	}
            // 정보 저장 후 컨트롤러에 데이터 보내기
            return dao.findkakao(result);
            //dtoresult를 리턴으로 보내면 null이 리턴되므로 위의 코드를 사용.
        }else {
            return dtoresult;
            //정보가 있으므로 dtoresult를 리턴함
        }
         
    }
    
    // 정상적으로 받아왔는지 여부
    public String getAgreementInfo(String access_token)
    {
        String result = "";
        String host = "https://kapi.kakao.com/v2/user/scopes";
        try{
            URL url = new URL(host);
            HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
            urlConnection.setRequestMethod("GET");
            urlConnection.setRequestProperty("Authorization", "Bearer "+access_token);

            BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
            String line = "";
            while((line=br.readLine())!=null)
            {
                result+=line;
            }

            int responseCode = urlConnection.getResponseCode();
            System.out.println("responseCode = " + responseCode);

            // result is json format
            br.close();

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (ProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }


}