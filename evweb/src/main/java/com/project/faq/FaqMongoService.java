package com.project.faq;

import java.util.List;


public interface FaqMongoService {
	//데이터 찾기
	public FaqDTO findById(String key,String value);
	//데이터 추가
	public void insertDocument(FaqDTO doc);
	public List<FaqDTO> findCriteria(String key,String value);
	public void update(FaqDTO document);	//진짜 업데이트
	public List<FaqDTO> findAll();
	public void delete(String _id);			//삭제
	
	//페이징처리
	public List<FaqDTO> findAll(int pageNo);
	void insertAllDocument(List<FaqDTO> docs);
}
