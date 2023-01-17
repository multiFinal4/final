package com.project.faq;

import java.util.List;

public interface FaqMongoDAO {
		public List<FaqDTO> findCriteria(String key,String value);
		public FaqDTO findById(String key,String value);
		public void insertDocument(FaqDTO doc);
		public void insertAllDocument(List<FaqDTO> docs);
		public void update(FaqDTO document);	//업데이트
		public void delete(String _id);			//삭제
		
		//페이징 처리돼있는 목록 화면
		public List<FaqDTO> findAll();
		public List<FaqDTO> findAll(int pageNo);//페이징
}
