package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.homepage.interlink.model.Recruit;

@Repository
public class RecruitImpl implements RecruitDao {

	@Autowired
	private SqlSessionTemplate re;

	@Override
	public int insert(Recruit recruit) {
		return re.insert("recruits.insert", recruit);
	}
	
	@Override
    public List<Recruit> getContentList(Map<String, Object> paramMap) {
        return re.selectList("recruits.selectContent", paramMap);
    }

	@Override
	public int getContentCnt(Map<String, Object> paramMap) {
		return re.selectOne("recruits.selectContentCnt", paramMap);
	}
	
	@Override
	public int checCnt(Map<String, Object> paramMap) {
		return re.selectOne("recruits.checCnt", paramMap);
	}

	@Override
	public int delete(int recruit) {
		return re.delete("recruits.delete", recruit);
	}

	@Override
	public Recruit read(int all_no) {
		return re.selectOne("recruits.read", all_no);
	}

	@Override
	public int update(Recruit recruit) {
		return re.update("recruits.update", recruit);
	}
	@Override
	public int update2(Recruit recruit) {
		return re.update("recruits.update2", recruit);
	}

	@Override
	public List<Recruit> chec_select(Map<String, Object> paramMap) {
		return re.selectList("recruits.chec_select", paramMap);
	}

	@Override
	public int updateRecuitchek(int all_no) {
		return re.update("recruits.updateRecuitchek", all_no);
	}

	@Override
	public Recruit filename_select(String filename) {
		return re.selectOne("recruits.filename_select", filename);
	}

	@Override
	public List<Recruit> select_tin(Map<String, Object> paramMap) {
		return re.selectList("recruits.select_tin", paramMap);
	}

	@Override
	public List<Recruit> getList(Map<String, Object> paramMap) {
		return re.selectList("recruits.selectBoardContent", paramMap);
	}

	@Override
	public List<Recruit> select_tin_main(Map<String, Object> paramMap) {
		return re.selectList("recruits.select_tin_main", paramMap);
	}

	@Override
	public int user_del(Recruit recruit) {
		return re.update("recruits.user_del", recruit);
	}

	@Override
	public List<Recruit> preView(Map<String, Object> paramMap) {
		return re.selectList("recruits.preView", paramMap);
	}

	@Override
	public List<Recruit> nextView(Map<String, Object> paramMap) {
		return re.selectList("recruits.nextView", paramMap);
	}
	
	/* 
	2018-06-28 오전 10:48
	수정자 : 박권수
	내  용 : 채용 이전글 다음 글 추가
	*/
	
	
	

}
