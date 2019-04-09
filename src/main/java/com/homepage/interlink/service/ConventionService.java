package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Convention;

public interface ConventionService {
	
	int insert(Convention convention);
	List<Convention> select(Map<String, Object> paramMap);
	List<Convention> select1(Map<String, Object> paramMap);
	Convention conno_select(int con_no);
	int conno_delete(int con_no);
	int update(Convention convention);
	List<Convention> date_select(String date);
	List<Convention> getList(Map<String, Object> paramMap);
	int selectContentCnt(Map<String, Object> paramMap);
	int user_del(Convention convention);
	
}
