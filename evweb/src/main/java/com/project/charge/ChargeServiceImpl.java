package com.project.charge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChargeServiceImpl implements ChargeService {
	ChargeDAO dao;
	@Autowired
	public ChargeServiceImpl(ChargeDAO dao) {
		super();
		this.dao = dao;
	}
	
}
