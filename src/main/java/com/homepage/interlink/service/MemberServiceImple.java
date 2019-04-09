package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.MemberDao;
import com.homepage.interlink.model.Member;

@Service
public class MemberServiceImple implements MemberService {
	
	@Autowired
	private MemberDao md;

	@Override
	public List<Member> select(Map<String, Object> paramMap) {
		return md.select(paramMap);
	}

	@Override
	public List<Member> department_select(String department) {
		return md.department_select(department);
	}

	@Override
	public List<Member> select_all(Map<String, Object> paramMap) {
		return md.select_all(paramMap);
	}

	@Override
	public List<Member> sch_select(Map<String, Object> paramMap) {
		return md.sch_select(paramMap);
	}

}
