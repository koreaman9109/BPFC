package com.homepage.interlink.controller;


import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.homepage.interlink.model.Admin;
import com.homepage.interlink.model.Admin_sms;
import com.homepage.interlink.model.Authority;
import com.homepage.interlink.model.Member;
import com.homepage.interlink.service.AdminService;
import com.homepage.interlink.service.AuthorityService;
import com.homepage.interlink.service.PrivacyService;

@Controller // 현재 클래스를 스프링에서 관리하는 컨트롤러 bean으로 생성
/*@RequestMapping("/admin/*") // 모든맵핑은 /member/를 상속*/
public class AdminController {
	   // 로깅을 위한 변수
        
    @Autowired
    AdminService adminService;
    
    @Autowired
    AuthorityService authorityService;
    @Autowired
    PrivacyService py;
    
    // 로그인 폼 
    @RequestMapping("login.do")
    public String login(){
        return "admin/login";    // views/member/login.jsp로 포워드
    }
    // 로그인 처리 액션
    @RequestMapping("loginCheck.do")
    public ModelAndView loginCheck(@ModelAttribute Admin ad, HttpSession session){
        boolean result = adminService.loginCheck(ad, session);
        
        ModelAndView mav = new ModelAndView();
        
        Admin ad3 = adminService.viewAdmin(ad);
        
        if (result == true) { // 로그인 성공
            // main.jsp로 이동
        	session.setAttribute("login", ad3);
        	
        	
        	
            mav.setViewName("cms_main");
            mav.addObject("msg", "success");
        } else {    // 로그인 실패
            // login.jsp로 이동
            mav.setViewName("admin/login");
            mav.addObject("msg", "failure");
        }
        return mav;
    }
    // 로그아웃 처리 액션
    @RequestMapping("logout.do")
    public ModelAndView logout(HttpSession session){
        adminService.logout(session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/login");
        mav.addObject("msg", "logout");
        return mav;
    }
    
    
    //관리자 목록
    @RequestMapping(value="/admin_list.do", method=RequestMethod.GET)
	public String admin_list(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
    	
    	Map<String, Object> paraAuth = new HashMap<String, Object>();
        paraAuth.put("admin_id", session.getAttribute("admin_id"));
        paraAuth.put("board_id", paramMap.get("board_id"));
        String auth = authorityService.authority(paraAuth);
        model.addAttribute("board_id", paramMap.get("board_id"));
        model.addAttribute("auth", auth);
        
        Map<String, Object> paraAuth2 = new HashMap<String, Object>();
		paraAuth2.put("admin_id", session.getAttribute("admin_id"));
		paraAuth2.put("board_id", paramMap.get("board_id2"));
		String auth2 = authorityService.authority(paraAuth2);
		model.addAttribute("board_id2", paramMap.get("board_id2"));
		model.addAttribute("auth2", auth2);
    	
    	//조회 하려는 페이지
        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);

        //한페이지에 보여줄 리스트 수
        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
        //일단 전체 건수를 가져온다.
        int totalCnt = adminService.getAdminCnt(paramMap);
        
        //1.하단 페이지 네비게이션에서 보여줄 리스트 수를 구한다.
        BigDecimal decimal1 = new BigDecimal(totalCnt);
        BigDecimal decimal2 = new BigDecimal(visiblePages);
        BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);
        
        int startLimitPage = 0;
        //2.mysql limit 범위를 구하기 위해 계산
        if(startPage==1){
            startLimitPage = 0;
        }else{
            startLimitPage = (startPage-1)*visiblePages;
        }
        
        paramMap.put("start", startLimitPage);
        paramMap.put("end", visiblePages);
        
 
        
        //jsp 에서 보여줄 정보 추출
        model.addAttribute("startPage", startPage+"");//현재 페이지      
        model.addAttribute("totalCnt", totalCnt);//전체 게시물수
        model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
        model.addAttribute("admin_num", paramMap.get("admin_num"));
        model.addAttribute("sch_value", paramMap.get("sch_value"));
        model.addAttribute("sch_type", paramMap.get("sch_type"));
    	
    	
        model.addAttribute("admin_list", adminService.getAdminList(paramMap));//관리자 리스트 출력
        
        

