package com.project.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

@Repository
public class FaqMongodbDAOImpl implements FaqMongoDAO {
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

	//search
	@Override
	public List<FaqDTO> findCriteria(String key, String value) {
		String[] data =  key.split(",");
		Criteria criteria = new Criteria(data[0]);
		//^ =>해당 필드가 ^다음의 문자열로 시작하는 데이터 => like 연산자와 동일 where dept like '인사%' 
		//criteria.regex("^"+value);
		criteria.regex(".*"+value+".*");//dept like '%사%'
		Query query = new Query(criteria);
		List<FaqDTO> docs = mongoTemplate.find(query, FaqDTO.class,"faq");
		System.out.println("dao=>"+docs);
		return docs;
	}
	
	
	//
	@Override
	public FaqDTO findById(String key, String value) {
		//Criteria객체는 spring data mongodb에서 조건을 모델링한 객체
		//어떤 필드에 어떤 조건을 적용할 것인지 정의
		//필드명과 필드의 조건을 정의하면 내부에서 json의 쿼리조건을 만들어 처리
		//1. 조건을 객체로 정의
		Criteria criteria = new Criteria(key);
		//조건에 대한 설정
		criteria.is(value);
		
		//2.Criteria객체를 이용해서 Query를 생성
		System.out.println("findById->"+value);
		Query query = new Query(criteria);
		FaqDTO doc = mongoTemplate.findOne(query, FaqDTO.class,"faq");
		System.out.println("doc ~~~"+doc);
		return doc;
	}

	@Override
	public void update(FaqDTO document) {
		//조건(Criteria,Query) - 조건에 만족하는 document를 수정
		Criteria criteria = new Criteria("_id");
		criteria.is(document.get_id());
		Query query = new Query(criteria);
		
		//업데이트기능을 수행하는 객체를 생성하고 적절한 값을 셋팅
		Update update = new Update();
		update.set("title", document.gettitle());
		update.set("content", document.getcontent());
		System.out.println("query : "+query);
		System.out.println("update : "+update);
		mongoTemplate.updateFirst(query, update,"faq");
	}
	
	//https://souning.tistory.com/68
	//https://sg-choi.tistory.com/388
	public void delete(String _id){
        Criteria criteria = new Criteria("_id");
		criteria.is(_id);
        Query query = new Query(criteria);
        System.out.println("DAOImpl _id : "+_id);
        mongoTemplate.remove(query,"faq");
        System.out.println("DAOImpl"+query);
    }
	
	@Override
	public List<FaqDTO> findAll() {
		return mongoTemplate.findAll(FaqDTO.class,"faq");
	}
	
	//리스트 페이징처리
	@Override
	public List<FaqDTO> findAll(int pageNo) {
		Page<FaqDTO> page = FaqRepository.findAll(new PageRequest(pageNo, 5));
		return page.getContent();
	}

	@Override
	public void insertAllDocument(List<FaqDTO> docs) {
		// TODO Auto-generated method stub
		
	}


}
