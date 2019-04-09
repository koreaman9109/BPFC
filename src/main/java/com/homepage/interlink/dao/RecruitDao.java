package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.Recruit;

public interface RecruitDao {
	int insert (Recruit recruit);
	int getContentCnt(Map<String, Object> paramMap);
	int checCnt(Map<String, Object> paramMap);
	List<Recruit> getContentList(Map<String, Object> paramMap);
	int delete (int recruit);
	Recruit read(int all_no);
	int update(Recruit recruit);
	int update2(Recruit recruit);
	List<Recruit> chec_select(Map<String, Object> paramMap);
	int updateRecuitchek(int all_no);
	Recruit filename_select(String filename);
	List<Recruit> select_tin(Map<String, Object> paramMap);
	List<Recruit> select_tin_main(Map<String, Object> paramMap);
	List<Recruit> getList(Map<String, Object> paramMap);
	int user_del(Recruit recruit);
	
	/* 
	2018-06-28 오전 10:48
	수정자 : 박권수
	내  용 : 채용 이전글 다음 글 추가
	*/
	List<Recruit> preView(Map<String, Object> paramMap);
	List<Recruit> nextView(Map<String, Object> paramMap);
}