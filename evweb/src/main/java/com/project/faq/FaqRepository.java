package com.project.faq;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import oracle.jdbc.proxy.annotation.Post;

//spring-data 내부에서 자동으로 하위 객체를 생성하고 코드를 만들고 mongodv에서 데이터를 조회해서 매핑시킨다.
public interface FaqRepository extends PagingAndSortingRepository<FaqDTO, String>{
//	List<Post> findAllByOrderByIdDesc();
}
