package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Admin;
import com.homepage.interlink.model.Authority;
import com.homepage.interlink.model.Member;



@Repository // 현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class AdminDaoImpl implements AdminDao {
    // SqlSession 객체를 스프핑에서 생성하여 주입
    // 의존관계 주입(Dependency Injection), 느슨한 결합
   	@Inject
    SqlSession SqlSession;
    @Autowired
    private SqlSession sqlSession;
  
    
    // 01_01. 회원 로그인체크
    @Override
    public boolean loginCheck(Admin ad) {
        Admin name = sqlSession.selectOne("admins.loginCheck", ad);
        return (name == null) ? false : true;
    }
    // 01_02. 회원 로그인 정보
    @Override
    public Admin viewAdmin(Admin ad) {
        return sqlSession.selectOne("admins.viewAdmin", ad);
    }
    // 02. 회원 로그아웃
    @Override
    public void logout(HttpSession sessin) {
    }
	@Override
	public List<Admin> getAdminList(Map<String, Object> paramMap) {
		return sqlSession.selectList("admins.adminList", paramMap);
		
	}
	@Override
	public void create(Admin admin) throws Exception{
		SqlSession.insert("admins.create", admin);
		
	}
	@Override
	public Admin read(String admin_id) {
		return sqlSession.selectOne("admins.read", admin_id);
		
	}
	@Override
	public Admin getAdminView(String admin_id) {
		return sqlSession.selectOne("admins.adminView", admin_id);
	}
	@Override
	public int getAdminCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("admins.adminCnt", paramMap);
		 
	}
	@Override
	public int updateAdmin(Admin admin) {
		return sqlSession.update("admins.updateAdmin", admin);
	}
	//관리자 목록 리스트 삭제
	@Override
	public int adminListDelete(int admin_num) {
		return sqlSession.delete("admins.adminListDelete", admin_num);
	}
	//관리자 삭제
	@Override
	public int adminDelete(int admin_num) {
		return sqlSession.delete("admins.adminDelete", admin_num);
	}
	//관리자 id 중복체크
	@Override
	public int idcheck(String admin_id) {
		return sqlSession.selectOne("admins.idcheck", admin_id);
	}
	//관리자 no 중복체크
		@Override
		public int nocheck(String bpfc_no) {
			return sqlSession.selectOne("admins.nocheck", bpfc_no);
		}
	//직원검색
	@Override
	public int getEmployeeCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("admins.getEmployeeCnt", paramMap);
	}
	//직원 리스트
	@Override
	public List<Member> getEmployeeList(Map<String, Object> paramMap) {
		return sqlSession.selectList("admins.getEmployeeList", paramMap);
	}
	//직원 뷰
	@Override
	public Member employeeView(Member member) {
		return sqlSession.selectOne("admins.employeeView", member);
	}
	@Override
	public Authority viewAuthority(Authority au) {
		return sqlSession.selectOne("admins.viewAuthority", au);
	}
	@Override
	public String getAdmin_id(String admin_id) {
		return sqlSession.selectOne("admins.getAdmin_id", admin_id);
	}
	@Override
	public int retireCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("admins.retireCnt", paramMap);
	}
	@Override
	public List<Admin> retireList(Map<String, Object> paramMap) {
		return sqlSession.selectList("admins.retireList", paramMap);
	}
	
	
	
	

	

}