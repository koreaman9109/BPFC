package com.homepage.interlink.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import com.homepage.interlink.model.Recruit_add;

@Repository
public class Recruit_addImpl implements Recruit_addDao {

	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int insert(Recruit_add recruit_add) {
		return sst.insert("recruits_add.insert", recruit_add);
	}
	@Override
    public List<Recruit_add> getRecruitContentList() {
       return sst.selectList("recruits_add.selectContent");
    }

	@Override
	public List<Recruit_add> getContentList(String re_en) {
		return sst.selectList("recruits_add.selectList", re_en);
	}
	@Override
	public Recruit_add select(int re_en) {
		return sst.selectOne("recruits_add.select", re_en);
	}
	@Override
	public int update_add(Recruit_add recruit_add) {
		return sst.update("recruits_add.update_add", recruit_add);
	}
	@Override
	public int delete_add(int recruit_add) {
		return sst.delete("recruits_add.delete_add", recruit_add);
	}
	@Override
	public List<Recruit_add> getList(Map<String, Object> paramMap) {
		return sst.selectList("recruits_add.selectBoardContent", paramMap);
	}
	@Override
	public int selectContentCnt(Map<String, Object> paramMap) {
		return sst.selectOne("recruits_add.selectContentCnt", paramMap);
	}

}
