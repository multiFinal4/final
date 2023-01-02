package com.project.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

@Service
public class FaqMongoServiceImpl implements FaqMongoService {
	FaqMongoDAO dao;
	
	@Autowired
	public FaqMongoServiceImpl(FaqMongoDAO dao) {
		super();
		this.dao = dao;
	}

	@Override
	public FaqDTO findById(String key, String value) {
		return dao.findById(key, value);
	}

	@Override
	public void insertDocument(FaqDTO doc) {
		dao.insertDocument(doc);
	}
	
	@Override
	public void insertAllDocument(List<FaqDTO> docs) {
		dao.insertAllDocument(docs);
	}

	@Override
	public List<FaqDTO> findCriteria(String key, String value) {
		return dao.findCriteria(key, value);
	}

	@Override
	public void update(FaqDTO document) {
		dao.update(document);
	}

	@Override
	public List<FaqDTO> findAll() {
		return dao.findAll();
	}

	@Override
	public List<FaqDTO> findAll(int pageNo) {
		//PaginfAndSortingRepository의 findAll메소드를 호출하면 페이징 처리된 객체를 전달 받을 수 있다.
		//fiindAll 메소드 내부에서 페이징 처리를 할 수 있도록 PageRequest객체를 이용해서 실행할 페이지의 번호와 한 페이지를 구성할 document
		//를 매개 변수로 전달해야하 한다.
		return dao.findAll(pageNo);
	}

}
