package com.homepage.interlink.service;


import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Admin;
import com.homepage.interlink.model.Authority;



public interface AuthorityService {
	
	int insert (Authority authority);
	
	String authority(Map<String, Object> authority);
	String getRecruitAuth(Map<String, Object> authority);
	
	String auView_name(Map<String, Object> authority);


	int update (Authority authority);

	List<Authority> Authority_board_id(Map<String, Object> paramMap);

	List<Authority> getAdminAuthority(String admin_id);

	int delete(String string);			//권한 수정
	int autDelete(int admin_num);		//권한 삭제


}