		return "admin/admin_list";
	}
    
    
  //관리자 등록 jsp 이동
    @RequestMapping("admin_join.do")
	public String admin_join(@RequestParam Map<String, Object> paramMap, Member member, Model model, HttpSession session) {
    	
    	Map<String, Object> paraAuth = new HashMap<String, Object>();
        paraAuth.put("admin_id", session.getAttribute("admin_id"));
        paraAuth.put("board_id", paramMap.get("board_id"));
        String auth = authorityService.authority(paraAuth);
        model.addAttribute("board_id", paramMap.get("board_id"));
        model.addAttribute("auth", auth);
        
        Map<String, Object> paraAuth2 = new HashMap<String, Object>();
		paraAuth2.put("admin_id", session.getAttribute("admin_id"));
		paraAuth2.put("board_id", paramMap.get("board_id2"));
		String auth2 = authorityService.authority(paraAuth2);
		model.addAttribute("auth2", auth2);
    	
    	model.addAttribute("employee_list", adminService.getEmployeeList(paramMap));
    	model.addAttribute("employeeView", adminService.employeeView(member));
		return "admin/admin_join";
	}
    
	//관리자 등록 jsp 이동
	@RequestMapping("employee_serach.do")
	public String employee_serach(@RequestParam Map<String, Object> paramMap, Model model) {
		
		try {
    	
	        //조회 하려는 페이지
	        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);
	
	        //한페이지에 보여줄 리스트 수
	        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
	        //일단 전체 건수를 가져온다.
	        int totalCnt = adminService.getEmployeeCnt(paramMap);
	        
	        //아래 1,2는 실제 개발에서는 class로 빼준다. (여기서는 이해를 위해 직접 적음)
	        //1.하단 페이지 네비게이션에서 보여줄 리스트 수를 구한다.
	        BigDecimal decimal1 = new BigDecimal(totalCnt);
	        BigDecimal decimal2 = new BigDecimal(visiblePages);
	        BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);
	        
	        //int allCount = boardService.getallCount(paramMap);
	 
	        int startLimitPage = 0;
	        //2.mysql limit 범위를 구하기 위해 계산
	        if(startPage==1){
	            startLimitPage = 0;
	        }else{
	            startLimitPage = (startPage-1)*visiblePages;
	        }
	        
	        paramMap.put("start", startLimitPage);
	        paramMap.put("end", visiblePages);
	        	        
	        //jsp 에서 보여줄 정보 추출
	        model.addAttribute("startPage", startPage+"");//현재 페이지      
	        model.addAttribute("totalCnt", totalCnt);//전체 게시물수
	        model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
	        model.addAttribute("employee_list", adminService.getEmployeeList(paramMap));
	        model.addAttribute("sch_value", paramMap.get("sch_value"));
	        model.addAttribute("sch_type", paramMap.get("sch_type"));
	        

	        
 
    	}catch(Exception e) {
    		System.out.println("=========================> ERRRRRRRRRR ");
    		e.printStackTrace();    		
    	}
    	
