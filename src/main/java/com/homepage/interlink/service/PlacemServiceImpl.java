package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.PlacemDao;
import com.homepage.interlink.model.Placem;

@Service
public class PlacemServiceImpl implements PlacemService {

	@Autowired
	private PlacemDao pl;
	
	@Override
	public int insert(Placem placem) {
		return pl.insert(placem);
	}

	@Override
	public List<Placem> select(Map<String, Object> paramMap) {
		return pl.select(paramMap);
	}

	@Override
	public int delete(int no) {
		return pl.delete(no);
	}
	
	@Override
	public List<Placem> getList(Map<String, Object> paramMap) {
		return pl.getList(paramMap);
	}

	@Override
	public int selectContentCnt(Map<String, Object> paramMap) {
		return pl.selectContentCnt(paramMap);
	}

}
