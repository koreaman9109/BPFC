package com.homepage.interlink.service;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.Inquiry;
import com.homepage.interlink.model.Lost;

public interface BoardService {
    
    int regContent(Map<String, Object> paramMap);
     
    int getContentCnt(Map<String, Object> paramMap);
    
     
    int selectInquiryContentCnt(Map<String, Object> paramMap); //문의사항 전체 게시글 조회
    
    List<Board> getContentList(Map<String, Object> paramMap);
        
    List<Board> lostBoardContent(Map<String, Object> paramMap);
    
    List<Board> selectBoardMain(Map<String, Object> paramMap);
    
    List<Board> selectBidMain(Map<String, Object> paramMap);

    Board getContentView(int seq_id);
    
    Board lostContentView(int seq_id);
     
    int regReply(Map<String, Object> paramMap);
     
    
     
    int delReply(Map<String, Object> paramMap);
     
    int getBoardCheck(Map<String, Object> paramMap);
     
    int getcntBoard(Map<String, Object> paramMap);
    
    int getBoardAllCnt(Map<String, Object> paramMap); //cms전체 게시물 갯수 출력
	
	
	int getallCount(Map<String, Object> paramMap);



	int ListDelete(Map<String, Object> paramMap);  //자료실 게시판 리스트 삭제
	
	int lostDelete(int seq_id);
	
	int BoardDelete(Board board);		//자료실 게시물 삭제
	
	public int updateBoard(Board board); //자료실 게시물 수정
	
	public int updateAllBoard(Board board); //전체 게시물 텍스트 수정 , 분실물 , 문의하기 제외
	
	public int updateLostBoard(Board board); //분실물 센터 게시물 텍스트 수정
	
	
	public int userDeleteInquiry(int seq_id);

	public int inquiryDetailDelete(int seq_id); //관리자 페이지 문의하기 상세보기 삭제
	
	public int inquiryListDelete(Board board); //관리자 페이지 문의사항 목록에서 삭제 원글 삭제시 답글까지 
    
	public void create(Board board) throws Exception;  // 01. 게시글 작성
    
	public int getStep(int seq_id);

	public int getSeq_id(int seq_id);
	
	Board read(int seq_id);
	
	
	int maxSelect(int board_id);
	
	int getBoardSeq();
	
	
	
    int inquiryInsert(Inquiry inquiry);
    

    
    List<Board> inquiryRead(Map<String, Object> paramMap); //문의하기 리스트출력

	
	
    
    public Inquiry viewInquiry(Inquiry iq);
    
    List<Board> preView(Map<String, Object> paramMap); //이전 글 보기
    
    List<Board> nextView(Map<String, Object> paramMap); //다음 글 보기
    

    public void lostInsertContent(Board board) throws Exception;  // 01. 게시글 작성
    public void lostCreate(Lost lost) throws Exception;  // 분실물 정보 등록

	boolean passwordCheck(Inquiry inquiry, HttpSession session);
	
	List<Board> getInquiryDetail(Map<String, Object> paramMap); //문의사항 상세보기 출력 원글 + 답글까지 2018-10-04 박권수	

	public int adminDeleteInquiry(Board board);
	
	Board getInquiryByUseYN(Map<String, Object> paramMap); //문의사항 use_yn 가져오기 
	

    
    
    
     

}