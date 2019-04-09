package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Placem;

@Repository
public class PlacemImpl implements PlacemDao {
	
	@Autowired
	private SqlSessionTemplate pl;

	@Override
	public int insert(Placem placem) {
		return pl.insert("placems.insert", placem);
	}

	@Override
	public List<Placem> select(Map<String, Object> paramMap) {
		return pl.selectList("placems.select", paramMap);
	}

	@Override
	public int delete(int no) {
		return pl.delete("placems.delete", no);
	}
	
	@Override
	public List<Placem> getList(Map<String, Object> paramMap) {
		return pl.selectList("placems.selectBoardContent", paramMap);
	}
	@Override
	public int selectContentCnt(Map<String, Object> paramMap) {
		return pl.selectOne("placems.selectContentCnt", paramMap);
	}

}
