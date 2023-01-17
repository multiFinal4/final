package com.project.ranking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RankingController {
	RankingService service;
	public RankingController() {};
	@Autowired
	public RankingController(RankingService service) {
		super();
		this.service = service;
	}
	
	//랭킹
	@ResponseBody
	@RequestMapping(value="/chargingAmountRank", method=RequestMethod.POST)
	public List<RankingDTO> chargingAmountRank() {
		List<RankingDTO> list = service.chargingAmountRank();
		System.out.println("가져온정보?????"+list);
		return list;
	}
}
