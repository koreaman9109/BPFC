package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.homepage.interlink.model.Admin;
import com.homepage.interlink.model.Authority;
import com.homepage.interlink.model.Member;

@Service
public interface AdminService {
    // 01_01. 회원 로그인 체크
    public boolean loginCheck(Admin ad, HttpSession session);
    // 01_02. 회원 로그인 정보
    public Admin viewAdmin(Admin ad);
    //세션을 위한 권한 정보
    public Authority viewAuthority(Authority au);
    // 02. 회원 로그아웃
    public void logout(HttpSession session);
    
    List<Admin> getAdminList(Map<String, Object> paramMap);
	public void create(Admin admin) throws Exception;
	
	public String getAdmin_id(String admin_id); 
	
	Admin read(String admin_id);
	
	int getAdminCnt(Map<String, Object> paramMap);
	int getEmployeeCnt(Map<String, Object> paramMap); //직원 검색
	 
	Admin getAdminView(String admin_id);
	
	public int updateAdmin(Admin admin);  //관리자 수정
	int adminListDelete(int i);           //관리자 리스트 삭제
	int adminDelete(int admin_num);		//관리자 삭제
	
	public int idcheck(String admin_id); //관리자 id 중복 체크
	public int nocheck(String bpfc_no); //관리자 no 중복 체크
	List<Member> getEmployeeList(Map<String, Object> paramMap); //직원 리스트
	public Member employeeView(Member member);
	
	int retireCnt(Map<String, Object> paramMap); //퇴사자 조회수 
	
	List<Admin> retireList(Map<String, Object> paramMap); //퇴사자 목록
	
	
	
	
	
	
	
	
	
	
	



}