package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Authority;

@Repository
public class AuthorityDaoImpl implements AuthorityDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(Authority authority) {
		return sqlSession.insert("authoritys.insert", authority);
	}
	@Override
	public String authority(Map<String, Object> authority) {

		return sqlSession.selectOne("authoritys.getAuth", authority);
	}
	
	@Override
	public String getRecruitAuth(Map<String, Object> authority) {

		return sqlSession.selectOne("authoritys.getRecruitAuth", authority);
	}
	
	@Override
	public String auView_name(Map<String, Object> authority) {
		
		return sqlSession.selectOne("authoritys.getView_name", authority);
	}
	
	@Override
	public int update(Authority authority) {
		
		return sqlSession.update("authoritys.update", authority);
	}
	@Override
	public List<Authority> getAdminAuthority(String admin_id) {
		return sqlSession.selectList("authoritys.adminAuthority",admin_id);
	}
	
	
	@Override
	public int delete(String admin_id) {
		
		return sqlSession.delete("authoritys.delete", admin_id);
	}
	@Override
	public List<Authority> Authority_board_id(Map<String, Object> paramMap) {
		return sqlSession.selectList("authoritys.Authority_board_id", paramMap);
	}
	@Override
	public int autDelete(int admin_num) {
		return sqlSession.delete("authoritys.autDelete", admin_num);
	}


	


}
