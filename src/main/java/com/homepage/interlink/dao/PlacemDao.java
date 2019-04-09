package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Placem;

public interface PlacemDao {
	int insert (Placem placem);
	List<Placem> select(Map<String, Object> paramMap);
	int delete(int no);
	List<Placem> getList(Map<String, Object> paramMap);
	int selectContentCnt(Map<String, Object> paramMap);
}
