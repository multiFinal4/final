package com.project.login;

import java.io.IOException;
import java.util.Map;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.customer.CustomerDTO;
import com.project.customer.customerService;

@Controller
public class KakaoController {
	@Autowired
	KakaoService ks;
	CustomerDTO customerdto;
	customerService service;
	
	@RequestMapping("/kakao")
    public String getCI(@RequestParam String code, Model model) throws IOException, ParseException {
        System.out.println("######code####### = " + code);
        String access_token = ks.getToken(code); 
        Map<String, Object> userInfo = ks.getUserInfo(access_token);
//      model.addAttribute("code", code);
//      model.addAttribute("access_token", access_token);
//		model.addAttribute("userInfo", userInfo);
        System.out.println("###access_Token#### : " + access_token);
        System.out.println("###id#### : " + userInfo.get("id"));
        System.out.println("###email#### : " + userInfo.get("email"));
        
        
        
        //카카오유저 가입정보 받아서 DB에 저장하기
        String customer_id = (String) userInfo.get("id");
        String email = (String) userInfo.get("email");
//      System.out.println("customer_id??? "+customer_id);
//      System.out.println("email?? "+email);
//        customerdto.setCustomer_id(customer_id);
//        customerdto.setEmail(email);
//        System.out.println(service.kakaoInsert(customerdto));
//        service.kakaoInsert(customerdto);
        

        //ci는 비즈니스 전환후 검수신청 -> 허락받아야 수집 가능
        return "oauth";  //디비에 유저정보 입력 후 메인화면 리턴
    }
	
	
}
