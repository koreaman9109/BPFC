package com.homepage.interlink.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.AuthorityDao;
import com.homepage.interlink.model.Authority;


@Service
public class AuthorityServiceImpl implements AuthorityService{
	
	@Autowired
	private AuthorityDao at; 
	
	@Override
	public int insert(Authority authority) {
		return at.insert(authority);
	}

	@Override
	public String authority(Map<String, Object> authority) {

		return at.authority(authority);
	}

	@Override
	public int update(Authority authority) {
		
		return at.update(authority);
	}

	@Override
	public int delete(String admin_id) {

		return at.delete(admin_id);
	}


	@Override
	public List<Authority> getAdminAuthority(String admin_id) {
		return at.getAdminAuthority(admin_id);
	}

	@Override
	public List<Authority> Authority_board_id(Map<String, Object> paramMap) {
		return at.Authority_board_id(paramMap);
	}

	@Override
	public int autDelete(int admin_num) {
		return at.autDelete(admin_num);
	}

	@Override
	public String auView_name(Map<String, Object> authority) {
		return at.auView_name(authority);
	}

	@Override
	public String getRecruitAuth(Map<String, Object> authority) {
		return at.getRecruitAuth(authority);
	}


}
