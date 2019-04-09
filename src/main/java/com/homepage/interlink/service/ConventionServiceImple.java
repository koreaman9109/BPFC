package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.ConventionDao;
import com.homepage.interlink.model.Convention;

@Service
public class ConventionServiceImple implements ConventionService {

	@Autowired
	private ConventionDao cdao;
	
	@Override
	public int insert(Convention convention) {
		return cdao.insert(convention);
	}

	@Override
	public List<Convention> select(Map<String, Object> paramMap) {
		return cdao.select(paramMap);
	}
	
	@Override
	public List<Convention> select1(Map<String, Object> paramMap) {
		return cdao.select1(paramMap);
	}

	@Override
	public Convention conno_select(int con_no) {
		return cdao.conno_select(con_no);
	}

	@Override
	public int conno_delete(int con_no) {
		return cdao.conno_delete(con_no);
	}

	@Override
	public int update(Convention convention) {
		return cdao.update(convention);
	}

	@Override
	public List<Convention> date_select(String date) {
		return cdao.date_select(date);
	}
	
	@Override
	public List<Convention> getList(Map<String, Object> paramMap) {
		return cdao.getList(paramMap);
	}

	@Override
	public int selectContentCnt(Map<String, Object> paramMap) {
		return cdao.selectContentCnt(paramMap);
	}

	@Override
	public int user_del(Convention convention) {
		return cdao.user_del(convention);
	}

}
