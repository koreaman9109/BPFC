package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Resume;

public interface ResumeService {
	
	int insert (Resume resum);
	List<Resume> select(Map<String, Object> paramMap);
	int delete(int resume_no);
	int select_privacy_no(int privacy_no);
	List<Resume> all_no_select(int all_no);
	Resume resume_no_select(int resume_no);
	String file_select(String resume_file2);
	Resume delete_select(int resume_no);
	int update(Resume resum);
	int move_update(Resume resum);
	int delete_update(int resume_no);
	List<Resume> overlap (Map<String, Object> paramMap);
	int overlap1 (Map<String, Object> paramMap);
	int resumeCount (int all_no);
}
