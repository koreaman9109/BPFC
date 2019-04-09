package com.homepage.interlink.dao;


import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.BoardFile;

public interface BoardFileDao {
	int insert (BoardFile boardFile);

	List<BoardFile> getRead(Map<String, Object> paramMap);

	int fileDelete(int seq_id);

	List<String> file_name(Map<String, Object> paramMap);
	
	List<String> list_file_name(int seq_id);

	int listImg(Map<String, Object> paramMap);

	int userFileDeleteBySeqid(int seq_id);
	
	int fileDeleteBySeqid(BoardFile boardFile);

	String file_select(String file_name2);

	int fileDeleteByBoardFile(BoardFile boardFile);

	int fileDeleteByFileKey(int fileKey);

	int inqiryFileDeleteBySeqid(BoardFile boardFile);
	

	
}
