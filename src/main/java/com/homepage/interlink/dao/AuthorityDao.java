package com.homepage.interlink.dao;


import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Authority;


public interface AuthorityDao {
	int insert (Authority authority);
	public String authority(Map<String, Object> authority);
	int update(Authority authority);
	List<Authority> getAdminAuthority(String admin_id);
	int delete(String admin_id);
	List<Authority> Authority_board_id(Map<String, Object> paramMap);
	int autDelete(int admin_num);
	public String auView_name(Map<String, Object> authority);
	public String getRecruitAuth(Map<String, Object> authority);



}
