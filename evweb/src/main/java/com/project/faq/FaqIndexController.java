package com.project.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FaqIndexController {
	@RequestMapping("/faq.do")
	public String basefaq() {
		return "faq";
		
	}
}
