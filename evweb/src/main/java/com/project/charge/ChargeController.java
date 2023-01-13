package com.project.charge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.charger.ChargerService;

@Controller
@RequestMapping("/charge")
public class ChargeController {
	ChargeService service;
	ChargerService chargerService;
	@Autowired
	public ChargeController(ChargeService service, ChargerService chargerService) {
		super();
		this.service = service;
		this.chargerService = chargerService;
	}
}
