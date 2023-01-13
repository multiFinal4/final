package com.project.charge;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.charger.ChargerDTO;
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
