package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.AdminDao;
import com.homepage.interlink.model.Admin;
import com.homepage.interlink.model.Authority;
import com.homepage.interlink.model.Member;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
    AdminDao adminDao;
    
    // 01_01. 회원 로그인체크
    @Override
    public boolean loginCheck(Admin ad, HttpSession session) {
        boolean result = adminDao.loginCheck(ad);
        if (result) { // true일 경우 세션에 등록
            Admin ad2 = viewAdmin(ad);
            
            // 세션 변수 등록
            session.setAttribute("admin_num", ad2.getAdmin_num());
            session.setAttribute("admin_id", ad2.getAdmin_id());
            session.setAttribute("admin_name", ad2.getAdmin_name());
            session.setAttribute("admin_rank", ad2.getAdmin_rank());
            session.setAttribute("admin_department", ad2.getAdmin_department());
            session.setAttribute("admin_task", ad2.getAdmin_task());
            session.setAttribute("admin_nickname", ad2.getAdmin_nickname());
            session.setAttribute("admin_email", ad2.getAdmin_email());
            

            
            
        } 
        return result;
    }
    // 01_02. 회원 로그인 정보
    @Override
    public Admin viewAdmin(Admin ad) {
        return adminDao.viewAdmin(ad);
    }
    // 02. 회원 로그아웃
    @Override
    public void logout(HttpSession 
    		session) {
        // 세션 변수 개별 삭제
        // session.removeAttribute("userId");
        // 세션 정보를 초기화 시킴
        session.invalidate();
    }
    //회원 리스트출력
	@Override
	public List<Admin> getAdminList(Map<String, Object> paramMap) {
		return adminDao.getAdminList(paramMap);
	}
	//회원등록
	@Override
	public void create(Admin admin) throws Exception {
        String admin_id = admin.getAdmin_id();
        String admin_passwd = admin.getAdmin_passwd();
        String admin_name = admin.getAdmin_name();
        String admin_department = admin.getAdmin_department();
        String admin_email = admin.getAdmin_email();
        /*String admin_field = admin.getAdmin_field();*/
        String authority = admin.getAuthority();
        
        admin.setAdmin_id(admin_id);
        admin.setAdmin_passwd(admin_passwd);
        admin.setAdmin_name(admin_name);
        admin.setAdmin_department(admin_department);
        admin.setAdmin_email(admin_email);
        /*admin.setAdmin_field(admin_field);*/
        admin.setAuthority(authority);
        adminDao.create(admin);
		
	}
	@Override
	public Admin read(String admin_num) {
		return adminDao.read(admin_num);
	}
	@Override
	public Admin getAdminView(String admin_id) {
		
		return adminDao.getAdminView(admin_id);
	}
	@Override
	public int getAdminCnt(Map<String, Object> paramMap) {
		return adminDao.getAdminCnt(paramMap);
	}
	//직원 검색
	@Override
	public int getEmployeeCnt(Map<String, Object> paramMap) {
		return adminDao.getEmployeeCnt(paramMap);
	}
	
	@Override
	public int updateAdmin(Admin admin) {
		return adminDao.updateAdmin(admin);
	}
	//관리자 목록 리스트 삭제
	@Override
	public int adminListDelete(int admin_num) {
		return adminDao.adminListDelete(admin_num);
	}
	//관리자 삭제
	@Override
	public int adminDelete(int admin_num) {
		return adminDao.adminDelete(admin_num);
	}
	//관리자 id 중복체크
	@Override
	public int idcheck(String admin_id) {
		return adminDao.idcheck(admin_id);
	}
	//관리자 사번 체크
	@Override
	public int nocheck(String bpfc_no) {
		return adminDao.nocheck(bpfc_no);
	}
	
	//직원 리스트
	@Override
	public List<Member> getEmployeeList(Map<String, Object> paramMap) {
		return adminDao.getEmployeeList(paramMap);
	}
	//지권 뷰
	@Override
	public Member employeeView(Member member) {
		return adminDao.employeeView(member);
	}
	//권한 뷰
	@Override
	public Authority viewAuthority(Authority au) {
		return adminDao.viewAuthority(au);
	}
	@Override
	public String getAdmin_id(String admin_id) {
		return adminDao.getAdmin_id(admin_id);
	}
	@Override
	public int retireCnt(Map<String, Object> paramMap) {
		return adminDao.retireCnt(paramMap);
	}
	@Override
	public List<Admin> retireList(Map<String, Object> paramMap) {
		return adminDao.retireList(paramMap);
	}
	
	


}
