package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.ResumeDao;
import com.homepage.interlink.model.Resume;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	private ResumeDao resumed;

	@Override
	public int insert(Resume resum) {
		return resumed.insert(resum);
	}

	@Override
	public List<Resume> select(Map<String, Object> paramMap) {
		return resumed.select(paramMap);
	}

	@Override
	public int delete(int resume_no) {
		return resumed.delete(resume_no);
	}

	@Override
	public int select_privacy_no(int privacy_no) {
		return resumed.select_privacy_no(privacy_no);
	}

	@Override
	public List<Resume> all_no_select(int all_no) {
		return resumed.all_no_select(all_no);
	}

	@Override
	public String file_select(String resume_file2) {
		return resumed.file_select(resume_file2);
	}

	@Override
	public Resume delete_select(int resume_no) {
		return resumed.delete_select(resume_no);
	}

	@Override
	public int update(Resume resum) {
		return resumed.update(resum);
	}

	@Override
	public List<Resume> overlap(Map<String, Object> paramMap) {
		return resumed.overlap(paramMap);
	}

	@Override
	public int overlap1(Map<String, Object> paramMap) {
		return resumed.overlap1(paramMap);
	}

	@Override
	public int delete_update(int resume_no) {
		return resumed.delete_update(resume_no);
	}

	@Override
	public Resume resume_no_select(int resume_no) {
		return resumed.resume_no_select(resume_no);
	}

	@Override
	public int move_update(Resume resum) {
		return resumed.move_update(resum);
	}

	@Override
	public int resumeCount(int all_no) {
		return resumed.resumeCount(all_no);
	}
}
