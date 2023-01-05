package main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	@RequestMapping("/map")
	public String mapPage() {
		return "map";
	}
	@RequestMapping("/admin")
	public String adminPage() {
		return "admin";
	}
	@RequestMapping("/service")
	public String servicePage() {
		return "service";
	}
	@RequestMapping("/mypage")
	public String myPage() {
		return "mypage";
	}

}
