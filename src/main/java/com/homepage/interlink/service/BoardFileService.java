package com.homepage.interlink.service;


import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.BoardFile;


public interface BoardFileService {
	
	int insert (BoardFile boardFile);
	
	List<BoardFile> getRead(Map<String, Object> paramMap);
	
	int fileDelete(int seq_id);		//자료실 게시물 삭제 param으로
	
	int userFileDeleteBySeqid(int seq_id);		//자료실 게시물 삭제 by fileKey
	
	int fileDeleteByBoardFile(BoardFile boardFile);
	
	int fileDeleteBySeqid(BoardFile boardFile);		//자료실 게시물 삭제 by seq_id
	
	List<String> file_name(Map<String, Object> paramMap );
	
	List<String> list_file_name(int seq_id);
	
	String file_select(String file_name2);
	
	int listImg(Map<String, Object> paramMap);

	int fileDeleteByFileKey(int fileKey);

	int inqiryFileDeleteBySeqid(BoardFile boardFile);

}
