package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.BoardFileDao;

import com.homepage.interlink.model.BoardFile;


@Service
public class BoardFileServiceImpl implements BoardFileService {

	@Autowired
	private BoardFileDao boardFileDao;

	@Override
	public int insert(BoardFile boardfile) {
		return boardFileDao.insert(boardfile);
	}

	@Override
	public List<BoardFile> getRead(Map<String, Object> paramMap) {
		
		return boardFileDao.getRead(paramMap);
	}
	


	@Override
	public int fileDelete(int seq_id) {
		
		return boardFileDao.fileDelete(seq_id);
	}

	@Override
	public int userFileDeleteBySeqid(int seq_id) {
		return boardFileDao.userFileDeleteBySeqid(seq_id);
	}
	
	@Override
	public int fileDeleteBySeqid(BoardFile boardFile) {
		return boardFileDao.fileDeleteBySeqid(boardFile);
	}
	
	@Override
	public int fileDeleteByBoardFile(BoardFile boardFile) {
		return boardFileDao.fileDeleteByBoardFile(boardFile);
	}
	
	

	@Override
	public List<String> file_name(Map<String, Object> paramMap) {
		return boardFileDao.file_name(paramMap);
	}
	
	@Override
	public List<String> list_file_name(int seq_id) {
		return boardFileDao.list_file_name(seq_id);
	}


	@Override
	public int listImg(Map<String, Object> paramMap) {
		return boardFileDao.listImg(paramMap);
	}
	
	@Override
	public String file_select(String file_name2) {
		return boardFileDao.file_select(file_name2);
	}

	@Override
	public int fileDeleteByFileKey(int fileKey) {
		return boardFileDao.fileDeleteByFileKey(fileKey);
	}

	@Override
	public int inqiryFileDeleteBySeqid(BoardFile boardFile) {
		return boardFileDao.inqiryFileDeleteBySeqid(boardFile);
	}
}
