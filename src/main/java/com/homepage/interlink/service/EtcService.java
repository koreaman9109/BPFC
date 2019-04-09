package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.BoardFile;
import com.homepage.interlink.model.Convention;
import com.homepage.interlink.model.Recruit;

public interface EtcService {

	int selectDelContentCnt(Map<String, Object> paramMap); // del cnt

	List<Board> selectDelContent(Map<String, Object> paramMap); // del list sql

	List<String> list_file_name(int seq_id);

	List<String> list_file_path(int seq_id);

	int ListDeleteBySeq_id(int paramMap);

	int fileDeleteBySeq_id(int paramMap); // 휴지통 게시물 삭제 by fileKey

	int lostDeleteBySeq_id(int paramMap);

	int ListRestoreBySeq_id(int paramMap); // 휴지통 게시물 복구

	int fileRestoreBySeq_id(int paramMap);

	int lostRestoreBySeq_id(int paramMap);

	List<BoardFile> getRead(Map<String, Object> paramMap);

	List<Convention> selectDelConventionContent(Map<String, Object> paramMap); // 컨벤션 N처리된 게시물 리스트 출력

	int selectDelConventionContentCnt(Map<String, Object> paramMap); // 컨벤션 N처리된 게시물 리스트 페이징 출력

	List<Recruit> selectDelRecruitContent(Map<String, Object> paramMap); // 채용 N처리된 게시물 리스트 페이징 출력

	int selectDelRecruitContentCnt(Map<String, Object> paramMap); // 채용 N처리된 게시물 리스트 출력
	
}
