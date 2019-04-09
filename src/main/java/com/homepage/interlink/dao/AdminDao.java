package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.homepage.interlink.model.Admin;
import com.homepage.interlink.model.Authority;
import com.homepage.interlink.model.Member;


public interface AdminDao {
    // 01_01. 회원 로그인 체크
    public boolean loginCheck(Admin ad);
    // 01_02. 회원 로그인 정보
    public Admin viewAdmin (Admin ad);
    // 권한 뷰
    public Authority viewAuthority(Authority au);
    // 02. 회원 로그아웃
    public void logout(HttpSession session);
    
	public List<Admin> getAdminList(Map<String, Object> paramMap);
	public void create(Admin admin) throws Exception;
	Admin read(String admin_id);
	Admin getAdminView(String admin_id);
	int getAdminCnt(Map<String, Object> paramMap);
	int getEmployeeCnt(Map<String, Object> paramMap); //직원검색
	int updateAdmin(Admin admin);
	int adminListDelete(int admin_num);
	int adminDelete(int admin_num);
	public int idcheck(String admin_id);
	public int nocheck(String bpfc_no);
	public List<Member> getEmployeeList(Map<String, Object> paramMap);
	public Member employeeView(Member member);
	public String getAdmin_id(String admin_id);
	int retireCnt(Map<String, Object> paramMap);
	public List<Admin> retireList(Map<String, Object> paramMap);
	

	

	
	
	
}
