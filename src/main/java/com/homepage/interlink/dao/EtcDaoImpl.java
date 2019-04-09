package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.BoardFile;
import com.homepage.interlink.model.Convention;
import com.homepage.interlink.model.Recruit;

@Repository("etcDao")
public class EtcDaoImpl implements EtcDao {
	@Inject
	SqlSession SqlSession;
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int selectDelContentCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("etcs.selectDelContentCnt", paramMap);
	}

	// del리스트 sql
	@Override
	public List<Board> selectDelContent(Map<String, Object> paramMap) {
		return sqlSession.selectList("etcs.selectDelContent", paramMap);
	}

	@Override
	public List<String> list_file_name(int seq_id) {
		return sqlSession.selectList("etcs.list_file_name", seq_id);
	}

	@Override
	public List<String> list_file_path(int seq_id) {
		return sqlSession.selectList("etcs.list_file_path", seq_id);
	}

	@Override
	public int ListDeleteBySeq_id(int paramMap) {
		return sqlSession.delete("etcs.ListDeleteBySeq_id", paramMap);
	}

	@Override
	public int fileDeleteBySeq_id(int paramMap) {
		return sqlSession.delete("etcs.fileDeleteBySeq_id", paramMap);
	}

	@Override
	public int lostDeleteBySeq_id(int paramMap) {
		return sqlSession.delete("etcs.lostDeleteBySeq_id", paramMap);
	}

	@Override
	public int ListRestoreBySeq_id(int paramMap) {
		return sqlSession.update("etcs.ListRestoreBySeq_id", paramMap);
	}

	@Override
	public int fileRestoreBySeq_id(int paramMap) {
		return sqlSession.update("etcs.fileRestoreBySeq_id", paramMap);
	}

	@Override
	public int lostRestoreBySeq_id(int paramMap) {
		return sqlSession.update("etcs.lostRestoreBySeq_id", paramMap);
	}

	@Override
	public List<BoardFile> getRead(Map<String, Object> paramMap) {
		return sqlSession.selectList("etcs.getRead", paramMap);
	}

	// 컨벤션 N처리된 게시물 리스트 출력
	@Override
	public List<Convention> selectDelConventionContent(Map<String, Object> paramMap) {
		return sqlSession.selectList("etcs.selectDelConventionContent", paramMap);
	}

	// 컨벤션 N처리된 게시물 리스트 페이징 출력
	@Override
	public int selectDelConventionContentCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("etcs.selectDelConventionContentCnt", paramMap);
	}

	// 채용 N처리된 게시물 리스트 출력
	@Override
	public List<Recruit> selectDelRecruitContent(Map<String, Object> paramMap) {
		return sqlSession.selectList("etcs.selectDelRecruitContent", paramMap);
	}

	// 채용 N처리된 게시물 리스트 페이징 출력
	@Override
	public int selectDelRecruitContentCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("etcs.selectDelRecruitContentCnt", paramMap);
	}

}
