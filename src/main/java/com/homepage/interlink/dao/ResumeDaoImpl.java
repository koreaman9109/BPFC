package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Resume;

@Repository
public class ResumeDaoImpl implements ResumeDao {

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Resume resum) {
		return sst.insert("resumes.insert", resum);
	}

	@Override
	public List<Resume> select(Map<String, Object> paramMap) {
		return sst.selectList("resumes.select", paramMap);
	}

	@Override
	public int delete(int resume_no) {
		return sst.delete("resumes.delete", resume_no);
	}

	@Override
	public int select_privacy_no(int privacy_no) {
		return sst.selectOne("resumes.select_privacy_no", privacy_no);
	}

	@Override
	public List<Resume> all_no_select(int all_no) {
		return sst.selectList("resumes.all_no_select", all_no);
	}

	@Override
	public String file_select(String resume_file2) {
		return sst.selectOne("resumes.file_select", resume_file2);
	}

	@Override
	public Resume delete_select(int resume_no) {
		return sst.selectOne("resumes.delete_select", resume_no);
	}

	@Override
	public int update(Resume resum) {
		return sst.update("resumes.update", resum);
	}
	
	@Override
	public List<Resume> overlap(Map<String, Object> paramMap) {
		return sst.selectList("resumes.overlap", paramMap);
	}

	@Override
	public int overlap1(Map<String, Object> paramMap) {
		return sst.selectOne("resumes.overlap1", paramMap);
	}

	@Override
	public int delete_update(int resume_no) {
		return sst.update("resumes.delete_update", resume_no);
	}

	@Override
	public Resume resume_no_select(int resume_no) {
		return sst.selectOne("resumes.resume_no_select", resume_no);
	}

	@Override
	public int move_update(Resume resum) {
		return sst.update("resumes.move_update", resum);
	}

	@Override
	public int resumeCount(int all_no) {
		return sst.selectOne("resumes.resumeCount", all_no);
	}
}
