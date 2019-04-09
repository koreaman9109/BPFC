package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.EtcDao;
import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.BoardFile;
import com.homepage.interlink.model.Convention;
import com.homepage.interlink.model.Recruit;

@Service("etcService")
public class EtcServiceImpl implements EtcService {

	@Resource(name = "etcDao")
	private EtcDao etcDao;

	@Override
	public List<Board> selectDelContent(Map<String, Object> paramMap) {
		return etcDao.selectDelContent(paramMap);
	}

	// del cnt
	@Override
	public int selectDelContentCnt(Map<String, Object> paramMap) {
		return etcDao.selectDelContentCnt(paramMap);
	}

	@Override
	public List<String> list_file_name(int seq_id) {
		return etcDao.list_file_name(seq_id);
	}

	@Override
	public List<String> list_file_path(int seq_id) {
		return etcDao.list_file_path(seq_id);
	}

	@Override
	public int ListDeleteBySeq_id(int paramMap) {
		return etcDao.ListDeleteBySeq_id(paramMap);
	}

	@Override
	public int fileDeleteBySeq_id(int paramMap) {
		return etcDao.fileDeleteBySeq_id(paramMap);
	}

	@Override
	public int lostDeleteBySeq_id(int paramMap) {
		return etcDao.lostDeleteBySeq_id(paramMap);
	}

	@Override
	public int ListRestoreBySeq_id(int paramMap) {
		return etcDao.ListRestoreBySeq_id(paramMap);
	}

	@Override
	public int fileRestoreBySeq_id(int paramMap) {
		return etcDao.fileRestoreBySeq_id(paramMap);
	}

	@Override
	public int lostRestoreBySeq_id(int paramMap) {
		return etcDao.lostRestoreBySeq_id(paramMap);
	}

	@Override
	public List<BoardFile> getRead(Map<String, Object> paramMap) {

		return etcDao.getRead(paramMap);
	}

	// 컨벤션 N처리된 게시물 리스트 출력
	@Override
	public List<Convention> selectDelConventionContent(Map<String, Object> paramMap) {
		return etcDao.selectDelConventionContent(paramMap);
	}

	// 컨벤션 N처리된 게시물 리스트 페이징 출력
	@Override
	public int selectDelConventionContentCnt(Map<String, Object> paramMap) {
		return etcDao.selectDelConventionContentCnt(paramMap);
	}

	// 채용 N처리된 게시물 리스트 출력
	@Override
	public List<Recruit> selectDelRecruitContent(Map<String, Object> paramMap) {
		return etcDao.selectDelRecruitContent(paramMap);
	}

	// 채용 N처리된 게시물 리스트 페이징 출력
	@Override
	public int selectDelRecruitContentCnt(Map<String, Object> paramMap) {
		return etcDao.selectDelRecruitContentCnt(paramMap);
	}

}
