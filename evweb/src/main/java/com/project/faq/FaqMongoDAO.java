package com.project.faq;

import java.util.List;

public interface FaqMongoDAO {
		public List<FaqDTO> findCriteria(String key,String value);
		public FaqDTO findById(String key,String value);
		public void insertDocument(FaqDTO doc);
		public void insertAllDocument(List<FaqDTO> docs);
		public void update(FaqDTO document);
		public List<FaqDTO> findAll(int pageNo);
}
