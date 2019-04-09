package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.Inquiry;
import com.homepage.interlink.model.Lost;




@Repository("boardDao")
public class BoardDaoImpl implements BoardDao{
	@Inject
    SqlSession SqlSession;
    @Autowired
    private SqlSession sqlSession;
  
    @Override
	public int getBoardSeq() {
		return sqlSession.selectOne("boards.getBoardSeq");
	}

	public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
     
    @Override
    public int regContent(Map<String, Object> paramMap) {
        return sqlSession.insert("insertContent", paramMap);
    }
 
    @Override
    public int getContentCnt(Map<String, Object> paramMap) {
    	/*System.out.print("==================> DAO!! ");*/
        return sqlSession.selectOne("boards.selectBoardContentCnt", paramMap);
    }


	@Override
    public int selectInquiryContentCnt(Map<String, Object> paramMap) {
    
        return sqlSession.selectOne("boards.selectInquiryContentCnt", paramMap);
    }
    
    
   @Override
	public int getBoardAllCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("boards.getBoardAllCnt", paramMap);
	}

	@Override
    public List<Board> getContentList(Map<String, Object> paramMap) {
        return sqlSession.selectList("boards.selectBoardContent", paramMap);
    }


	@Override
	public List<Board> lostBoardContent(Map<String, Object> paramMap) {
		
		return sqlSession.selectList("boards.lostBoardContent", paramMap);
	}
    
	@Override
	public List<Board> getSearchList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectSearch", paramMap);
	}
    
    
 
    @Override
    public Board getContentView(int seq_id) {
        return sqlSession.selectOne("selectContentView", seq_id);
    }
    
    
    
 
    @Override
	public int getStep(int seq_id) {
	
		return sqlSession.selectOne("getStep", seq_id);
	}
    
    @Override
  	public int getSeq_id(int seq_id) {
  	
  		return sqlSession.selectOne("getSeq_id", seq_id);
  	}

	@Override
	public Board lostContentView(int seq_id) {
		
		return sqlSession.selectOne("lostContentView", seq_id);
	}

	@Override
    public int regReply(Map<String, Object> paramMap) {
        return sqlSession.insert("insertBoardReply", paramMap);
    }
 

    @Override
    public int delReply(Map<String, Object> paramMap) {
        return sqlSession.delete("deleteBoardReply", paramMap);
    }
 
    @Override
    public int getBoardCheck(Map<String, Object> paramMap) {
        return sqlSession.selectOne("selectBoardCnt", paramMap);
    }
 

	@Override
	public int cntBoard(Map<String, Object> paramMap) {
		
		return sqlSession.update("updateBoardHit", paramMap);
	}

	
	@Override
	public int allCount(Map<String, Object> paramMap) {
		
		return sqlSession.selectOne("allCount", paramMap);
		
	}

	
	// 게시판 리스트 삭제
	@Override
	public int ListDelete(Map<String, Object> paramMap) {
		return sqlSession.update("boards.ListDelete", paramMap);
	}

	// 게시물 삭제
	@Override
	public int BoardDelete(Board board) {
		return sqlSession.update("boards.BoardDelete", board);
	}
	
	//분실물안내 삭제
	@Override
	public int lostDelete(int seq_id) {
		return sqlSession.update("boards.lostDelete", seq_id);
	}

	
	@Override
	public Board read(int seq_id) {
		return sqlSession.selectOne("boards.read", seq_id);
	}

	@Override
	public void create(Board board) throws Exception {
		SqlSession.insert("insertContent", board);
		
	}

	@Override
	public int maxSelect(int board_id) {
		return sqlSession.selectOne("max_seq_id", board_id);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.update("updateBoard", board);
	}
	
	@Override
	public int updateAllBoard(Board board) {
		return sqlSession.update("updateAllBoard", board);
	}
	

	@Override
	public int updateLostBoard(Board board) {
		return sqlSession.update("updateLostBoard", board);
	}

	@Override
	public int userDeleteInquiry(int seq_id) {
		return sqlSession.update("userDeleteInquiry", seq_id);
	}
	

	@Override
	public int inquiryDetailDelete(int seq_id) {
		return sqlSession.update("inquiryDetailDelete", seq_id);
	}
	

	@Override
	public int inquiryInsert(Inquiry inquiry){
		return sqlSession.insert("boards.inquiryInsert", inquiry);
	}

	@Override
	public List<Board> inquiryRead(Map<String, Object> paramMap) {
		return sqlSession.selectList("boards.inquiryRead", paramMap);
	}

	@Override
	public boolean passwordCheck(Inquiry inquiry) {
        
		boolean result = false;
		
        int count = sqlSession.selectOne("boards.passwordCheck", inquiry);
/*        System.out.println("password : " + inquiry.getPassword());
        System.out.println("count : " + count);*/
        if(count == 1) result = true;
        
        return result;

	}

	@Override
	public Inquiry viewInquiry(Inquiry inquiry) {
		 return sqlSession.selectOne("boards.viewInquiry", inquiry);
	}

	@Override
	public List<Board> selectBoardMain(Map<String, Object> paramMap) {
		return sqlSession.selectList("boards.selectBoardMain", paramMap);
	}
	
	@Override
	public List<Board> selectBidMain(Map<String, Object> paramMap) {
		return sqlSession.selectList("boards.selectBidMain", paramMap);
	}

	@Override
	public void lostCreate(Lost lost) {
		 SqlSession.insert("boards.lostCreate", lost);
	}

	@Override
	public void lostInsertContent(Board board) {
		SqlSession.insert("boards.lostInsertContent", board);
		
	}

	@Override
	public List<Board> preView(Map<String, Object> paramMap) {
		return sqlSession.selectList("boards.preView", paramMap);

	}

	@Override
	public List<Board> nextView(Map<String, Object> paramMap) {
		return sqlSession.selectList("boards.nextView", paramMap);
	}

	//문의사항 상세보기 출력 원글 + 답글까지 2018-10-04 박권수
	@Override 
	public List<Board> getInquiryDetail(Map<String, Object> paramMap) {
		return sqlSession.selectList("boards.getInquiryDetail", paramMap);
	}

	@Override
	public int inquiryListDelete(Board board) {
		return sqlSession.update("boards.inquiryListDelete", board);
	}

	@Override
	public int adminDeleteInquiry(Board board) {
		return sqlSession.update("boards.adminDeleteInquiry", board);
	}

	@Override
	public Board getInquiryByUseYN(Map<String, Object> paramMap) {
		return sqlSession.selectOne("boards.getInquiryByUseYN", paramMap);
	}
	
	 
}
