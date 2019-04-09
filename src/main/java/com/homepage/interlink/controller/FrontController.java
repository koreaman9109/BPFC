package com.homepage.interlink.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.homepage.interlink.model.Admin_sms;
import com.homepage.interlink.model.Banner;
import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.BoardFile;
import com.homepage.interlink.model.Convention;
import com.homepage.interlink.model.Fileup;
import com.homepage.interlink.model.Inquiry;
import com.homepage.interlink.model.Privacy;
import com.homepage.interlink.model.Privacy_agreement;
import com.homepage.interlink.model.Recruit;
import com.homepage.interlink.model.Resume;
import com.homepage.interlink.model.SMSSend;
import com.homepage.interlink.service.BannerService;
import com.homepage.interlink.service.BoardFileService;
import com.homepage.interlink.service.BoardService;
import com.homepage.interlink.service.ConventionService;
import com.homepage.interlink.service.MemberService;
import com.homepage.interlink.service.PrivacyService;
import com.homepage.interlink.service.Privacy_agreementService;
import com.homepage.interlink.service.RecruitService;
import com.homepage.interlink.service.ResumeService;

@Controller
public class FrontController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private BoardFileService boardFileService;
	@Autowired
	private PrivacyService py;
	@Autowired
	private RecruitService re;
	@Autowired
	private ResumeService resume;
	@Autowired
	private ConventionService cvs;
	@Autowired
	private BannerService bs;
	@Autowired
	private MemberService ms;
	@Autowired
	private Privacy_agreementService pas;

	// 메인
	@RequestMapping("/main.do")
	public String main(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
		session.setAttribute("banner_use", null);
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		model.addAttribute("banner_cnt", bs.selectContentCnt(paramMap));
		model.addAttribute("banner1", bs.no_select(1));
		model.addAttribute("banner2", bs.no_select(2));
		model.addAttribute("banner3", bs.no_select(3));
		model.addAttribute("banner4", bs.no_select(4));
		model.addAttribute("tin", re.select_tin_main(paramMap));
		model.addAttribute("chk", paramMap.get("chk"));
		model.addAttribute("checCnt", re.checCnt(paramMap));
		
		model.addAttribute("mainBidList", boardService.selectBidMain(paramMap));
		model.addAttribute("mainBoardList", boardService.selectBoardMain(paramMap));
		
		return "front/main/main";
	}

	// 사이트맵
	@RequestMapping("/sitemap.do")
	public String sitemap(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/sitemap/sitemap";
	}
	//footer 개인정보처리방침
	@RequestMapping("/privacy.do")
	public String privacy(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/privacy/privacy";
	}

	/* 경영방침 */

	// 경영혁신
	@RequestMapping("/business-policies.do")
	public String business_policies(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/innovation/business-policies";
	}
	
	// 안전보건경영_안전보건경영방침
		@RequestMapping("/policy.do")
		public String policy(@RequestParam Map<String, Object> paramMap, Model model) {
			List<Banner> bn = bs.main_select(paramMap);
			model.addAttribute("banner_list", bn);
			model.addAttribute("banner_only", bs.no_select(1));
			return "front/innovation/policy";
		}

	// 안전보건경영_안전보건경영방침
	@RequestMapping("/sh-policy.do")
	public String sh_policy(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/innovation/sh-policy";
	}

	// 안전보건경영_안전보건경영시스템
	@RequestMapping("/sh-system.do")
	public String sh_system(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/innovation/sh-system";
	}

	// 안전보건경영_인증서
	@RequestMapping("/sh-certificate.do")
	public String sh_certificate(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/innovation/sh-certificate";
	}

	// 서비스헌장
	@RequestMapping("/service.do")
	public String service(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/innovation/service";
	}

	// 경영공시
	@RequestMapping("/disclosure.do")
	public String disclosure(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/innovation/disclosure";
	}

	/* BPFC센터 소개 */

	// 인사말
	@RequestMapping("/intro.do")
	public String intro(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/bpfc/intro";
	}

	// 인허가내용
	@RequestMapping("/licensing.do")
	public String licensing(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/innovation/licensing";
	}

	// BPFC개요_BPFC연혁
	@RequestMapping("/history.do")
	public String history(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/bpfc/history";
	}

	// BPFC개요_CI소개
	@RequestMapping("/ci.do")
	public String ci(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/bpfc/ci";
	}

	// BPFC개요_미션 및 비전
	@RequestMapping("/vision.do")
	public String vision(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/bpfc/vision";
	}

	// 사업_설립목적
	@RequestMapping("/object.do")
	public String object(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/bpfc/object";
	}

	// 사업_설립근거
	@RequestMapping("/grund.do")
	public String grund(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/bpfc/grund";
	}

	// 사업_주요사업
	@RequestMapping("/business.do")
	public String business(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/bpfc/business";
	}
	
	// BPFC개요_경영목표
	@RequestMapping("/business-goal.do")
	public String goal(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/bpfc/business-goal";
	}

	// 조직도
	@RequestMapping("/organization.do")
	public String organization(@RequestParam Map<String, Object> paramMap, Model model) {
		model.addAttribute("sch_value", paramMap.get("sch_value"));
		model.addAttribute("sch_type", paramMap.get("sch_type"));
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/bpfc/organization";
		
	}

	/*// 조직도_목록
	@RequestMapping("/organization2.do")
	public String organization2() {
		return "front/bpfc/organization2";
	}*/

	// 오시는 길
	@RequestMapping("/location.do")
	public String location(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/bpfc/location";
	}

	/* 부산항주요시설 */

	// 여객터미널_국제여객터미널_소개
	@RequestMapping("/international.do")
	public String international(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/international";
	}
	
	// 여객터미널_국제여객터미널_주요업무
	@RequestMapping("/international_2.do")
	public String international_2(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/international-2";
	}
	// 여객터미널_국제여객터미널_주차장이용안내
	@RequestMapping("/international_3.do")
	public String international_3(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/international-3";
	}
	// 여객터미널_국제여객터미널_운항정보
	@RequestMapping("/international_4.do")
	public String international_4(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/international-4";
	}

	// 여객터미널_연안여객터미널
	@RequestMapping("/coast.do")
	public String coast(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/coast";
	}

	// 여객터미널_국제크루즈터미널
	@RequestMapping("/cruise.do")
	public String cruise(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/cruise";
	}

	// 부산항국제컨벤션센터_컨벤션소개
	@RequestMapping("/convention-intro.do")
	public String convention_intro(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/convention";
	}

	// 부산항국제컨벤션센터_컨벤션일정
	@RequestMapping("/convention-date.do")
	public String convention_date(String con_no, Model model, Map<String, Object> paramMap) {
		List<Convention> convention = cvs.date_select(con_no);
		model.addAttribute("con_list_view", convention);
		model.addAttribute("con_no_view", con_no);
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		System.out.println(convention.toString());
		return "front/facility/convention-date";
	}

	// 공용부두 화물관리_소개
	@RequestMapping("/union.do")
	public String union(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/union";
	}
	
	// 공용부두 화물관리_주요업무
	@RequestMapping("/union_2.do")
	public String union_2(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/union-2";
	}
	// 공용부두 화물관리_화물요율표
	@RequestMapping("/union_3.do")
	public String union_3(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/union-3";
	}

	// 항만부대시설관리
	@RequestMapping("/port.do")
	public String port(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/port";
	}

	// 신항 항만시설관리_소개
	@RequestMapping("/new-port.do")
	public String new_port(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/new-port";
	}
	
	// 신항 항만시설관리_주요업무
	@RequestMapping("/new-port_2.do")
	public String new_port_2(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/new-port-2";
	}
	// 신항 항만시설관리_부산항 홍보관 안내
	@RequestMapping("/new-port_3.do")
	public String new_port_3(Model model, Map<String, Object> paramMap) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/new-port-3";
	}
		
	// 부산항국제전시컨벤션센터_소개
	@RequestMapping("/convention.do")
	public String convention(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/convention";
	}
	// 부산항국제전시컨벤션센터_주요업무
	@RequestMapping("/convention_2.do")
	public String convention_2(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/convention-2";
	}
	// 부산항국제전시컨벤션센터_이용안내
	@RequestMapping("/convention_3.do")
	public String convention_3(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/convention-3";
	}
	// 부산항국제전시컨벤션센터_일정
	@RequestMapping("/convention_4.do")
	public String convention_4(String con_no, Model model, Map<String, Object> paramMap) {
		/* 2018.09.13 오늘일정 자동표시 추가 - 김영정 */
		if (con_no == null) {
			Date today = new Date();
			SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyy/MM/dd");
			String mm = simpledateformat.format(today);
			con_no=mm;
			System.out.println("con_no="+con_no);
			List<Convention> convention = cvs.date_select(con_no);
			model.addAttribute("con_list_view", convention);
			model.addAttribute("con_no_view", con_no);
		}else {
		List<Convention> convention = cvs.date_select(con_no);
		model.addAttribute("con_list_view", convention);
		model.addAttribute("con_no_view", con_no);
		}
		
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/convention-4";
	}
		
	// 항만레저시설_이용시설
	@RequestMapping("/leisure.do")
	public String leisure(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/leisure";
	}
	// 항만레저시설_이용안내
	@RequestMapping("/leisure_2.do")
	public String leisure_2(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/leisure-2";
	}
		
	// 국제선용품유통센터_소개
	@RequestMapping("/bisc.do")
	public String bisc(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/bisc";
	}
	// 국제선용품유통센터_시설현황
	@RequestMapping("/bisc_2.do")
	public String bisc_2(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/bisc-2";
	}
	// 국제선용품유통센터_시설현황
	@RequestMapping("/bisc_3.do")
	public String bisc_3(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/bisc-3";
	}
		
	// 기타항만시설관리
	@RequestMapping("/etc.do")
	public String etc(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/etc";
	}

	// 친수시설관리_친수시설
	@RequestMapping("/receiving.do")
	public String receiving(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/facility/receiving";
	}
	
