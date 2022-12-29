package com.project.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class NoticeDAOImpl implements NoticeDAO {
	
	SqlSession sqlSession;
	public NoticeDAOImpl() {
	}
	
	@Autowired
	public NoticeDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public int insert(NoticeDTO notice) {
		System.out.println("test test inserTest test test ");
		return sqlSession.insert("com.project.notice.notice.write", notice);
	}
	
	@Override
	public NoticeDTO read(String notice_no) {
		return sqlSession.selectOne("com.project.notice.notice.read",notice_no);
	}

	@Override
	public int update(NoticeDTO notice) {
		return sqlSession.update("com.project.notice.notice.update",notice);
	}
	
	@Override
	public int delete(String notice_no) {
		return sqlSession.delete("com.project.notice.notice.delete",notice_no);
	}

	@Override
	public List<NoticeDTO> search(String data) {
		return sqlSession.selectList("com.project.notice.notice.search",data);
	}
	
	@Override
	public List<NoticeDTO> search(String tag, String data) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("tag", tag);
		map.put("data", data);
		return sqlSession.selectList("com.project.notice.notice.dynamicSearch", map);
	}
	
	@Override
	public List<NoticeDTO> noticeList() {
		List<NoticeDTO> list = sqlSession.selectList("com.project.notice.notice.selectal");
		return  list;
	}

	@Override
	public int insertFile(List<NoticeFileDTO> boardfiledtolist) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NoticeFileDTO> getFileList(String boardno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeFileDTO getFile(NoticeFileDTO inputdata) {
		// TODO Auto-generated method stub
		return null;
	}
}
