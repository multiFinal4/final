package com.project.charge;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChargeDAOImpl implements ChargeDAO {
	SqlSession sqlSession;
	
	@Autowired
	public ChargeDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public int insert(ChargeDTO dto) {
		return sqlSession.insert("com.project.charge.insert",dto);
	}

	@Override
	public Boolean cheak(String station_id, String charger_id, String start_time) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("station_id", station_id);
		map.put("charger_id", charger_id);
		map.put("start_time", start_time);
		ChargeDTO dto = sqlSession.selectOne("com.project.charge.cheak",map);
		if(dto == null) {
			return false;
		}else {
			return true;
		}
		
	}

	@Override
	public String sumchargeAmount(String station_id, String charging_date) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("station_id", station_id);
		map.put("charging_date", charging_date);
		String amount = sqlSession.selectOne("com.project.charge.sum",map);
		if(amount==null) {
			amount = "0";
		}
		return amount;
	}
	
	
}