/*
	// 친수시설관리_기타시설
	@RequestMapping("/etc.do")
	public String etc() {
		return "front/facility/etc";
	}*/

	/* 채용정보 */

	// 채용공고
	@RequestMapping("/public.do")
	public String recruit_public(@RequestParam Map<String, Object> paramMap, Model model) {
		model.addAttribute("tin", re.select_tin(paramMap));
		/*페이징*/
		
		//조회 하려는 페이지
        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);

        //한페이지에 보여줄 리스트 수
        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
        //일단 전체 건수를 가져온다.
        int totalCnt = re.getContentCnt(paramMap);
        
        //아래 1,2는 실제 개발에서는 class로 빼준다. (여기서는 이해를 위해 직접 적음)
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
        model.addAttribute("boardList", re.getList(paramMap));
        /*페이징 end*/
        
       // model.addAttribute("allCount", allCount);//조회수
        model.addAttribute("board_id", paramMap.get("board_id"));
        model.addAttribute("sch_value", paramMap.get("sch_value"));
        model.addAttribute("sch_type", paramMap.get("sch_type"));
        
        List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/recruit/public";
	}

	// 채용본문
	@RequestMapping("/recruit-body.do")
	public String recruit_body(@RequestParam Map<String, Object> paramMap, Model model, int all_no) {
		re.updateRecuitchek(all_no);
		Recruit recruit = re.read(all_no);
		model.addAttribute("re", recruit);
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		/* 
		2018-06-28 오전 10:48
		수정자 : 박권수
		내  용 : 채용 이전글 다음 글 추가
		*/
		
		model.addAttribute("preView", re.preView(paramMap));
    	model.addAttribute("nextView", re.nextView(paramMap));
		
		return "front/recruit/recruit-body";
	}

	// 지원하기
	@RequestMapping(value = "/support.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String support(Privacy_agreement pa, @RequestParam Map<String, Object> paramMap, Model model) {
		pa = pas.last_select(paramMap);
		model.addAttribute("privacy", pa);
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/recruit/support";
	}

	// 알림서비스
	@RequestMapping("/notice-service1.do")
	public String notice_service1(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/recruit/notice-service1";
	}
	@RequestMapping("/notice-service2.do")
	public String notice_service2(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/recruit/notice-service2";
	}

	/* 고객지원 */

	// 공지사항
		@RequestMapping("/center-news.do")
		public String center_news(@RequestParam Map<String, Object> paramMap, Model model, int board_id) {
			
				try {
	    		
	    	
		        //조회 하려는 페이지
		        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);
		
		        //한페이지에 보여줄 리스트 수
		        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
		        //일단 전체 건수를 가져온다.
		        int totalCnt = boardService.getContentCnt(paramMap);
		        
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
		        model.addAttribute("board_list", boardService.getContentList(paramMap));
		       // model.addAttribute("allCount", allCount);//조회수
		        model.addAttribute("board_id", paramMap.get("board_id"));
		        model.addAttribute("sch_value", paramMap.get("sch_value"));
		        model.addAttribute("sch_type", paramMap.get("sch_type"));
		       
		        
		        model.addAttribute("file_list", boardFileService.getRead(paramMap));

		        
	 
	    	}catch(Exception e) {
	    		System.out.println("=========================> ERRRRRRRRRR ");
	    		e.printStackTrace();    		
	    	}
	    	
