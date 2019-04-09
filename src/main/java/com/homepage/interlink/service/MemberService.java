package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Member;

public interface MemberService {

	List<Member> select(Map<String, Object> paramMap);
	List<Member> select_all(Map<String, Object> paramMap);
	List<Member> department_select(String department);
	List<Member> sch_select(Map<String, Object> paramMap);
}
