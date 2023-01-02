package com.project.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
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
	public int insert(NoticeDTO noticeBoard) {
		System.out.println("test test inserTest test test ");
		return sqlSession.insert("com.project.notice.write", noticeBoard);
	}
	
	@Override
	public NoticeDTO read(String notice_no) {
		return sqlSession.selectOne("com.project.notice.read",notice_no);
	}

	@Override
	public int update(NoticeDTO noticeBoard) {
		return sqlSession.update("com.project.notice.update",noticeBoard);
	}
	
	@Override
	public int delete(String notice_no) {
		return sqlSession.delete("com.project.notice.delete",notice_no);
	}
	
	@Override
	public List<NoticeDTO> search(String data) {
		return sqlSession.selectList("com.project.notice.search",data);
	}
	
	@Override
	public List<NoticeDTO> search(String tag, String data) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("tag", tag);
		map.put("data", data);
		return sqlSession.selectList("com.project.notice.dynamicSearch", map);
	}
	
	@Override
	public List<NoticeDTO> noticeList() {
		List<NoticeDTO> list = sqlSession.selectList("com.project.notice.selectal");
		return  list;
	}

	@Override
	public int insertFile(List<NoticeFileDTO> boardfiledtolist) {
		// TODO Auto-generated method stub
		return sqlSession.insert("com.project.notice.fileinsert", boardfiledtolist);
	}

	@Override
	public List<NoticeFileDTO> getFileList(String notice_no) {
		return sqlSession.selectList("com.project.notice.fileselect", notice_no);
	}

	@Override
	public NoticeFileDTO getFile(NoticeFileDTO inputdata) {
		return sqlSession.selectOne("com.project.notice.getfileinfo", inputdata);
	}
}