//	    	System.out.println("=========================> E....");
	    	
	    	List<Banner> bn = bs.main_select(paramMap);
			model.addAttribute("banner_list", bn);
			model.addAttribute("banner_only", bs.no_select(1));
			
			
			return "front/customer/center-news";
		}

		// 공지사항_본문
		@RequestMapping("/center-news-body.do")
		public String center_news_body(@RequestParam Map<String, Object> paramMap, Model model) {
			
	    	model.addAttribute("file_list", boardFileService.getRead(paramMap));
	    	paramMap.put("board_cnt", boardService.getcntBoard(paramMap));
	    	model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
	    	
	    	model.addAttribute("board_id", paramMap.get("board_id"));
	    	

	    	model.addAttribute("preView", boardService.preView(paramMap));
	    	model.addAttribute("nextView", boardService.nextView(paramMap));

	    	
	    	List<Banner> bn = bs.main_select(paramMap);
			model.addAttribute("banner_list", bn);
			model.addAttribute("banner_only", bs.no_select(1));

	    	return "front/customer/center-news-body";
		}

	// 사보
	@RequestMapping("/newsletter.do")
	public String newsletter(@RequestParam Map<String, Object> paramMap, Model model) {
		
		try {
    		

	    	
	        //조회 하려는 페이지
	        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);
	
	        //한페이지에 보여줄 리스트 수
	        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):6);
	        //일단 전체 건수를 가져온다.
	        int totalCnt = boardService.getContentCnt(paramMap);
	        
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
	        model.addAttribute("board_list", boardService.getContentList(paramMap));
	       // model.addAttribute("allCount", allCount);//조회수
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        model.addAttribute("sch_value", paramMap.get("sch_value"));
	        model.addAttribute("sch_type", paramMap.get("sch_type"));
	        

	        
 
    	}catch(Exception e) {
    		System.out.println("=========================> ERRRRRRRRRR ");
    		e.printStackTrace();    		
    	}
    	
//    	System.out.println("=========================> E....");
    	
    	List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		
		return "front/customer/newsletter";
	}

	// 사보_본문
	@RequestMapping("/newsletter-body.do")
	public String newsletter_body(@RequestParam Map<String, Object> paramMap, Model model) {
		
		
		List<BoardFile> boardFile = boardFileService.getRead(paramMap);
    	BoardFile pdfFile = new BoardFile();
    	
    	for(BoardFile file:boardFile) {
    		if(".pdf".equals(file.getExtention_name().toLowerCase())) {
    			pdfFile = file;
    		}
    	}
    	model.addAttribute("preView", boardService.preView(paramMap));
    	model.addAttribute("nextView", boardService.nextView(paramMap));

    	model.addAttribute("pdfFile", pdfFile);

    	model.addAttribute("file_list", boardFileService.getRead(paramMap));

    	paramMap.put("board_cnt", boardService.getcntBoard(paramMap));

        model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
        model.addAttribute("board_id", paramMap.get("board_id"));
		
        List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		
		return "front/customer/newsletter-body";
	}

	// 포토갤러리
	@RequestMapping("/photo.do")
	public String photo(@RequestParam Map<String, Object> paramMap, Model model, int board_id) {
try {
    		

    	
	        //조회 하려는 페이지
	        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);
	
	        //한페이지에 보여줄 리스트 수
	        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):6);
	        //일단 전체 건수를 가져온다.
	        int totalCnt = boardService.getContentCnt(paramMap);
	        
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
	        model.addAttribute("board_list", boardService.getContentList(paramMap));
	       // model.addAttribute("allCount", allCount);//조회수
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        model.addAttribute("sch_value", paramMap.get("sch_value"));
	        model.addAttribute("sch_type", paramMap.get("sch_type"));
	        

	        
 
    	}catch(Exception e) {
    		System.out.println("=========================> ERRRRRRRRRR ");
    		e.printStackTrace();    		
    	}
    	
//    	System.out.println("=========================> E....");
    	
    	List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
	      		
		return "front/customer/photo";
	}

	// 포토갤러리_본문
	@RequestMapping("/photo-body.do")
	public String photo_body(@RequestParam Map<String, Object> paramMap, Model model) {
		
		
		model.addAttribute("preView", boardService.preView(paramMap));
    	model.addAttribute("nextView", boardService.nextView(paramMap));

    	model.addAttribute("file_list", boardFileService.getRead(paramMap));

    	

    	paramMap.put("board_cnt", boardService.getcntBoard(paramMap));

        model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
        model.addAttribute("board_id", paramMap.get("board_id"));

        
        List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		
		return "front/customer/photo-body";
	}

	// 입찰정보
	@RequestMapping("/bid.do")
		
		public String bid(@RequestParam Map<String, Object> paramMap, Model model, int board_id) {
			
			try {
    		
    	
	        //조회 하려는 페이지
	        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);
	
	        //한페이지에 보여줄 리스트 수
	        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
	        //일단 전체 건수를 가져온다.
	        int totalCnt = boardService.getContentCnt(paramMap);
	        
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
	        model.addAttribute("board_list", boardService.getContentList(paramMap));
	       // model.addAttribute("allCount", allCount);//조회수
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        model.addAttribute("sch_value", paramMap.get("sch_value"));
	        model.addAttribute("sch_type", paramMap.get("sch_type"));

	        
 
    	}catch(Exception e) {
    		System.out.println("=========================> ERRRRRRRRRR ");
    		e.printStackTrace();    		
    	}
    	
