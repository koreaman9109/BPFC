package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Placem;

public interface PlacemService {
	int insert(Placem placem);
	List<Placem> select(Map<String, Object> paramMap);
	int delete(int no);
	List<Placem> getList(Map<String, Object> paramMap);
	int selectContentCnt(Map<String, Object> paramMap);
}
