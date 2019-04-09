package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.Recruit_addDao;
import com.homepage.interlink.model.Recruit_add;

@Service
public class Recruit_addServiceImpl implements Recruit_addService {
	
	@Autowired
	private Recruit_addDao read;

	@Override
	public int insert(Recruit_add recruit_add) {
		return read.insert(recruit_add);
	}
	
	@Override
	public List<Recruit_add> getRecruitContentList() {
		return read.getRecruitContentList();
	}

	@Override
	public Recruit_add select(int recruit_add) {
		return read.select(recruit_add);
	}

	@Override
	public List<Recruit_add> getContentList(String re_en) {
		return read.getContentList(re_en);
	}

	@Override
	public int update_add(Recruit_add recruit_add) {
		return read.update_add(recruit_add);
	}

	@Override
	public int delete_add(int recruit_add) {
		return read.delete_add(recruit_add);
	}

	@Override
	public List<Recruit_add> getList(Map<String, Object> paramMap) {
		return read.getList(paramMap);
	}

	@Override
	public int selectContentCnt(Map<String, Object> paramMap) {
		return read.selectContentCnt(paramMap);
	}

}
