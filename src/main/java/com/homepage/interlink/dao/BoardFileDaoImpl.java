package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.homepage.interlink.model.BoardFile;

@Repository
public class BoardFileDaoImpl implements BoardFileDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(BoardFile boardFile) {
		return sqlSession.insert("boardFiles.insert", boardFile);
	}

	@Override
	public List<BoardFile> getRead(Map<String, Object> paramMap) {
		
		return sqlSession.selectList("boardFiles.read", paramMap);
	}

	@Override
	public int userFileDeleteBySeqid(int seq_id) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardFiles.userFileDeleteBySeqid", seq_id);
	}
	
	@Override
	public int fileDeleteBySeqid(BoardFile boardFile) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardFiles.fileDeleteBySeqid", boardFile);
	}

	@Override
	public int fileDelete(int seq_id) {
		
		return sqlSession.update("boardFiles.fileDelete", seq_id);
	}

	@Override
	public List<String> file_name(Map<String, Object> paramMap) {
		return sqlSession.selectList("boardFiles.file_name", paramMap);
	}
	
	@Override
	public List<String> list_file_name(int seq_id) {
		return sqlSession.selectList("boardFiles.list_file_name", seq_id);
	}

	@Override
	public int listImg(Map<String, Object> paramMap) {
		return sqlSession.selectOne("boardFiles.listImg", paramMap);
	}

	@Override
	public String file_select(String file_name2) {
		return sqlSession.selectOne("boardFiles.file_select", file_name2);
	}

	@Override
	public int fileDeleteByBoardFile(BoardFile boardFile) {
		return sqlSession.update("boardFiles.fileDeleteByBoardFile", boardFile);
	}

	@Override
	public int fileDeleteByFileKey(int fileKey) {
		return sqlSession.update("boardFiles.fileDeleteByFileKey", fileKey);
	}

	@Override
	public int inqiryFileDeleteBySeqid(BoardFile boardFile) {
		return sqlSession.update("boardFiles.inqiryFileDeleteBySeqid", boardFile) ;
	}
	
	
}
