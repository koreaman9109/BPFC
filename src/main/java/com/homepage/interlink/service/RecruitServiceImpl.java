package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.RecruitDao;
import com.homepage.interlink.model.Recruit;

@Service
public class RecruitServiceImpl implements RecruitService {
	@Autowired
	private RecruitDao re;

	@Override
	public int insert(Recruit recruit) {
		return re.insert(recruit);
	}

	@Override
    public int getContentCnt(Map<String, Object> paramMap) {
        return re.getContentCnt(paramMap);
    }
	
	@Override
	public List<Recruit> getContentList(Map<String, Object> paramMap) {
		return re.getContentList(paramMap);
	}
	
	@Override
	public int checCnt(Map<String, Object> paramMap) {
		return re.checCnt(paramMap);
	}


	@Override
	public int delete(int recruit) {
		return re.delete(recruit);
	}

	@Override
	public Recruit read(int all_no) {
		return re.read(all_no);
	}

	@Override
	public int update(Recruit recruit) {
		return re.update(recruit);
	}
	
	@Override
	public int update2(Recruit recruit) {
		return re.update2(recruit);
	}

	@Override
	public List<Recruit> chec_select(Map<String, Object> paramMap) {
		return re.chec_select(paramMap);
	}

	@Override
	public int updateRecuitchek(int all_no) {
		return re.updateRecuitchek(all_no);
	}

	@Override
	public Recruit filename_select(String filename) {
		return re.filename_select(filename);
	}

	@Override
	public List<Recruit> select_tin(Map<String, Object> paramMap) {
		return re.select_tin(paramMap);
	}

	@Override
	public List<Recruit> getList(Map<String, Object> paramMap) {
		return re.getList(paramMap);
	}

	@Override
	public List<Recruit> select_tin_main(Map<String, Object> paramMap) {
		return re.select_tin_main(paramMap);
	}

	@Override
	public int user_del(Recruit recruit) {
		return re.user_del(recruit);
	}

	@Override
	public List<Recruit> preView(Map<String, Object> paramMap) {
		return re.preView(paramMap);
	}

	@Override
	public List<Recruit> nextView(Map<String, Object> paramMap) {
		return re.nextView(paramMap);
	}
	
	

}
