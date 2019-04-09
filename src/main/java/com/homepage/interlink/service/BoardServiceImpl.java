package com.homepage.interlink.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.BoardDao;
import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.Inquiry;
import com.homepage.interlink.model.Lost;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
 
	@Resource(name="boardDao")
    private BoardDao boardDao;
	
    @Override
	public int getBoardSeq() {
		return boardDao.getBoardSeq();
	}
 
    @Override
    public int regContent(Map<String, Object> paramMap) {
        return boardDao.regContent(paramMap);
    }
 
    @Override
    public int getContentCnt(Map<String, Object> paramMap) {
        return boardDao.getContentCnt(paramMap);
    }
    
    
    
    @Override
    public int selectInquiryContentCnt(Map<String, Object> paramMap) {
        return boardDao.selectInquiryContentCnt(paramMap);
    }
    
    @Override
	public int getBoardAllCnt(Map<String, Object> paramMap) {
		return boardDao.getBoardAllCnt(paramMap);
	}

	@Override
    public List<Board> getContentList(Map<String, Object> paramMap) {
    	List<Board> brd = boardDao.getContentList(paramMap);
    	List<Board> tmp = new ArrayList();
    	
//    	System.out.println("============> brd : " + brd.toString());
    	
    	for(Board itm:brd) {
    		if(itm.getStep() > 0) {
    			
    			String str = itm.getTitle();
    			int step = itm.getStep();
    			
    			str = "☞[답글] " + str;
    			
    			for(int i = 0;i<=step;i++) {
    				str = "&nbsp&nbsp" + str;
    			}
    			
    			itm.setTitle(str);
    		}
    		
    		tmp.add(itm);
    	}
    	
//    	System.out.println("tmp----> " + tmp.toString());
    	
        return tmp;
    }
	
    @Override
	public List<Board> lostBoardContent(Map<String, Object> paramMap) {
		return boardDao.lostBoardContent(paramMap);
	}

	@Override
    public Board getContentView(int seq_id) {
		

        return boardDao.getContentView(seq_id);
    }
    
	
    
    
    @Override
	public int getStep(int seq_id) {

		return boardDao.getStep(seq_id);
	}
    
    @Override
	public int getSeq_id(int seq_id) {

		return boardDao.getSeq_id(seq_id);
	}


	@Override
	public Board lostContentView(int seq_id) {
		
		return boardDao.lostContentView(seq_id);
	}

	@Override
    public int getcntBoard(Map<String, Object> paramMap) {
        return boardDao.cntBoard(paramMap);
    }
 
    @Override
    public int regReply(Map<String, Object> paramMap) {
        return boardDao.regReply(paramMap);
    }
 
   
 
    @Override
    public int delReply(Map<String, Object> paramMap) {
        return boardDao.delReply(paramMap);
    }
 
    @Override
    public int getBoardCheck(Map<String, Object> paramMap) {
        return boardDao.getBoardCheck(paramMap);
    }
 

    
	@Override
	public int getallCount(Map<String, Object> paramMap) {
	
		return boardDao.allCount(paramMap);
	}
	
	//자료실 게시판 리스트 삭제
	@Override
	public int ListDelete(Map<String, Object> paramMap) {
		return boardDao.ListDelete(paramMap);
	}
	
	@Override
	public int lostDelete(int seq_id) {
		
		return boardDao.lostDelete(seq_id);
	}

	//자료실 게시물 삭제
	@Override
	public int BoardDelete(Board board) {
		
		return boardDao.BoardDelete(board);
	}
	@Override
	public Board read(int seq_id) {
		return boardDao.read(seq_id);
	}
	
	 // 01. 게시글쓰기
    @Override
    public void create(Board board) throws Exception {
        boardDao.create(board);
    }
    
    
    



	@Override
	public int maxSelect(int board_id) {
		return boardDao.maxSelect(board_id);
	}

	@Override
	public int updateBoard(Board board) {
		
		return boardDao.updateBoard(board);
	}
	
	@Override
	public int updateAllBoard(Board board) {
		return boardDao.updateAllBoard(board);
	}
	
	@Override
	public int updateLostBoard(Board board) {
		return boardDao.updateLostBoard(board);
	}

	@Override
	public int userDeleteInquiry(int seq_id) {
		return boardDao.userDeleteInquiry(seq_id);
	}
	
	@Override
	public int inquiryDetailDelete(int seq_id) {
		return boardDao.inquiryDetailDelete(seq_id);
	}

	@Override
	public int inquiryInsert(Inquiry inquiry){
		return boardDao.inquiryInsert(inquiry);
	}

	
    @Override
    public List<Board> inquiryRead(Map<String, Object> paramMap) {
    	List<Board> brd = boardDao.inquiryRead(paramMap);
    	List<Board> tmp = new ArrayList();
    	
//    	System.out.println("============> brd : " + brd.toString());
    	
    	for(Board itm:brd) {
    		if(itm.getStep() > 0) {
    			
    			String str = itm.getTitle();
    			int step = itm.getStep();
    			
    			str = "☞[답글] " + str;
    			
    			for(int i = 0;i<=step;i++) {
    				str = "&nbsp&nbsp" + str;
    			}
    			
    			itm.setTitle(str);
    		}
    		
    		tmp.add(itm);
    	}
    	
//    	System.out.println("tmp----> " + tmp.toString());
    	
        return tmp;
        
    }

	@Override
	public boolean passwordCheck(Inquiry inquiry, HttpSession session) {
		boolean result = boardDao.passwordCheck(inquiry);
		if (result) { // true일 경우 세션에 등록
            Inquiry inquiry2 = viewInquiry(inquiry);
            // 세션 변수 등록
            session.setAttribute("seq_id", inquiry2.getSeq_id());
            session.setAttribute("user_name", inquiry2.getUser_name());
            session.setAttribute("password", inquiry2.getPassword());
            
            
            
            
        } 
        return result;
		
	}
	
	

	@Override
	public Inquiry viewInquiry(Inquiry inquiry) {
			return boardDao.viewInquiry(inquiry);
	}

	@Override
	public List<Board> selectBoardMain(Map<String, Object> paramMap) {
	
		return boardDao.selectBoardMain(paramMap);
	}
	
	@Override
	public List<Board> selectBidMain(Map<String, Object> paramMap) {
	
		return boardDao.selectBidMain(paramMap);
	}
	

    
    

	@Override
	public void lostInsertContent(Board board) throws Exception{
		boardDao.lostInsertContent(board);
		
	}
	
	@Override
	public void lostCreate(Lost lost) throws Exception{
		boardDao.lostCreate(lost);
		 
	}

	@Override
	public List<Board> preView(Map<String, Object> paramMap) {
		return boardDao.preView(paramMap);
	}

	@Override
	public List<Board> nextView(Map<String, Object> paramMap) {
		return boardDao.nextView(paramMap);
	}

	//문의사항 상세보기 출력 원글 + 답글까지 2018-10-04 박권수
	@Override
	public List<Board> getInquiryDetail(Map<String, Object> paramMap) {
		return boardDao.getInquiryDetail(paramMap);
	}

	@Override
	public int inquiryListDelete(Board board) {
		return boardDao.inquiryListDelete(board);
	}

	@Override
	public int adminDeleteInquiry(Board board) {
		return boardDao.adminDeleteInquiry(board);
	}

	@Override
	public Board getInquiryByUseYN(Map<String, Object> paramMap) {
		return boardDao.getInquiryByUseYN(paramMap);
	}

	
    
}