//    	System.out.println("=========================> E....");
	      
		return "admin/employee_serach";
}  
    
    
    
  //관리자 등록 처리
    @RequestMapping(value="/admin_insert.do", method=RequestMethod.POST)
    public String insert(@ModelAttribute Admin admin, Model model, int[] board_id, int[] view_name) throws Exception{
    	
    	adminService.create(admin);
    	admin = adminService.read(admin.getAdmin_id());
    	System.out.println("board_id  ---------------?" + board_id);
    	System.out.println("view_name ---------------?" + view_name);
    	Authority authority = new Authority();
    	
    	authority.setAdmin_num(admin.getAdmin_num());
    	authority.setAdmin_id(admin.getAdmin_id());
    	
    	
    		for( int i= 0; i < board_id.length; i++) {
    			authority.setBoard_id(board_id[i]);
    			authority.setView_name(view_name[i]);
    			authorityService.insert(authority);
        	}
    		
    		
//        authority.setAuthority(admin.getAuthority());
        
        
        return "redirect:/admin_list.do?board_id=10&board_id2=7";
    }
    
    //관리자 아이디 중복체크
    @RequestMapping("/idcheck.do")
    @ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String admin_id) {
        
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = adminService.idcheck(admin_id);
        /*System.out.println("idcheck================" + count);*/
        map.put("cnt", count);
        
 
        return map;
    }
    
    //사번 유무 체크
    @RequestMapping("/nocheck.do")
    @ResponseBody
    public Map<Object, Object> nocheck(@RequestBody String bpfc_no) {
        
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = adminService.nocheck(bpfc_no);
        /*System.out.println("nocheck================" + count);*/
        map.put("cnt", count);
        
 
        return map;
    }
    //관리자 상세보기
    @RequestMapping("admin_view.do")
    public String admin_view(@RequestParam Map<String, Object> paramMap, String admin_id, Model model, Authority authority, HttpSession session) {
    	
    	Map<String, Object> paraAuth = new HashMap<String, Object>();
        paraAuth.put("admin_id", session.getAttribute("admin_id"));
        paraAuth.put("board_id", paramMap.get("board_id"));
        String auth = authorityService.authority(paraAuth);
        model.addAttribute("board_id", paramMap.get("board_id"));
        model.addAttribute("auth", auth);
        
        Map<String, Object> paraAuth2 = new HashMap<String, Object>();
		paraAuth2.put("admin_id", session.getAttribute("admin_id"));
		paraAuth2.put("board_id", paramMap.get("board_id2"));
		String auth2 = authorityService.authority(paraAuth2);
		model.addAttribute("auth2", auth2);
    	
    	model.addAttribute("admin_view", adminService.getAdminView(admin_id));
    	model.addAttribute("auuuuuu", authorityService.Authority_board_id(paramMap));
    	

		return "admin/admin_view";
	}
    
    //관리자 수정 jsp로 이동
    @RequestMapping(value = "/adminUpdateForm.do")
	public String adminUpdateForm(@RequestParam Map<String, Object> paramMap, String admin_id, Admin admin, Model model, HttpSession session ){
    		
    	Map<String, Object> paraAuth = new HashMap<String, Object>();
        paraAuth.put("admin_id", session.getAttribute("admin_id"));
        paraAuth.put("board_id", paramMap.get("board_id"));
        String auth = authorityService.authority(paraAuth);
        model.addAttribute("board_id", paramMap.get("board_id"));
        model.addAttribute("auth", auth);
        
        Map<String, Object> paraAuth2 = new HashMap<String, Object>();
		paraAuth2.put("admin_id", session.getAttribute("admin_id"));
		paraAuth2.put("board_id", paramMap.get("board_id2"));
		String auth2 = authorityService.authority(paraAuth2);
		model.addAttribute("auth2", auth2);
//		System.out.println("paraAuth2 ================= ?" + paraAuth2);
        
        
        
			if("".equals(admin_id)) {
				admin_id = (String)session.getAttribute("admin_id");
			}
			
			List<Authority> authority = null;
			
			authority = authorityService.getAdminAuthority(admin_id);
			
			
			
			
			
			
			for(int i=0;i<authority.size();i++) {
//				System.out.println("--> " + i + " : " + authority.get(i).getAdmin_id());
//				System.out.println("--> " + i + " : " + authority.get(i).getBoard_id());
//				System.out.println("--> " + i + " : " + authority.get(i).getAuthority());
//				System.out.println("--> " + i + " : " + authority.get(i).getView_name());
			}
			

    		Admin adminVo = adminService.getAdminView(admin_id);
    		model.addAttribute("admin_view", adminVo);
    		model.addAttribute("authority", authority);
    		
    		String admin_id2 = adminService.getAdmin_id(admin_id);
//    		System.out.println("=============" + admin_id2);
			Object obj = session.getAttribute("admin_id");
//			System.out.println("=============" + obj);
			
			if(!("bpfcadmin").equals(obj.toString()) && !("interlink").equals(obj.toString())){
				
//				System.out.println("====같지않음======" + obj.toString());
				if((obj.toString()).equals(admin_id2)) {
//					System.out.println("====admin_id랑 세션이랑 같음======" + obj.toString());
					return "admin/admin_update";
				}else {
//					System.out.println("====admin_id랑 세션이랑 같지않음======" + obj.toString());
					return "redirect:/cms_main.do";
				}
			}else{
//				System.out.println("====같음======" + obj.toString());
				return "admin/admin_update";
			}
						
	}
    
    
    //관리자 게시물 수정 액션 컨트롤러
    @RequestMapping(value = {"/adminUpdate.do"}, method = {RequestMethod.POST})
	public String adminUpdate(@ModelAttribute("admin_view") Admin admin, Model model, String admin_id, int[] board_id, int[] view_name, Authority authority, HttpSession session) {
		this.adminService.updateAdmin(admin);
		admin = this.adminService.read(admin.getAdmin_id());
		
		String admin_id2 = adminService.getAdmin_id(admin_id);
//		System.out.println("=============" + admin_id2);
		Object obj = session.getAttribute("admin_id");
//		System.out.println("=============" + obj);
		
		if(("bpfcadmin").equals(obj.toString()) || ("interlink").equals(obj.toString())){
		
		this.authorityService.delete(authority.getAdmin_id());

		for (int i = 0; i < board_id.length; ++i) {
			authority.setAdmin_id(admin.getAdmin_id());
			authority.setBoard_id(board_id[i]);
			authority.setView_name(view_name[i]);
//			System.out.println("===============> : " + board_id[i]);
//			System.out.println("------------ board_id ----> : " + authority.getBoard_id());
//			System.out.println("------------ view_name----> : " + authority.getView_name());
			this.authorityService.insert(authority);
		}
		
		}

		return "redirect:/cms_main.do";
	}
    
    //관리자 리스트 체크 삭제
    @RequestMapping(value = "/adminListDelete.do", method = RequestMethod.GET)
	public String adminListDelete(@RequestParam int[] admin_num) throws Exception {
    	    	
		for (int j = 0; j < admin_num.length; j++) {
			adminService.adminListDelete(admin_num[j]);
			authorityService.autDelete(admin_num[j]);
			
		}
		return "redirect:/admin_list.do?board_id=10&board_id2=7";
		
	}
    
    //관리자 삭제 
    @RequestMapping(value = "/adminDelete.do", method = RequestMethod.GET)
	public String adminDelete(@RequestParam int admin_num) throws Exception {
    		adminService.adminDelete(admin_num);		
    		authorityService.autDelete(admin_num);
		return "redirect:/admin_list.do?board_id=10&board_id2=7";
		
	}
    

    
    /* 김영정 문의하기 알림 */
    @RequestMapping("/admin_sms.do")
    public String admin_sms(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
    	
    	Map<String, Object> paraAuth = new HashMap<String, Object>();
        paraAuth.put("admin_id", session.getAttribute("admin_id"));
        paraAuth.put("board_id", paramMap.get("board_id"));
        //String.valueOf(paraAuth.get("board_id"));

        String auth = authorityService.authority(paraAuth);
        model.addAttribute("board_id", paramMap.get("board_id"));
        model.addAttribute("auth", auth);
        
        Map<String, Object> paraAuth2 = new HashMap<String, Object>();
		paraAuth2.put("admin_id", session.getAttribute("admin_id"));
		paraAuth2.put("board_id", paramMap.get("board_id2"));
		String auth2 = authorityService.authority(paraAuth2);
		model.addAttribute("auth2", auth2);
//		System.out.println("paraAuth2 ================= ?" + paraAuth2);
    	
    	model.addAttribute("dddddddddddd", py.select1(1));
    	return "admin/admin_sms";
    }
    
    @RequestMapping(value = "/admin_sms_save.do", method = RequestMethod.POST)
    public String admin_sms_save(Admin_sms admin_sms, String insert_update) {
    	System.out.println(insert_update);
    	admin_sms.setNo(1);
    	if("I".equals(insert_update)) {
    		try {
    		py.insert1(admin_sms);
    		System.out.println("insert");
    		}catch (Exception e) {
//    			System.out.println("admin_sms_save.do - insert 실패");
			}
    	}else {
    		try {
    	py.update(admin_sms);
    	System.out.println("update");
    		}catch (Exception e) {
//    			System.out.println("admin_sms_save.do - update 실패");
			}
    	}
    	return "redirect:/admin_sms.do?board_id=10&board_id2=7";
    }
    
    /* 김영정 문의하기 알림 end */
    
  //퇴사자 목록
    @RequestMapping(value="/retire_admin_list.do", method=RequestMethod.GET)
	public String retire_admin_list(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
    	
    	Map<String, Object> paraAuth = new HashMap<String, Object>();
        paraAuth.put("admin_id", session.getAttribute("admin_id"));
        paraAuth.put("board_id", paramMap.get("board_id"));
        //String.valueOf(paraAuth.get("board_id"));

        String auth = authorityService.authority(paraAuth);
        model.addAttribute("board_id", paramMap.get("board_id"));
        model.addAttribute("auth", auth);
        
        Map<String, Object> paraAuth2 = new HashMap<String, Object>();
		paraAuth2.put("admin_id", session.getAttribute("admin_id"));
		paraAuth2.put("board_id", paramMap.get("board_id2"));
		String auth2 = authorityService.authority(paraAuth2);
		model.addAttribute("auth2", auth2);
//		System.out.println("paraAuth2 ================= ?" + paraAuth2);
    	
    	//조회 하려는 페이지
        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);

        //한페이지에 보여줄 리스트 수
        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
        //일단 전체 건수를 가져온다.
        int totalCnt = adminService.retireCnt(paramMap);
        
        //1.하단 페이지 네비게이션에서 보여줄 리스트 수를 구한다.
        BigDecimal decimal1 = new BigDecimal(totalCnt);
        BigDecimal decimal2 = new BigDecimal(visiblePages);
        BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);
        
        int startLimitPage = 0;
        //2.mysql limit 범위를 구하기 위해 계산
        if(startPage==1){
            startLimitPage = 0;
        }else{
            startLimitPage = (startPage-1)*visiblePages;
        }
        
        paramMap.put("start", startLimitPage);
        paramMap.put("end", visiblePages);
        
 
        
        //jsp 에서 보여줄 정보 추출
        model.addAttribute("startPage", startPage+"");//현재 페이지      
        model.addAttribute("totalCnt", totalCnt);//전체 게시물수
        model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
        model.addAttribute("admin_num", paramMap.get("admin_num"));
        model.addAttribute("sch_value", paramMap.get("sch_value"));
        model.addAttribute("sch_type", paramMap.get("sch_type"));
    	
    	
        model.addAttribute("admin_list", adminService.retireList(paramMap));//관리자 리스트 출력
        
        

		return "admin/retire_admin_list";
	}
    
    
}
