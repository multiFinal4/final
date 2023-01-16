package com.project.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.customer.CustomerDTO;
import com.project.customer.customerService;

@Controller
public class KakaoController {
	@Autowired
	KakaoService ks;
	customerService service;
	
	@RequestMapping("/kakao")
    public ModelAndView getCI(@RequestParam String code, HttpServletRequest request) throws IOException, ParseException {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("########code######### = " + code);
        String access_token = ks.getToken(code); 
        System.out.println("####access_Token##### : " + access_token);
        
        CustomerDTO userInfo = ks.getUserInfo(access_token);
        
        String viewName = "";
        if (userInfo != null && userInfo.getState().equals("카카오")) {
        	//세션저장
        	HttpSession session = request.getSession();
        	session.setAttribute("user", userInfo);
        	viewName = "index";
        }else {
			viewName = "login";
		}
        
        //ci는 비즈니스 전환후 검수신청 -> 허락받아야 수집 가능
        mav.setViewName(viewName);
        return mav;  //디비에 유저정보 입력 후 메인화면 리턴
    }
	
	
}
