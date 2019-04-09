package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Member> select(Map<String, Object> paramMap) {
		return sst.selectList("members.select", paramMap);
	}

	@Override
	public List<Member> department_select(String department) {
		return sst.selectList("members.department_select", department);
	}

	@Override
	public List<Member> select_all(Map<String, Object> paramMap) {
		return sst.selectList("members.select_all", paramMap);
	}

	@Override
	public List<Member> sch_select(Map<String, Object> paramMap) {
		return sst.selectList("members.sch_select", paramMap);
	}

}
