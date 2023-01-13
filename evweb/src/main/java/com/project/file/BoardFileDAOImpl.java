package com.project.file;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class BoardFileDAOImpl implements BoardFileDAO {
	SqlSession sqlSession;
	@Autowired
	public BoardFileDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public List<BoardFileDTO> getFileList(String board_no) {
		return sqlSession.selectList("com.project.file.fileselect", board_no);
	}
	
	@Override
	public List<BoardFileDTO> getFileListNo(String notice_no) {
		return sqlSession.selectList("com.project.file.fileselectNo", notice_no);
	}

	@Override
	public BoardFileDTO getFile(BoardFileDTO inputdata) {
		return sqlSession.selectOne("com.project.file.getfileinfo", inputdata);
	}

	@Override
	public BoardFileDTO getFileNo(BoardFileDTO inputdata) {
		return sqlSession.selectOne("com.project.file.getfileinfoNo", inputdata);
	}


}
