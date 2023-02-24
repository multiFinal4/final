package com.project.notice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.file.BoardFileDTO;

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
		return sqlSession.insert("com.project.notice.write", noticeBoard);
	}
	
	@Override
	public NoticeDTO read(String notice_no) {
		NoticeDTO dto = sqlSession.selectOne("com.project.notice.read",notice_no);
			dto.setNotice_writedate(dto.getNotice_writedate().substring(0,19));
		return dto;
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
		List<NoticeDTO> list = sqlSession.selectList("com.project.notice.selectall");
		for(int i=0; i<list.size();i++) {
			list.get(i).setNotice_writedate(list.get(i).getNotice_writedate().substring(0,19));
		}
		return  list;
	}

	@Override
	public int insertFile(List<BoardFileDTO> boardfiledtolist) {
		return sqlSession.insert("com.project.notice.notice_fileinsert", boardfiledtolist);
	}


//	@Override
//	public List<BoardFileDTO> getFileList(String notice_no) {
//		return sqlSession.selectList("com.project.notice.fileselect", notice_no);
//	}
//
//	@Override
//	public BoardFileDTO getFile(String inputdata) {
//		return sqlSession.selectOne("com.project.notice.getfileinfo", inputdata);
//
//	}

}
