package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Recruit_add;

public interface Recruit_addService {
	int insert(Recruit_add recruit_add);
	List<Recruit_add> getContentList(String re_en);
	List<Recruit_add> getRecruitContentList();
	Recruit_add select(int re_en_no);
	int update_add(Recruit_add recruit_add);
	int delete_add (int recruit_add);
	List<Recruit_add> getList(Map<String, Object> paramMap);
	int selectContentCnt(Map<String, Object> paramMap);
	
}
