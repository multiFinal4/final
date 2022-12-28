package com.project.login;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
	Memberservice service;
	
	@RequestMapping("/login.do")
	public String login(MemberDTO loginUserInfo, Model model) {
		MemberDTO user = service.login(loginUserInfo);
		String viewName = "";
		if (user != null) {
			model.addAttribute("user", user);
			viewName = user.getMenupath();

		} else {
			viewName = "login";
		}
		return viewName;
	}
	
}
