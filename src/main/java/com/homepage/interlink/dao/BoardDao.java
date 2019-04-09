package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.Inquiry;
import com.homepage.interlink.model.Lost;


public interface BoardDao {
    
    int regContent(Map<String, Object> paramMap);
     
    int getContentCnt(Map<String, Object> paramMap);
    
    int selectInquiryContentCnt(Map<String, Object> paramMap); //문의사항 게시글 조회
     
    List<Board> getContentList(Map<String, Object> paramMap);
    
    
    List<Board> lostBoardContent(Map<String, Object> paramMap);
    
    List<Board> getSearchList(Map<String, Object> paramMap);
    
    Board getContentView(int seq_id);
     
    Board lostContentView(int seq_id);
    int regReply(Map<String, Object> paramMap);
     
  
     
    int delReply(Map<String, Object> paramMap);
     
    int getBoardCheck(Map<String, Object> paramMap);
     
    
    
    
    int cntBoard(Map<String, Object> paramMap);
    
    int allCount(Map<String, Object> paramMap);
    
    

	

	Board read(int seq_id);

	public void create(Board board) throws Exception;

	int maxSelect(int board_id);
	
	int getBoardSeq();
	
	int ListDelete(Map<String, Object> paramMap); //자료실 게시판 리스트 삭제

	int BoardDelete(Board board); //자료실 게시물 삭제
		
	int lostDelete(int seq_id); //분실물 테이블 삭제

	int updateBoard(Board board); //문의하기 텍스트 수정
	
	int updateAllBoard(Board board); //전체게시물 텍스트 수정 , 문의하기 분실물센터 제외
	
	int updateLostBoard(Board board); //분실물센터 텍스트 수정

	int userDeleteInquiry(int seq_id); //문의하기 사용자 게시글 삭제
	
	int inquiryDetailDelete(int seq_id);
	
	int inquiryInsert(Inquiry inquiry);

	List<Board> inquiryRead(Map<String, Object> paramMap);

	

	Inquiry viewInquiry(Inquiry iq);

	List<Board> selectBoardMain(Map<String, Object> paramMap);

	List<Board> selectBidMain(Map<String, Object> paramMap);

	int getBoardAllCnt(Map<String, Object> paramMap);

	

	
	
	
	public void lostInsertContent(Board board) throws Exception;

	public void  lostCreate(Lost lost) throws Exception;

	List<Board> preView(Map<String, Object> paramMap);
	
	List<Board> nextView(Map<String, Object> paramMap);

	boolean passwordCheck(Inquiry inquiry);

	int getStep(int seq_id);
	
	int getSeq_id(int seq_id);
	
	List<Board> getInquiryDetail(Map<String, Object> paramMap); //2018-10-04 문의사항 사용자단 원글 + 답글 

	int inquiryListDelete(Board board);

	int adminDeleteInquiry(Board board);

	Board getInquiryByUseYN(Map<String, Object> paramMap);


	
	




     
}
