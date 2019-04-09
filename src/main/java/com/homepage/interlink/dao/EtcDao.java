package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.BoardFile;
import com.homepage.interlink.model.Convention;
import com.homepage.interlink.model.Recruit;

public interface EtcDao {
	int selectDelContentCnt(Map<String, Object> paramMap);

	List<Board> selectDelContent(Map<String, Object> paramMap); // del sql

	List<String> list_file_name(int seq_id);

	List<String> list_file_path(int seq_id);

	int ListDeleteBySeq_id(int paramMap); // 게시판 게시물 테이블 삭제

	int fileDeleteBySeq_id(int paramMap); // 게시판 파일 테이블 삭제

	int lostDeleteBySeq_id(int paramMap); // 분실물 테이블 삭제

	int ListRestoreBySeq_id(int paramMap); // 게시판 게시물 테이블 복구

	int fileRestoreBySeq_id(int paramMap); // 게시판 파일 테이블 복구

	int lostRestoreBySeq_id(int paramMap); // 분실물 테이블 복구

	List<BoardFile> getRead(Map<String, Object> paramMap);

	List<Convention> selectDelConventionContent(Map<String, Object> paramMap); // 컨벤션 N처리된 게시물 리스트 출력

	int selectDelConventionContentCnt(Map<String, Object> paramMap); 	// 컨벤션 N처리된 게시물 리스트 페이징 출력

	List<Recruit> selectDelRecruitContent(Map<String, Object> paramMap); // 채용 N처리된 게시물 리스트 출력

	int selectDelRecruitContentCnt(Map<String, Object> paramMap); // 채용 N처리된 게시물 리스트 페이징 출력

}
