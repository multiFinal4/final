package com.project.ranking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RankingServiceImpl implements RankingService {
	RankingDAO dao;
	public RankingServiceImpl() {};
	@Autowired
	public RankingServiceImpl(RankingDAO dao) {
		super();
		this.dao = dao;
	}
	@Override
	public List<RankingDTO> chargingAmountRank() {
		return dao.chargingAmountRank();
	}
	
}