//    	System.out.println("=========================> E....");
    	
    	List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		
		return "front/recruit/bid";
	}

	// 입찰정보_본문
	@RequestMapping("/bid-body.do")
	public String bid_body(@RequestParam Map<String, Object> paramMap, Model model) {
		
		model.addAttribute("preView", boardService.preView(paramMap));
    	model.addAttribute("nextView", boardService.nextView(paramMap));
		model.addAttribute("file_list", boardFileService.getRead(paramMap));
    	paramMap.put("board_cnt", boardService.getcntBoard(paramMap));
    	model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
    	model.addAttribute("board_id", paramMap.get("board_id"));
    	
    	List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		
		return "front/recruit/bid-body";
	}

	// 문의사항 목록
	@RequestMapping("/inquiry.do")
	public String inquiry(@RequestParam Map<String, Object> paramMap, Model model, int board_id, HttpSession session) {
		
    	try {
	       
    		
    		//조회 하려는 페이지
	        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);
	
	        //한페이지에 보여줄 리스트 수
	        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
	        	        
	        //일단 전체 건수를 가져온다.
	        /*int totalCnt = boardService.getContentCnt(paramMap);*/
	        int totalCnt = boardService.selectInquiryContentCnt(paramMap);
	          
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
	        model.addAttribute("inquiry_list", boardService.inquiryRead(paramMap));
	        /*model.addAttribute("inquiry_list", boardService.getContentList(paramMap));*/
	        // model.addAttribute("allCount", allCount);//조회수
//	        model.addAttribute("division_list", boardService.divisionRead(seq_id));
//	        model.addAttribute("inquiry_division", paramMap.get("inquiry_division"));
	        model.addAttribute("seq_id", paramMap.get("seq_id")); 
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        model.addAttribute("sch_value", paramMap.get("sch_value"));
	        model.addAttribute("sch_type", paramMap.get("sch_type"));
	        model.addAttribute("rtn", paramMap.get("rtn"));
	        
	        
	        /*권수
	        model.addAttribute("allCount", boardService.getallCount(paramMap));
	        */
 
    	}catch(Exception e) {
    		e.printStackTrace();    		
    	}
    	

    	
    	List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
    	
    	
		return "front/customer/inquiry";
	}
	
	@RequestMapping("/inquiry_popgo.do")
	public String inquiry_popgo() {
		return "front/customer/inquiry_popgo";
	}
	
	@RequestMapping("/inquiry_nice_text.do")
	public String inquiry_nice_text() {
		return "front/customer/inquiry_nice_text";
	}
	
	
	/*나이스 인증완료시 문의하기 작성창 넘어가는 액션*/
	@RequestMapping(value = "/inquiry_nice_ac.do", method = RequestMethod.POST)
	public String inquiry_nice_ac(@RequestParam(value = "name2") String name2, @RequestParam(value = "mobileno2") String mobileno2, @RequestParam Map<String, Object> paramMap, Model model) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("name", name2);
		params.put("mobileno", mobileno2);
		model.addAttribute("nice", params);
		model.addAttribute("인증완료", "check");
		model.addAttribute("titlelist", re.chec_select(paramMap));
		model.addAttribute("privacy", pas.last_select(paramMap));
		
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		
		return "front/customer/inquiry-write";
	}

	@RequestMapping("/inquiry_nice_iframe.do")
	public String inquiry_nice_iframe() {
		return "front/customer/inquiry_nice_iframe";
	}
	
	


	// 문의사항_본문
	@RequestMapping("/inquiry-body.do")
	public String inquiry_body(@RequestParam Map<String, Object> paramMap, int seq_id,  Board board, Inquiry inquiry, HttpServletRequest request, Model model, HttpSession session) {
    	
				model.addAttribute("inquiry_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id")))); //문의하기 원글에대한 seq_id가져옴 2018-10-04 박권수
				model.addAttribute("inquiry_detail2", boardService.getInquiryDetail(paramMap)); //답글까지 같이 뿌려주기위한 top_seq로 묶인 list 2018-10-04 박권수
				paramMap.put("board_cnt", boardService.getcntBoard(paramMap));
				model.addAttribute("file_list", boardFileService.getRead(paramMap));
				model.addAttribute("rtn", paramMap.get("rtn"));
				
				List<Banner> bn = bs.main_select(paramMap);
				model.addAttribute("banner_list", bn);
				model.addAttribute("banner_only", bs.no_select(1));
				
				int step = boardService.getStep(seq_id);
				int seq = boardService.getSeq_id(seq_id);
				String numStr2 = String.valueOf(seq);
				Object obj = session.getAttribute("seq_id");
				
				
			if(step == 0) {
				if(obj == null) {
					
					/*2018-06-24 오후 1시 48분
					수정자 : 박권수
					내용  : 값이 null 일때 메인으로 팅김*/
					

					return "redirect:/main.do?chk=F";
					
				}else if((obj.toString()).equals(numStr2)) {

					return "front/customer/inquiry-body";
					
				}else {

					
					return "redirect:/main.do?chk=F";
				}
					
		
			}
			return "front/customer/inquiry-body";
	}
		
		
	
	
	/* 문의사항 다운로드 */
    @RequestMapping("/inquiryUserFileDown.do")
    private void inquiryFileDown(String file_name, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	request.setCharacterEncoding("UTF-8");
    	
    	String u = boardFileService.file_select(file_name);
    	
        	try {
			/* 상대경로 */
    		String file_path = request.getSession().getServletContext().getRealPath("/");
    		String attach_path = "resources/board/userinquiry/";
    		String savePath = file_path+attach_path;
    		String fileName = file_name;

    		
    		//실제 내보낼 파일명
    		String oriFileName = u;
    		InputStream in = null;
    		OutputStream os = null;
    		File file = null;
    		boolean skip = false;
    		String client = "";
    		
    		//파일을 읽어 스트림에 담기
    		try {
				file = new File(savePath, fileName);
				in = new FileInputStream(file);
			} catch (FileNotFoundException fe) {
				skip = true;
			}
    		
    		client = request.getHeader("User-Agent");
    		
    		
    		//파일 다운로드 헤더 지정 
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");
            
            
            
            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                    
                    // IE 11 이상.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    // 한글 파일명 처리
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
                response.setContentType("text/html;charset=UTF-8");
                System.out.println("파일을 찾을 수 없습니다.");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }
        
    	
    }

	//문의사항 작성처리
    @RequestMapping(value="/inquiry_user_insert.do", method=RequestMethod.POST)
    public String insert(@ModelAttribute Privacy privacy, Board board, Inquiry inquiry, Fileup fileup, HttpServletRequest request, Model model, SMSSend smssend) throws Exception{
    	
    	int b_seq = boardService.getBoardSeq();
    	board.setAdmin_id("user");
    	board.setUpdate_id("user");
    	board.setView_name("user");
    	board.setAdmin_name("user");
    	board.setAdmin_nickname("user");
    	board.setAdmin_rank("user");
    	board.setAdmin_department("user");
    	board.setAdmin_task("user");
    	board.setAdmin_email("user");
    	board.setSeq_id(b_seq);
    	board.setTop_seq(b_seq);//답글 게시판일경우 최상위 게시물 번호
    	board.setPre_seq(b_seq);//답글 게시판일경우 앞글 게시물 번호
    	board.setStep(0); //답글 게시판일 경우 앞글의 Step + 1
    	board.setUse_yn("Y");
    	board.setSeq_id(b_seq);
    	
    	
    	board.setUpdate_id(board.getAdmin_id());
    	    	   	
    	boardService.create(board);
    	inquiry.setUser_name(privacy.getPrivacy_name());
        inquiry.setSeq_id(board.getSeq_id());
        inquiry.setBoard_id(board.getBoard_id());
        inquiry.setUse_yn("Y");
        
        boardService.inquiryInsert(inquiry);
        
        board = boardService.read(board.getSeq_id());
        BoardFile boardFile = new BoardFile();
        boardFile.setBoard_id(board.getBoard_id());
        boardFile.setSeq_id(board.getSeq_id());
        boardFile.setAdmin_id(board.getAdmin_id());
        boardFile.setUpdate_id(board.getAdmin_id()); 
        boardFile.setUse_yn("Y");
        
        /*파일*/
        Calendar cal = Calendar.getInstance()  ;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
        String time = dateFormat.format(cal.getTime());
      
		List<MultipartFile> files = fileup.getUploadfile();
		System.out.println("File ----->" + files);
		if (null != files && files.size() > 0) {
			
			for (MultipartFile multipartFile : files) {
				if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
				
					System.out.println("file = " + multipartFile.getOriginalFilename() + "/" + multipartFile.getSize());
				/*	 상대경로*/ 
					String file_path = request.getSession().getServletContext().getRealPath("/");
					String attach_path = "resources/board/userinquiry/";
					String file_name = multipartFile.getOriginalFilename();
					String file_name2 = time + "_" + UUID.randomUUID().toString() +"_" +file_name;
					
					File f = new File(file_path + attach_path + file_name2);
					System.out.println("===========문의하기관리자 실제 Path=========" + f);
					try {
						multipartFile.transferTo(f);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}


					
				/*	이력서 model에 파일명,주소 저장*/
					boardFile.setFile_name(file_name);
					boardFile.setFile_name2(file_name2);
					boardFile.setFile_path("/" + attach_path);
					
			         /*파일명에서 확장자 추출 */
					String filename = boardFile.getFile_name();
					int fileLen = filename.length();
					int lastDot = filename.lastIndexOf('.');
					String fileExt = filename.substring(lastDot, fileLen).toLowerCase();
					boardFile.setExtention_name(fileExt);
					
					System.out.println("확장명 : " + fileExt);
					
					
					try { 
						
						boardFileService.insert(boardFile);
					} catch (Exception e) {
						model.addAttribute("msg", "다시 입력하세요.");
					}
				}
			}
		}
		
		/* 김영정 문의하기 등록 알림 sms */
		Admin_sms admin_sms = py.select1(1);
		String u = admin_sms.getUSE_YN();
		
		if("Y".equals(u)) {
		String phone1 = admin_sms.getPhone1();
		String phone2 = admin_sms.getPhone2();
		String phone3 = admin_sms.getPhone3();
		smssend.setSphone1("051");
		smssend.setSphone2("400");
		smssend.setSphone3("3104");
		smssend.setMember(0);
		smssend.setInDate("");
		smssend.setInTime("");
		smssend.setRphone1(phone1);
		smssend.setRphone2(phone2);
		smssend.setRphone3(phone3);
		smssend.setSendName("sendName");
		smssend.setRecvName("문의하기담당자");
		smssend.setUrl("https://www.bpfmc.or.kr");
		System.out.println(smssend.toString());
		try {
			py.smsinsert(smssend);
			System.out.println("문자 db저장");
		}catch (Exception e) {
			System.out.println("문자저장실패");
		}
		}
		
		/* 김영정 문의하기 등록 알림 sms end */
      
        return "redirect:/inquiry.do?board_id=" + board.getBoard_id();
    }
    
    // 문의사항 사용자 게시물 로그인 비밀번호  확인창 
    @RequestMapping("passwordLoginForm.do")
    public String passwordLoginForm(@RequestParam int seq_id, Model model){
    	model.addAttribute("seq_id", seq_id); 
    	/*model.addAttribute("UrlPatten", "P");*/
    	
    	return "front/customer/inquiry_login_passwordchk";
    	
    }
    // 문의사항 비밀번호 수정 확인창 
    @RequestMapping("passwordUpdateForm.do")
    public String passwordUpdateForm(@RequestParam int seq_id, Model model){
    	model.addAttribute("seq_id", seq_id); 
    	
    	
    	return "front/customer/inquiry_update_passwordchk";
    	
    }
 // 문의사항 비밀번호 삭제 확인창 
    @RequestMapping("passwordDeleteForm.do")
    public String passwordDeleteForm(@RequestParam Map<String, Object> paramMap, int seq_id, Model model){
    	model.addAttribute("board_detail2", boardService.getInquiryDetail(paramMap));
    	model.addAttribute("seq_id", seq_id); 
    	
    	
    	return "front/customer/inquiry_delete_passwordchk";
    	
    }
  //문의하기 사용자 게시물 로그인 비밀번호 확인 처리
    @RequestMapping("passwordLoginCheck.do")
    public String passwordLoginCheck(@ModelAttribute Inquiry inquiry, Board board, Model model, HttpSession session) {

    	
    	/*boolean result = boardService.passwordCheck(paramMap);*/
    	boolean result = boardService.passwordCheck(inquiry, session);
    	
       if(result == true){ 
    	   
            return "redirect:/inquiry-body.do?seq_id=" + board.getSeq_id();
        } else { 

        	return "redirect:/inquiry.do?board_id=5&rtn=F";
        }
 
    }
    
    //문의하기 사용자 수정 비밀번호 확인 처리
    @RequestMapping("passwordUpdateCheck.do")
    public String passwordUpdateCheck(@ModelAttribute Inquiry inquiry, Board board, Model model, HttpSession session) {

    	
    	boolean result = boardService.passwordCheck(inquiry, session);
    	
    	Inquiry iq1 = boardService.viewInquiry(inquiry);
       if(result == true){ 
           
           	session.setAttribute("userChk", iq1);
            return "redirect:/inquiryUserUpdateForm.do?seq_id=" + board.getSeq_id();
        } else { 

        	return "redirect:/inquiry-body.do?seq_id=" + board.getSeq_id() + "&rtn=F";
        }
 
    }
  //2018-10-05 
    //원글 삭제시 나머지 답글까지 use_yn='N' 처리
    //문의하기 사용자 삭제 액션 컨트롤러 &  비밀번호 처리
    @RequestMapping("passwordDeleteCheck.do")
    public String passwordDeleteCheck(int[] seq_id, @ModelAttribute Inquiry inquiry, Board board, BoardFile boardFile, Model model, HttpSession session){

    	boolean result = boardService.passwordCheck(inquiry, session);
    	

       if(result){
    	   for(int i = 0; i < seq_id.length; i++) {
    		   boardService.inquiryDetailDelete(seq_id[i]);
    		   boardService.userDeleteInquiry(seq_id[i]);
    		   boardFileService.userFileDeleteBySeqid(seq_id[i]);
       	
       	}
            return "redirect:/inquiry.do?board_id=5";
        } else { 
        	
        	model.addAttribute("message", "비밀번호 불일치");
        	return "redirect:/inquiry-body.do?seq_id=" + board.getSeq_id() + "&rtn=F";
        }
    }
  //문의하기 사용자 수정 jsp로 이동
    @RequestMapping(value = "/inquiryUserUpdateForm.do")
    public String inquiryUserUpdateForm(@RequestParam Map<String, Object> paramMap, int seq_id, Model model, String password, HttpSession session) {
    	
    	
    	 
    	model.addAttribute("inquiry_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
    	 
    	 
    	 model.addAttribute("file_list", boardFileService.getRead(paramMap));
    	 
    	 paramMap.put("board_cnt", boardService.getcntBoard(paramMap));
    	 model.addAttribute("board_id", paramMap.get("board_id"));
    	 model.addAttribute("password", password);
    	 /*model.addAttribute("inquiry_detail", boardService.getContentView(paramMap));*/
    	 
   	    int step = boardService.getStep(seq_id);
		int seq = boardService.getSeq_id(seq_id);
		String numStr2 = String.valueOf(seq);
		Object obj = session.getAttribute("seq_id");


			
		if(step == 0) {
			if(obj == null) {
				
				/*2018-06-24 오후 1시 48분
				수정자 : 박권수
				내용  : 값이 null 일때 메인으로 팅김*/ 
				                                    

				return "redirect:/main.do?chk=F";
			}else if((obj.toString()).equals(numStr2)) {

				return "front/customer/inquiry-update";
			}else{   

				
				return "redirect:/main.do?chk=F";
			}
				
	
		}

    		
    		
    		return "front/customer/inquiry-update";

		
	}
    
    //문의하기 사용자 수정 액션 컨트롤러
    
    @RequestMapping(value = "/inquiryUserUpdate.do", method = RequestMethod.POST)
   	public String inquiryBoardUpdate(@RequestParam Map<String, Object> paramMap, @ModelAttribute Board board,  Fileup fileup, HttpServletRequest request, Model model, String[] fileKey, String[] flag, String[] fName) {
    		
    	board.setAdmin_id("user");
    	board.setUpdate_id("user");
   		boardService.updateBoard(board);
   		BoardFile boardFile = new BoardFile();
   		boardFile.setAdmin_id(board.getAdmin_id());
   		boardFile.setSeq_id(board.getSeq_id());
   		boardFile.setBoard_id(board.getBoard_id());
   		boardFile.setUpdate_id("user");
        boardFile.setAdmin_id(board.getAdmin_id());
        boardFile.setUse_yn("Y");
        
        /*파일*/
        Calendar cal = Calendar.getInstance()  ;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
        String time = dateFormat.format(cal.getTime());
        
        
		List<MultipartFile> files = fileup.getUploadfile();
		System.out.println("File ----->" + files);
		
		if (null != files && files.size() > 0) {
			
			for (MultipartFile multipartFile : files) {
				if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
				
					System.out.println("file = " + multipartFile.getOriginalFilename() + "/" + multipartFile.getSize());
				/*	 상대경로*/ 
					String file_path = request.getSession().getServletContext().getRealPath("/");
					String attach_path = "resources/board/userinquiry/";
					String file_name = multipartFile.getOriginalFilename();
					String file_name2 = time+ "_" + UUID.randomUUID().toString() +"_" +file_name;
					File f = new File(file_path + attach_path +file_name2);
					System.out.println("=========문의하기 관리자 실제 경로 path=====" + f);
					try {
						multipartFile.transferTo(f);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}

					
				/*	이력서 model에 파일명,주소 저장*/
					boardFile.setFile_name(file_name);
					boardFile.setFile_name2(file_name2);
					boardFile.setFile_path("/" + attach_path);
					
			         /*파일명에서 확장자 추출 */
					String filename = boardFile.getFile_name();
					int fileLen = filename.length();
					int lastDot = filename.lastIndexOf('.');
					String fileExt = filename.substring(lastDot, fileLen).toLowerCase();
					boardFile.setExtention_name(fileExt);
					
					System.out.println("확장명 : " + fileExt);
					
					
					try { 
						
						boardFileService.insert(boardFile);
						
					} catch (Exception e) {
						model.addAttribute("msg", "다시 입력하세요.");
					}
				}
			}
		}
		if(fileKey != null) {
		
		for(int i=0; i<fileKey.length ; i++) {
			
			System.out.println("===========fileKey==============>" + fileKey[i]);
			System.out.println("===========flag==============>" + flag[i]);
    		System.out.println("===========fName==============>" + fName[i]);

    		//flag가 D인건 삭제. 데이터도 삭제, 파일도 삭제.
			if("D".equals(flag[i])) {

					boardFileService.fileDeleteByFileKey(Integer.parseInt(fileKey[i]));
				System.out.println("======================== last : " + boardFileService.fileDelete(Integer.parseInt(fileKey[i])));
					
			}
		}
		
     
        }
       		return "redirect:/inquiry-body.do?seq_id=" + board.getSeq_id();

   		
   	}

    /*    
    //2018-10-05 
    //원글 삭제시 나머지 답글까지 use_yn='N' 처리
    //문의하기 사용자 삭제 액션 컨트롤러
    @RequestMapping(value = "/userDeleteInquiry.do", method = RequestMethod.GET)
   	public String userDeleteInquiry(@RequestParam int[] seq_id) {
    	
    	for(int i = 0; i < seq_id.length; i++) {
    		boardService.userDeleteInquiry(board);
       		boardService.deleteBoard(seq_id[i]);
       		boardService.userDeleteInquiry(seq_id[i]);
    	
    	}
    		
    		
       		
       		
       		
       		return "redirect:/inquiry_list.do?board_id=5";
       		

   		
   	}
    */
    
    
    
    

	// 분실물센터
	@RequestMapping("/lost.do")
	public String lost(@RequestParam Map<String, Object> paramMap, Model model, int board_id) {
		
		try {
		    		
		    		//조회 하려는 페이지
			        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);
			
			        //한페이지에 보여줄 리스트 수
			        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
			        //일단 전체 건수를 가져온다.
			        int totalCnt = boardService.getContentCnt(paramMap);
			        
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
			        model.addAttribute("board_list", boardService.lostBoardContent(paramMap));
//			        model.addAttribute("file_list", boardFileService.getRead(paramMap));
//			        model.addAttribute("file_key", paramMap.get("file_key"));
			        model.addAttribute("file_name", paramMap.get("file_name"));
			        model.addAttribute("board_detail", boardService.lostContentView(Integer.parseInt((String) paramMap.get("board_id"))));
			        // model.addAttribute("allCount", allCount);//조회수
			        model.addAttribute("board_id", paramMap.get("board_id"));
			        model.addAttribute("sch_value", paramMap.get("sch_value"));
			        model.addAttribute("sch_type", paramMap.get("sch_type"));
			        /*model.addAttribute("listImg", boardFileService.listImg(seq_id));*/
			        /*System.out.println("==========file_name1========>" + boardFileService.listImg(seq_id));
		*/
			        
		 
		    	}catch(Exception e) {

		    		e.printStackTrace();    		
		    	}
		
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
			
		return "front/customer/lost";
	}

	// 분실물센터_본문
	@RequestMapping("/lost-body.do")
	public String lost_body(@RequestParam Map<String, Object> paramMap, Model model) {
					
			model.addAttribute("preView", boardService.preView(paramMap));
	    	model.addAttribute("nextView", boardService.nextView(paramMap));
			model.addAttribute("file_list", boardFileService.getRead(paramMap));
			paramMap.put("board_cnt", boardService.getcntBoard(paramMap));
			model.addAttribute("board_detail", boardService.lostContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
			model.addAttribute("board_id", paramMap.get("board_id"));
			
			List<Banner> bn = bs.main_select(paramMap);
			model.addAttribute("banner_list", bn);
			model.addAttribute("banner_only", bs.no_select(1));
					
		return "front/customer/lost-body";
	}

	// 분실물센터_연락처
	@RequestMapping("/lost-call.do")
	public String lost_call(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/customer/lost-call";
	}
	
	// 자료실
			@RequestMapping("/data.do")
			public String data(@RequestParam Map<String, Object> paramMap, Model model, int board_id) {
				
					try {
		    		
		    	
			        //조회 하려는 페이지
			        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);
			
			        //한페이지에 보여줄 리스트 수
			        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
			        //일단 전체 건수를 가져온다.
			        int totalCnt = boardService.getContentCnt(paramMap);
			        
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
			        model.addAttribute("board_list", boardService.getContentList(paramMap));
			       // model.addAttribute("allCount", allCount);//조회수
			        model.addAttribute("board_id", paramMap.get("board_id"));
			        model.addAttribute("sch_value", paramMap.get("sch_value"));
			        model.addAttribute("sch_type", paramMap.get("sch_type"));
			       
			        
			        model.addAttribute("file_list", boardFileService.getRead(paramMap));

			        
		 
		    	}catch(Exception e) {
		    		System.out.println("=========================> ERRRRRRRRRR ");
		    		e.printStackTrace();    		
		    	}
		    	
//		    	System.out.println("=========================> E....");
		    	
		    	List<Banner> bn = bs.main_select(paramMap);
				model.addAttribute("banner_list", bn);
				model.addAttribute("banner_only", bs.no_select(1));
				
				
				return "front/customer/data";
			}

			// 자료실_본문
			@RequestMapping("/data-body.do")
			public String data_body(@RequestParam Map<String, Object> paramMap, Model model) {
				
		    	model.addAttribute("file_list", boardFileService.getRead(paramMap));
		    	paramMap.put("board_cnt", boardService.getcntBoard(paramMap));
		    	model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
		    	
		    	model.addAttribute("board_id", paramMap.get("board_id"));
		    	
		    	model.addAttribute("preView", boardService.preView(paramMap));
		    	model.addAttribute("nextView", boardService.nextView(paramMap));
		    	
		    	List<Banner> bn = bs.main_select(paramMap);
				model.addAttribute("banner_list", bn);
				model.addAttribute("banner_only", bs.no_select(1));

		    	return "front/customer/data-body";
			}

	// 화물관리요율
	@RequestMapping("/tariff.do")
	public String tariff() {
		return "front/customer/tariff";
	}

	// 휴대폰인증
	@RequestMapping("/phone.do")
	public String phone() {
		return "front/customer/phone";
	}
	// yj

	// 채용공고 지원하기
	@RequestMapping(value = "/resume_support.do", method = RequestMethod.POST)
	public String resume_support(@RequestParam Map<String, Object> paramMap, Model model, Privacy privacy, 
			int all_no, @ModelAttribute("fileup") Fileup fileup, HttpServletRequest request, int check1) {
		/*String p = privacy.getPhone();*/
		
		List<Resume> over = resume.overlap(paramMap);
		System.out.println(over);
		model.addAttribute("over", over);
		Resume resum1 = new Resume();
		String del_filename = "";
		if(check1==0) {
		py.insert(privacy); //개인정보 insert
		}
		/* 업데이트시 이전이력서 삭제, 삭제시 필요한 파일명 추출 */
		if(check1!=0) {
			resum1.setResume_no(resume.overlap1(paramMap));
			resum1 = resume.delete_select(resum1.getResume_no());
			del_filename = resum1.getResume_file2();
		}
		/* 업데이트시 이전이력서 삭제, 삭제시 필요한 파일명 추출 end */
		Recruit recruit = re.read(all_no);
		Resume resum = new Resume();
		resum.setAll_no(recruit.getAll_no());
		resum.setTitle(recruit.getTitle());
		resum.setName(privacy.getPrivacy_name());
		String phone1=privacy.getPhone();
		privacy = py.phone_select(phone1);
		resum.setPrivacy_no(privacy.getPrivacy_no());
		
		
		/*파일*/
		Date today = new Date();
		SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyyMMdd");
		String mm = simpledateformat.format(today);
		List<MultipartFile> files = fileup.getUploadfile();
		List<String> fileNames = new ArrayList<String>();
		if (null != files && files.size() > 0) {
			for (MultipartFile multipartFile : files) {
				String root_path = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "resources/recruit/resume/";
				String fileName = multipartFile.getOriginalFilename();
				
				/*2018.10.22 - 파일명에 기호가 포함되어 있으면 다운이 안되는 오류 발견,
				파일명뒤 originafilename 대신 게시물 고유번호 입력 수정, 확장자명 위치변경 지정(압축파일 손상방지)
				김영정*/
				
				/*파일명에서 확장자 추출*/
				String filename = fileup.getFileName();
				int fileLen = filename.length();
				int lastDot = filename.lastIndexOf('.');
				String fileExt = filename.substring(lastDot, fileLen).toLowerCase();
				resum.setResume_extension(fileExt);
				
				String fileName2 = mm+UUID.randomUUID().toString()+"--no-"+resum.getAll_no()+fileExt;
				System.out.println(root_path + attach_path + fileName2);
				File f = new File(root_path + attach_path + fileName2);
				try {
					multipartFile.transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				fileNames.add(fileName);
				
				/*이력서 model에 파일명,주소 입력*/
				resum.setResume_file2(fileName2);
				resum.setResume_file(fileup.getFileName());
				resum.setResume_path(root_path + attach_path);
			}
		}
		
		/*파일명에서 확장자 추출*/
		/*String filename = resum.getResume_file();
		int fileLen = filename.length();
		int lastDot = filename.lastIndexOf('.');
		String fileExt = filename.substring(lastDot, fileLen).toLowerCase();
		resum.setResume_extension(fileExt);*/
		
		/*이력서 insert*/
		if(check1==0) {
			System.out.println("resume insert----------------------------");
			resume.insert(resum);
		}else {
			System.out.println("resume update----------------------------");
			resum.setResume_no(resume.overlap1(paramMap));
			resume.update(resum);
			
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "resources/recruit/resume/";
			
			File file = new File(root_path+attach_path+del_filename);
				System.out.println(del_filename);
				System.out.println("=========del_filename============>" + del_filename);
				
				if( file.exists()){
					if(file.delete()){
						System.out.println("파일삭제 성공");
					}else{
						System.out.println("파일삭제 실패");
					}
				}else{
					System.out.println("파일이 존재하지 않습니다.");
				}
		}
		
		/*int k = p.indexOf("-");*/
		
		//지원시 자동 문자 전송
		/*String[] arr = null;
				arr = p.split("-");
		SMSSend s = new SMSSend();
		s.setRphone1(arr[0]);
		s.setRphone2(arr[1]);
		s.setRphone3(arr[2]);
		s.setSendId("admin");
		s.setSendName("admin");
		s.setUrl("https://www.bpfmc.or.kr");
		s.setRdate("0");
		s.setRtime("0");
		s.setResult("0");
		s.setKind("S");
		s.setErrCode(0);
		s.setRetry1(0);
		s.setRetry2(0);
		s.setLastTime("0");
		s.setSphone1("051");
		s.setSphone2("400");
		s.setSphone3("3104");
		s.setMsg("(사)부산항시설관리센터 모집에 접수완료 되었습니다.");
		s.setMember(0);
		s.setInDate("");
		s.setInTime("");
		s.setRecvName(privacy.getPrivacy_name());
		py.smsinsert(s);*/
		
		
		return "redirect:/public.do";
	}
	
	@RequestMapping("/popgo.do")
	public String popgo() {
		return "front/recruit/popgo";
	}
	
	@RequestMapping("/nice_text.do")
	public String nice_text() {
		return "front/recruit/nice_text";
	}
	
	/*나이스 인증완료시 support 넘어가는 액션*/
	@RequestMapping(value = "/nice_ac.do", method = RequestMethod.POST)
	public String nice_ac(@RequestParam(value = "name2") String name2, @RequestParam(value = "mobileno2") String mobileno2, @RequestParam Map<String, Object> paramMap, Model model) {
		Map<String, Object> params = new HashMap<String, Object>();
		
		/*2중지원 방지*/
		String num = mobileno2;
		String tmp = "";
		tmp += num.substring(0, 3);
		tmp += '-';
		tmp += num.substring(3, 7);
		tmp += '-';
		tmp += num.substring(7);
		num = tmp;
		
		params.put("privacy_name", name2);
		params.put("phone", num);
		List<Resume> over = resume.overlap(params);
		
		model.addAttribute("over", over);
		
		params.put("name", name2);
		params.put("mobileno", mobileno2);
		model.addAttribute("nice", params);
		model.addAttribute("인증완료", "check");
		model.addAttribute("titlelist", re.chec_select(paramMap));
		model.addAttribute("privacy", pas.last_select(paramMap));
		return "front/recruit/support";
	}
	
	@RequestMapping(value = "/nice_ac2.do", method = RequestMethod.POST)
	public String nice_ac2(@RequestParam(value = "name2") String name2, @RequestParam(value = "mobileno2") String mobileno2, Model model, @RequestParam Map<String, Object> paramMap) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("name", name2);
		params.put("mobileno", mobileno2);
		model.addAttribute("nice", params);
		model.addAttribute("인증완료", "check");
		model.addAttribute("privacy", pas.last_select(paramMap));
		return "front/recruit/notice-service2";
	}
	
	@RequestMapping("/nice_iframe.do")
	public String nice_iframe() {
		return "front/recruit/nice_iframe";
	}
	
	@RequestMapping("/nice_iframe2.do")
	public String nice_iframe2() {
		return "front/recruit/nice_iframe2";
	}
	
	@RequestMapping(value = "/service_privacy_ac.do", method = RequestMethod.POST)
	public String service_privacy_ac(Privacy privacy) {
		py.insert(privacy);
		return "redirect:/notice-service1.do";
	}
	
	/*컨벤션 일정 뿌려주기*/
	@RequestMapping("/cal_data.do")
	@ResponseBody public List<Convention>  testJson(@RequestParam Map<String, Object> paramMap, HttpServletResponse response) {
		
		/* 현제 월부터 검색 */
		Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/01");
        paramMap.put("day", sdf.format(d));
		List<Convention> agendas = cvs.select1(paramMap);
		/*end*/
		
		/* 전체 컨벤션 일정 검색 */
		/* List<Convention> agendas = cvs.select(paramMap); */
		/* end */
		List rtnList = new ArrayList();
		
		
		try {
			for(Convention agenda: agendas){
				String s1=agenda.getCon_start_date();
				String s2=agenda.getCon_end_date();
				int startYear = Integer.parseInt(s1.substring(0,4));
				int startMonth = Integer.parseInt(s1.substring(5,7));
				int startDate = Integer.parseInt(s1.substring(8,10));
				int s3 = Integer.parseInt(s2.substring(0,4)+s2.substring(5,7)+s2.substring(8,10));
				Calendar cal = Calendar.getInstance();
				cal.set(startYear, startMonth -1, startDate);
				
		        while(true) {
		            Map<String, String> map = new HashMap();
		            String day1 = getDateByString(cal.getTime());
		            String day2 = day1.substring(0,4)+'/'+day1.substring(5,7)+'/'+day1.substring(8,10);
					map.put("title", agenda.getEvent_name());
					map.put("start", getDateByString(cal.getTime()));
					map.put("url", "convention_4.do?con_no="+day2+"");
					rtnList.add(map);
		             
		            // Calendar의 날짜를 하루씩 증가한다.
		            cal.add(Calendar.DATE, 1); // one day increment
		            // 현재 날짜가 종료일자보다 크면 종료 
		            if(getDateByInteger(cal.getTime()) > s3) break;
		        }
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		/*System.out.println("------------------------------list:"+rtnList.toString());*/
		return rtnList;
	}
	
	public static int getDateByInteger(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        return Integer.parseInt(sdf.format(date));
    }
     
    public static String getDateByString(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }
	
	@RequestMapping("/organization2.do")
	public String organization2(Map<String, Object> paramMap, String department, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sch_type", "bpfc_task2");
		map.put("sch_value", department);
		/*model.addAttribute("bpfc_list", ms.department_select(department));*/
		model.addAttribute("bpfc_list", ms.sch_select(map));
		/*model.addAttribute("bpfc", department);*/
		
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		
		return "front/bpfc/organization2";
	}
	
	/* 직원검색 */
	@RequestMapping("/organization2_sch.do")
	public String organization2_sch(@RequestParam Map<String, Object> paramMap, Model model) {
			/*model.addAttribute("bpfc", paramMap.get("sch_value"));*/
	        model.addAttribute("sch_type", paramMap.get("sch_type"));
	        model.addAttribute("bpfc_list", ms.sch_select(paramMap));
		return "front/bpfc/organization2";
	}
	
	@RequestMapping("/nice_fail.do")
	public String nice_fail() {
		return "front/recruit/nice_fail";
	}
/*	public String convention_list(@RequestParam Map<String, Object> paramMap, Model model) {
		model.addAttribute("con_list", cvs.select(paramMap));
		return "convention/convention_list";*/
	
	@RequestMapping("/pip.do")
	public String pip(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Banner> bn = bs.main_select(paramMap);
		model.addAttribute("banner_list", bn);
		model.addAttribute("banner_only", bs.no_select(1));
		return "front/front1/pip";
	}
	
	@RequestMapping("/filedown_front.do")
    private void filedown_front(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception{
        request.setCharacterEncoding("UTF-8");
        System.out.println(filename);
        //파일 업로드된 경로 
        try{
        	String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "resources/front/";
            String savePath = root_path+attach_path;
            String fileName = filename;
            System.out.println(root_path+attach_path);
            
            //실제 내보낼 파일명 
            String oriFileName = fileName;
            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";
            
            //파일을 읽어 스트림에 담기  
            try{
                file = new File(savePath, fileName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
                skip = true;
            }
            
            client = request.getHeader("User-Agent");
            
            //파일 다운로드 헤더 지정 
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");
            
            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                    // IE 11 이상.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    // 한글 파일명 처리
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
                response.setContentType("text/html;charset=UTF-8");
                System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }
        
    }
	@RequestMapping("/convention_5.do")
	   public String convention_5(@RequestParam Map<String, Object> paramMap, Model model) {
	      List<Banner> bn = bs.main_select(paramMap);
	      model.addAttribute("banner_list", bn);
	      model.addAttribute("banner_only", bs.no_select(1));
	      return "front/facility/convention-5";
	   }

}
