package com.project.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

@Repository
public abstract class FaqMongodbDAOImpl implements FaqMongoDAO {
	//spring-data-mongodb에서 제공하는 라이브러리
	MongoTemplate mongoTemplate;
	//페이징처리와 소트를 쉽게 구현하기 위해서 (spring-data-commons라이브러리에서 제공) - CRUD(CLRUD)를 위한 메소드를 제공
	FaqRepository FaqRepository; //SimpleMongoRepository이용해서 작업
	
	@Autowired
	public FaqMongodbDAOImpl(MongoTemplate mongoTemplate, FaqRepository faqRepository) {
		super();
		this.mongoTemplate = mongoTemplate;
		this.FaqRepository = faqRepository;
	}
	
	@Override
	public void insertDocument(FaqDTO doc) {
		mongoTemplate.insert(doc);		
	}

	@Override
	public List<FaqDTO> findCriteria(String key, String value) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FaqDTO findById(String key, String value) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(FaqDTO document) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<FaqDTO> findAll(int pageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertAllDocument(List<FaqDTO> docs) {
		// TODO Auto-generated method stub
		
	}
}
