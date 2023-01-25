package com.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.file.BoardFileDTO;
@Repository
public class Service_TBDAOImpl implements Service_TBDAO {
	SqlSession sqlSession;
	@Autowired
	public Service_TBDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public int insert(Service_TBDTO board) {
		String view = "";
		// System.out.println(board.getManager_id());
		if(board.getManager_id()==null) { //일반유저가 글등록
			view = "com.project.service.insertCus";
		}else {  //매니저가 글등록
			view = "com.project.service.insert";
		}
		return sqlSession.insert(view, board);
	}

	@Override
	public List<Service_TBDTO> boardList() {
		return sqlSession.selectList("com.project.service.selectall");
	}

	@Override
	public Service_TBDTO getBoardInfo(String board_no) {
		return sqlSession.selectOne("com.project.service.read", board_no);
	}

	@Override
	public int update(Service_TBDTO board) {
		return sqlSession.update("com.project.service.update", board);
	}

	@Override
	public int delete(String board_no) {
		return sqlSession.delete("com.project.service.delete",board_no);
	}
	@Override
	public int delete_file(String board_no) {
		return sqlSession.delete("com.project.service.delete_file", board_no);
	}
	@Override
	public int delete_reply(String board_no) {
		return sqlSession.delete("com.project.service.delete_reply", board_no);
	}

	@Override
	public List<Service_TBDTO> search(String tag, String data) {
		Map<String,String> map =new HashMap<String, String>();
		map.put("tag", tag);
		map.put("data", data);
		return sqlSession.selectList("com.project.service.dynamicSearch", map);
	}

	@Override
	public List<Service_TBDTO> findByCategory(String board_category) {
		return sqlSession.selectList("com.project.service.categorySelect", 
				board_category);
	}

	//1:1문의 글에 답변달리면 state -> '대기'에서 '완료'상태로 변경하기
	@Override
	public int updateState(String board_no) {
		return sqlSession.update("com.project.service.updateState", board_no);
	}
	
	//---------------------첨부파일-----------------------
	//첨부파일 등록
	@Override
	public int insertFile(List<BoardFileDTO> boardfiledtolist) {
		return sqlSession.insert("com.project.service.fileinsert", boardfiledtolist);
	}

	
	//---------------------페이징-----------------------
	@Override
	public List<Service_TBDTO> list(SearchCriteria scri) {
		return sqlSession.selectList("com.project.service.listPage", scri);
	}

	@Override
	public int listCount(SearchCriteria scri) {
		return sqlSession.selectOne("com.project.service.listCount", scri);
	}
	@Override
	public List<Service_TBDTO> selectbyId(SearchCriteria scri,String id, String type) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", scri.getKeyword());
		map.put("searchType", scri.getSearchType());
		map.put("rowEnd", scri.getRowEnd()+"");
		map.put("rowStart", scri.getRowStart()+"");
		map.put("id", id);
		map.put("type", type);
		return sqlSession.selectList("com.project.service.selectbyId",map); 
		
	}
	@Override
	public int listCountId(SearchCriteria scri,String id, String type) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", scri.getKeyword());
		map.put("searchType", scri.getSearchType());
		map.put("rowEnd", scri.getRowEnd()+"");
		map.put("rowStart", scri.getRowStart()+"");
		map.put("id", id);
		map.put("type", type);
		return sqlSession.selectOne("com.project.service.listCountId", map);
	}

}
