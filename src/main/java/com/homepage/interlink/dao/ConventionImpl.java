package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Convention;

@Repository
public class ConventionImpl implements ConventionDao {

	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int insert(Convention convention) {
		return sst.insert("conventions.insert", convention);
	}

	@Override
	public List<Convention> select(Map<String, Object> paramMap) {
		return sst.selectList("conventions.select", paramMap);
	}
	
	@Override
	public List<Convention> select1(Map<String, Object> paramMap) {
		return sst.selectList("conventions.select1", paramMap);
	}

	@Override
	public Convention conno_select(int con_no) {
		return sst.selectOne("conventions.conno_select", con_no);
	}

	@Override
	public int conno_delete(int con_no) {
		return sst.delete("conventions.conno_delete", con_no);
	}

	@Override
	public int update(Convention convention) {
		return sst.update("conventions.update", convention);
	}

	@Override
	public List<Convention> date_select(String date) {
		return sst.selectList("conventions.date_select", date);
	}
	
	@Override
	public List<Convention> getList(Map<String, Object> paramMap) {
		return sst.selectList("conventions.selectBoardContent", paramMap);
	}
	@Override
	public int selectContentCnt(Map<String, Object> paramMap) {
		return sst.selectOne("conventions.selectContentCnt", paramMap);
	}

	@Override
	public int user_del(Convention convention) {
		return sst.update("conventions.user_del", convention);
	}

}
