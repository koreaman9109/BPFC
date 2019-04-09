package com.homepage.interlink.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.homepage.interlink.service.AuthorityService;
import com.homepage.interlink.model.Banner;
import com.homepage.interlink.model.Convention;
import com.homepage.interlink.model.Fileup;
import com.homepage.interlink.model.Placem;
import com.homepage.interlink.service.BoardService;
import com.homepage.interlink.model.Recruit;
import com.homepage.interlink.model.Recruit_add;
import com.homepage.interlink.model.Resume;
import com.homepage.interlink.model.SMSSend;
import com.homepage.interlink.model.SMS_td;
import com.homepage.interlink.model.Surem_admin;
import com.homepage.interlink.model.Surem_result;
import com.homepage.interlink.service.BannerService;
import com.homepage.interlink.service.ConventionService;
import com.homepage.interlink.service.PlacemService;
import com.homepage.interlink.service.PrivacyService;
import com.homepage.interlink.service.RecruitService;
import com.homepage.interlink.service.Recruit_addService;
import com.homepage.interlink.service.ResumeService;
import com.homepage.interlink.service.SMSService;

@Controller
public class CmsController {

	@Autowired
	private RecruitService re;
	@Autowired
	private Recruit_addService rea;
	@Autowired
	private PlacemService pl;
	@Autowired
	private PrivacyService py;
	@Autowired
	private ResumeService rs;
	@Autowired
	private ConventionService cvs;
	@Autowired
	private BannerService bs;
	@Autowired
	private BoardService boardService;
	@Autowired
	private AuthorityService authorityService;
	@Autowired
	private SMSService sms;

	@RequestMapping("/cms_main.do")
	public String cms_main(@RequestParam Map<String, Object> paramMap, Model model) {
		model.addAttribute("allCnt", boardService.getBoardAllCnt(paramMap));
		System.out.println(model);
		return "cms_main";
	}

	@RequestMapping("banner_view.do")
	   public String banner_view(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
	         
	      Map<String, Object> paraAuth = new HashMap<String, Object>();
	        paraAuth.put("admin_id", session.getAttribute("admin_id"));
	        paraAuth.put("board_id", paramMap.get("board_id"));
	        //String.valueOf(paraAuth.get("board_id"));

	        String auth = authorityService.authority(paraAuth);
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        model.addAttribute("auth", auth);
	        
	      //채용권한만 체크해도 sms활성화
	        Map<String, Object> paraAuth2 = new HashMap<String, Object>();
	      paraAuth2.put("admin_id", session.getAttribute("admin_id"));
	      paraAuth2.put("board_id", paramMap.get("board_id2"));
	      String auth2 = authorityService.authority(paraAuth2);
	      model.addAttribute("auth2", auth2);
	      System.out.println("paraAuth2 ================= ?" + paraAuth2);
	         
	      model.addAttribute("banner_list", bs.select(paramMap));
	      model.addAttribute("no_count", bs.banner_no_select(paramMap));
	      model.addAttribute("banner_only", bs.no_select(1));
	      return "etc/banner_view";
	   }

	/* 로딩이미지 */
	@RequestMapping("load.do")
	public String load() {
		return "load";
	}

	/* recruit controller */
	@RequestMapping("/recruit_list.do")
	public String recruit_list(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
		/* 페이징 */
		/*
		 * 날 짜: 2018-06-14 16:10 내 용: 권한추가 이 름: 박권수
		 */
		Map<String, Object> paraAuth = new HashMap<String, Object>();
		paraAuth.put("admin_id", session.getAttribute("admin_id"));
		paraAuth.put("board_id", paramMap.get("board_id"));
		String auth = authorityService.authority(paraAuth);
		// ====================================================

		model.addAttribute("boardList", re.getContentList(paramMap));

		// 조회 하려는 페이지
		int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage") != null
				? Integer.parseInt(paramMap.get("startPage").toString())
				: 1);

		// 한페이지에 보여줄 리스트 수
		int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages") != null
				? Integer.parseInt(paramMap.get("visiblePages").toString())
				: 10);
		// 일단 전체 건수를 가져온다.
		int totalCnt = re.getContentCnt(paramMap);

		// 아래 1,2는 실제 개발에서는 class로 빼준다. (여기서는 이해를 위해 직접 적음)
		// 1.하단 페이지 네비게이션에서 보여줄 리스트 수를 구한다.
		BigDecimal decimal1 = new BigDecimal(totalCnt);
		BigDecimal decimal2 = new BigDecimal(visiblePages);
		BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);

		// int allCount = boardService.getallCount(paramMap);

		int startLimitPage = 0;
		// 2.mysql limit 범위를 구하기 위해 계산
		if (startPage == 1) {
			startLimitPage = 0;
		} else {
			startLimitPage = (startPage - 1) * visiblePages;
		}
		paramMap.put("start", startLimitPage);
		paramMap.put("end", visiblePages);
		// jsp 에서 보여줄 정보 추출
		model.addAttribute("startPage", startPage + "");// 현재 페이지
		model.addAttribute("totalCnt", totalCnt);// 전체 게시물수
		model.addAttribute("totalPage", totalPage);// 페이지 네비게이션에 보여줄 리스트 수
		model.addAttribute("boardList", re.getList(paramMap));
		/* 페이징 end */

		/*
		 * 날 짜: 2018-06-27 16:10 내 용: board_id 및 검색 조건 추가 이 름: 박권수
		 */
		model.addAttribute("board_id", paramMap.get("board_id"));
		model.addAttribute("sch_value", paramMap.get("sch_value"));
		model.addAttribute("sch_type", paramMap.get("sch_type"));
		model.addAttribute("auth", auth);

		return "recruit/recruit_list";
	}

	/* 미리보기 */
	@RequestMapping("/recruit_view.do")
	public String recruit_view(@RequestParam Map<String, Object> paramMap, int all_no, Model model,
			HttpSession session) {

		Map<String, Object> paraAuth = new HashMap<String, Object>();
		paraAuth.put("admin_id", session.getAttribute("admin_id"));
		paraAuth.put("board_id", paramMap.get("board_id"));

		String auth = authorityService.authority(paraAuth);

		System.out.println(all_no);
		Recruit recruit = re.read(all_no);
		model.addAttribute("auth", auth);
		model.addAttribute("re", recruit);

		return "recruit/recruit_view";
	}

	/* 선택 지우기 */
	@RequestMapping(value = "/delete_check.do", method = RequestMethod.GET)
	public String delete(@RequestParam int[] all_no) throws Exception {
		for (int j = 0; j < all_no.length; j++) {
			re.delete(all_no[j]);
		}
		return "redirect:/recruit_list.do";
	}

	@RequestMapping(value = "/delete_check1.do", method = RequestMethod.GET)
	public String delete1(@RequestParam int[] all_no) throws Exception {
		for (int j = 0; j < all_no.length; j++) {
			Recruit recruit = new Recruit();
			recruit.setAll_no(all_no[j]);
			recruit.setUSE_YN("N");
			re.user_del(recruit);
		}
		return "redirect:/recruit_list.do";
	}

	/* 수정페이지 */
	@RequestMapping("/recruit_write_update.do")
	public String recruit_write_update(@RequestParam Map<String, Object> paramMap,
			@RequestParam(value = "all_no") int all_no, Model model, String[] fileKey, String[] flag, String[] fName) {
		Recruit recruit = re.read(all_no); // select
		model.addAttribute("re", recruit);
		model.addAttribute("reList", rea.getRecruitContentList());
		model.addAttribute("plList", pl.select(paramMap));
		return "recruit/recruit_write_update";
	}

	/* 수정 */
	/*
	 * @RequestMapping(value = "/write_update_ac.do", method = RequestMethod.POST)
	 * public String write_update_ac(Recruit recruit) { re.update(recruit); return
	 * "redirect:/recruit_list.do"; }
	 */

	/*
	 * @RequestMapping(value = "/zdfawefs.do", method = RequestMethod.GET) public
	 * String zdfawefs(HttpServletRequest request, String filename) {
	 * 
	 * String root_path = request.getSession().getServletContext().getRealPath("/");
	 * String attach_path = "resources/recruit/";
	 * 
	 * File file = new File(root_path+attach_path+filename);
	 * System.out.println(filename); System.out.println("=========path============>"
	 * + root_path+attach_path + filename);
	 * 
	 * if( file.exists()){ if(file.delete()){ System.out.println("파일삭제 성공"); }else{
	 * System.out.println("파일삭제 실패"); } }else{ System.out.println("파일이 존재하지 않습니다.");
	 * }
	 * 
	 * return "redirect:/recruit_list.do"; }
	 */
	/* 수정 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/write_update_ac.do", method = RequestMethod.POST)
	public String write_update_ac(@RequestParam Map<String, Object> paramMap, @ModelAttribute Recruit recruit,
			Fileup fileup, HttpServletRequest request, Model model, String flag, String fName, HttpSession session) {
		System.out.println(flag);
		try {
			recruit.setUpdate_id((String)session.getAttribute("admin_id"));
			System.out.println("updeae 성공");
			re.update(recruit);
		} catch (Exception e) {
			System.out.println("update 실패");
		}
		Date today = new Date();
		SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyyMMdd");
		String mm = simpledateformat.format(today);
		/* 파일 */
		if ("D".equals(flag)) {
			List<MultipartFile> files = fileup.getUploadfile();
			System.out.println("File ----->" + files);
			// List<String> fileNames = new ArrayList<String>();
			String y = "";
			if (null != files && files.size() > 0) {

				for (MultipartFile multipartFile : files) {
					if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {

						System.out.println(
								"file = " + multipartFile.getOriginalFilename() + "/" + multipartFile.getSize());
						/* 상대경로 */
						String file_path = request.getSession().getServletContext().getRealPath("/");
						String attach_path = "resources/recruit/";
						String file_name = multipartFile.getOriginalFilename();
						String fileName2 = mm + UUID.randomUUID().toString() + file_name;
						File f = new File(file_path + attach_path + fileName2);
						try {
							multipartFile.transferTo(f);
							System.out.println("파일 저장 성공");
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
						// fileNames.add(file_name);
						y += file_name + ""; // 다중 업로드시 구분을 위해 [ / ] 추가해야함 2018.04.20

						/* 이력서 model에 파일명,주소 저장 */
						recruit.setFile(file_name);

						/* 파일명에서 확장자 추출 */
						String filename = recruit.getFile();
						int fileLen = filename.length();
						int lastDot = filename.lastIndexOf('.');
						String fileExt = filename.substring(lastDot, fileLen).toLowerCase();

						/* recruit model에 파일명 입력 */
						recruit.setFile2(fileName2);
						recruit.setFileExt(fileExt);

						System.out.println("확장명 : " + fileExt);
					}
				}

			}
			try {
				System.out.println("all_no=" + recruit.getAll_no());
				System.out.println("all_no1=" + recruit.getFile());
				System.out.println("all_no1=" + recruit.getFile2());
				recruit.setUpdate_id((String)session.getAttribute("admin_id"));
				re.update2(recruit);
				System.out.println("update2성공=" + recruit.getFile2());
			} catch (Exception e) {
				System.out.println("update2실패");
			}

			// flag가 D인건 삭제. 데이터도 삭제, 파일도 삭제.
			String file_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "resources/recruit/";
			File file = new File(file_path + attach_path + fName);
			System.out.println("=========path============>" + file_path + attach_path + fName + recruit.getFileExt());

			if (file.exists()) {
				if (file.delete()) {
					System.out.println("파일삭제 성공");
				} else {
					System.out.println("파일삭제 실패");
				}
			} else {
				System.out.println("파일이 존재하지 않습니다.");
			}

		}
		return "redirect:/recruit_list.do?board_id=7";
	}

	/* 모집공고 작성창 */
	@RequestMapping("/recruit_write.do")
	public String recruit_write(@RequestParam Map<String, Object> paramMap, Model model) {
		model.addAttribute("reList", rea.getRecruitContentList());
		model.addAttribute("plList", pl.select(paramMap));
		return "recruit/recruit_write";
	}

	@RequestMapping(value = "/recruit_enrollment.do", method = RequestMethod.GET)
	public ModelAndView recruit_write() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("recruit_write");
		return mv;
	}

	/* 모집공고 DB추가(insert)+파일추가 */
	@RequestMapping(value = "/recruit_enrollment.do", method = RequestMethod.POST)
	public String recruit_enrollment(Recruit recruit, Fileup fileup, HttpServletRequest request, Model model, HttpSession session, Map<String, Object> paramMap) {
		Map<String, Object> paraAuth = new HashMap<String, Object>();
		paraAuth.put("admin_id", session.getAttribute("admin_id"));
		paraAuth.put("board_id", 7);
		
		String view_name = authorityService.auView_name(paraAuth);
		System.out.println(view_name);
		if ("1".equals(view_name)) {
			recruit.setView_name((String)session.getAttribute("admin_name"));
		}else if ("2".equals(view_name)) {
			recruit.setView_name((String)session.getAttribute("admin_department"));
		}else if ("3".equals(view_name)) {
			recruit.setView_name((String)session.getAttribute("admin_nickname"));
		}
		recruit.setAdmin_id((String)session.getAttribute("admin_id"));
		recruit.setAdmin_name((String)session.getAttribute("admin_name"));
		recruit.setUpdate_date(null);
		recruit.setUpdate_id(null);
		
		Date today = new Date();
		SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyyMMdd");
		String mm = simpledateformat.format(today);

		/* 파일 */
		List<MultipartFile> files = fileup.getUploadfile();
		List<String> fileNames = new ArrayList<String>();
		if (null != files && files.size() > 0) {
			for (MultipartFile multipartFile : files) {
				/* 상대경로 */
				String root_path = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "resources/recruit/";
				System.out.println(root_path + attach_path);
				String fileName = multipartFile.getOriginalFilename();
				String fileName2 = mm + UUID.randomUUID().toString() + fileName;
				File f = new File(root_path + attach_path + fileName2);
				try {
					multipartFile.transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				fileNames.add(fileName2);

				/* recruit model에 파일명 입력 */
				recruit.setFile(fileName);

				/* 파일명에서 확장자 추출 */
				String filename = recruit.getFile();
				int fileLen = filename.length();
				int lastDot = filename.lastIndexOf('.');
				String fileExt = filename.substring(lastDot, fileLen).toLowerCase();

				/* recruit model에 파일명 입력 */
				recruit.setFile2(fileName2);
				recruit.setFileExt(fileExt);

			}
		}
		try {
			re.insert(recruit);
		} catch (Exception e) {
			model.addAttribute("msg", "다시입력하세요");
		}
		return "redirect:/recruit_list.do?board_id=7";
	}

	/* 다운 */
	@RequestMapping("/filedown.do")
	private void fileDown(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		Recruit r = new Recruit();
		r = re.filename_select(filename);
		String u = r.getFile();
		// 파일 업로드된 경로
		try {
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "resources/recruit/";
			String savePath = root_path + attach_path;
			String fileName = filename;

			// 실제 내보낼 파일명
			String oriFileName = u;
			System.out.println(oriFileName);
			System.out.println("fileName" + fileName);
			InputStream in = null;
			OutputStream os = null;
			File file = null;
			boolean skip = false;
			String client = "";

			System.out.println("파일경로 : " + savePath + fileName);

			// 파일을 읽어 스트림에 담기
			try {
				file = new File(savePath, fileName);
				in = new FileInputStream(file);
			} catch (FileNotFoundException fe) {
				skip = true;
			}

			client = request.getHeader("User-Agent");

			// 파일 다운로드 헤더 지정
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

	/* 입사지원서 다운 */
	@RequestMapping("/filedown2.do")
	private void fileDown2(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		System.out.println(filename);
		// 파일 업로드된 경로
		try {
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "resources/recruit/";
			String savePath = root_path + attach_path;
			String fileName = filename;
			System.out.println(root_path + attach_path);

			// 실제 내보낼 파일명
			String oriFileName = "입사지원서.hwp";
			System.out.println(oriFileName);
			System.out.println("fileName" + fileName);
			InputStream in = null;
			OutputStream os = null;
			File file = null;
			boolean skip = false;
			String client = "";

			// 파일을 읽어 스트림에 담기
			try {
				file = new File(savePath, fileName);
				in = new FileInputStream(file);
			} catch (FileNotFoundException fe) {
				skip = true;
			}

			client = request.getHeader("User-Agent");

			// 파일 다운로드 헤더 지정
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

	/* 모집분야 정보 받기 */
	@ResponseBody
	@RequestMapping(value = "/recruit.do", method = RequestMethod.POST)
	public List<Recruit_add> recruit_write(@RequestParam(value = "re_en") String re_en, Model model) {
		List<Recruit_add> params = rea.getContentList(re_en);
		model.addAttribute("reList", params);
		return params;
	}

	/* 모집분야 팝업창 */
	@RequestMapping("/re_enrollment_view.do")
	public String re_enrollment_view(Model model, @RequestParam Map<String, Object> paramMap) {
		/* 페이징 */
		Map<String, Object> paraAuth = new HashMap<String, Object>();

		String auth = authorityService.authority(paraAuth);

		System.out.println("startpage=" + paramMap.get("startPage"));
		// 조회 하려는 페이지
		int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage") != null
				? Integer.parseInt(paramMap.get("startPage").toString())
				: 1);
		System.out.println("cms1=" + startPage);
		// 한페이지에 보여줄 리스트 수
		int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages") != null
				? Integer.parseInt(paramMap.get("visiblePages").toString())
				: 5);
		// 일단 전체 건수를 가져온다.
		int totalCnt = rea.selectContentCnt(paramMap);

		// 아래 1,2는 실제 개발에서는 class로 빼준다. (여기서는 이해를 위해 직접 적음)
		// 1.하단 페이지 네비게이션에서 보여줄 리스트 수를 구한다.
		BigDecimal decimal1 = new BigDecimal(totalCnt);
		BigDecimal decimal2 = new BigDecimal(visiblePages);
		BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);

		int startLimitPage = 0;
		// 2.mysql limit 범위를 구하기 위해 계산
		if (startPage == 1) {
			startLimitPage = 0;
		} else {
			startLimitPage = (startPage - 1) * visiblePages;
		}
		paramMap.put("start", startLimitPage);
		paramMap.put("end", visiblePages);
		// jsp 에서 보여줄 정보 추출
		model.addAttribute("startPage", startPage + "");// 현재 페이지
		System.out.println("cms=" + startPage);
		model.addAttribute("totalCnt", totalCnt);// 전체 게시물수
		model.addAttribute("totalPage", totalPage);// 페이지 네비게이션에 보여줄 리스트 수
		model.addAttribute("reList", rea.getList(paramMap));
		/* 페이징 end */
		return "recruit/re_enrollment_view";
	}

	/* 모집분야 추가 */
	@RequestMapping("/re_en_add.do")
	public String re_en_add() {
		return "recruit/re_en_add";
	}

	/* 모집분야 DB추가(insert) */
	@RequestMapping(value = "/re_en_add_bt.do", method = RequestMethod.POST)
	public String re_en_add_bt(Recruit_add recruit_add, Model model) {
		try {
			rea.insert(recruit_add);
		} catch (Exception e) {
			model.addAttribute("msg", "다시입력하세요");
		}
		return "redirect:/re_enrollment_view.do";
	}

	/* 모집분야 미리보기 */
	@RequestMapping("/re_en_add_update/{re_en_no}.do")
	public String re_en_add_update(@PathVariable("re_en_no") int re_en_no, Model model, Recruit_add recruit_add)
			throws Exception {
		recruit_add = rea.select(re_en_no);
		model.addAttribute("add", recruit_add);
		return "recruit/re_en_add_update";
	}

	@RequestMapping(value = "/enrollment_del.do", method = RequestMethod.GET)
	public String enrollment_del(@RequestParam int[] re_en_no) throws Exception {
		for (int j = 0; j < re_en_no.length; j++) {
			rea.delete_add(re_en_no[j]);
		}
		return "redirect:/re_enrollment_view.do";
	}

	@RequestMapping(value = "/re_en_update.do", method = RequestMethod.GET)
	public String re_en_update(@RequestParam int re_en_no, Model model) {
		Recruit_add recruit_add = rea.select(re_en_no);
		model.addAttribute("add", recruit_add);
		return "recruit/re_en_add_update";
	}

	/* 수정 */
	@RequestMapping(value = "/add_update_re.do", method = RequestMethod.POST)
	public String add_update_re(Recruit_add recruit_add) {
		System.out.println(recruit_add.getFavorable());
		rea.update_add(recruit_add);
		return "redirect:/re_enrollment_view.do";
	}

	@RequestMapping("/place_add.do")
	public String place_add(@RequestParam Map<String, Object> paramMap, Model model) {
		/* 페이징 */
		Map<String, Object> paraAuth = new HashMap<String, Object>();

		String auth = authorityService.authority(paraAuth);
		// 조회 하려는 페이지
		int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage") != null
				? Integer.parseInt(paramMap.get("startPage").toString())
				: 1);

		// 한페이지에 보여줄 리스트 수
		int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages") != null
				? Integer.parseInt(paramMap.get("visiblePages").toString())
				: 5);
		// 일단 전체 건수를 가져온다.
		int totalCnt = pl.selectContentCnt(paramMap);

		// 아래 1,2는 실제 개발에서는 class로 빼준다. (여기서는 이해를 위해 직접 적음)
		// 1.하단 페이지 네비게이션에서 보여줄 리스트 수를 구한다.
		BigDecimal decimal1 = new BigDecimal(totalCnt);
		BigDecimal decimal2 = new BigDecimal(visiblePages);
		BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);

		int startLimitPage = 0;
		// 2.mysql limit 범위를 구하기 위해 계산
		if (startPage == 1) {
			startLimitPage = 0;
		} else {
			startLimitPage = (startPage - 1) * visiblePages;
		}
		paramMap.put("start", startLimitPage);
		paramMap.put("end", visiblePages);
		// jsp 에서 보여줄 정보 추출
		model.addAttribute("startPage", startPage + "");// 현재 페이지
		model.addAttribute("totalCnt", totalCnt);// 전체 게시물수
		model.addAttribute("totalPage", totalPage);// 페이지 네비게이션에 보여줄 리스트 수
		model.addAttribute("plList", pl.getList(paramMap));
		/* 페이징 end */
		return "recruit/place_add";
	}

	@RequestMapping(value = "/place_add_action.do", method = RequestMethod.POST)
	public String place_add_action(Placem placem) {
		pl.insert(placem);
		return "redirect:/place_add.do";
	}

	@RequestMapping(value = "/place_del_action.do", method = RequestMethod.GET)
	public String place_del_action(@RequestParam int[] no) throws Exception {
		for (int i = 0; i < no.length; i++) {
			pl.delete(no[i]);
		}
		return "redirect:/place_add.do";
	}

	/* 이력서 */
	@RequestMapping("/resume_view.do")
	public String resume_view(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {

		/*
		 * 날 짜: 2018-06-14 16:10 내 용: 권한추가 이 름: 박권수
		 */
		Map<String, Object> paraAuth = new HashMap<String, Object>();
		paraAuth.put("admin_id", session.getAttribute("admin_id"));
		paraAuth.put("board_id", paramMap.get("board_id"));
		String auth = authorityService.authority(paraAuth);
		model.addAttribute("auth", auth);
		// ====================================================
		model.addAttribute("boardList", re.getContentList(paramMap));

		return "recruit/resume/resume_view";
	}

	@RequestMapping(value = "/resume_list_del.do", method = RequestMethod.GET)
	public String resume_list_del(@RequestParam int[] resume_no, Map<String, Object> paramMap, HttpSession session,
			Model model, HttpServletRequest request) throws Exception {

		/*
		 * 날 짜: 2018-06-14 16:10 내 용: 권한추가 이 름: 박권수
		 */
		Map<String, Object> paraAuth = new HashMap<String, Object>();
		paraAuth.put("admin_id", session.getAttribute("admin_id"));
		paraAuth.put("board_id", paramMap.get("board_id"));
		String auth = authorityService.authority(paraAuth);
		model.addAttribute("auth", auth);
		// ====================================================

		for (int j = 0; j < resume_no.length; j++) {
			/* 이력서 변형 파일명+확장자 받기 */
			Resume resume = rs.delete_select(resume_no[j]);
			String fName1 = resume.getResume_file2();
			/* 이력서 삭제 */
			String file_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "resources/recruit/resume/";
			File file = new File(file_path + attach_path + fName1);
			if (file.exists()) {
				if (file.delete()) {
					System.out.println("파일삭제 성공");
				} else {
					System.out.println("파일삭제 실패");
				}
			} else {
				System.out.println("파일이 존재하지 않습니다.");
			}
			rs.delete(resume_no[j]);
			py.delete(resume.getPrivacy_no());
		}
		return "redirect:/resume_view.do?board_id=7";
	}

	@RequestMapping(value = "/resume_list_del1.do", method = RequestMethod.GET)
	public String resume_list_del1(@RequestParam int[] resume_no, String del_move, int all_no1) {
		/* del_move A=삭제, B=이동 */
		if ("A".equals(del_move)) {
			for (int j = 0; j < resume_no.length; j++) {
				rs.delete_update(resume_no[j]);
			}
		} else if ("B".equals(del_move)) {
			Recruit recruit = re.read(all_no1);
			for (int i = 0; i < resume_no.length; i++) {
				Resume resume = rs.resume_no_select(resume_no[i]);
				resume.setAll_no(all_no1);
				resume.setTitle(recruit.getTitle());
				rs.move_update(resume);
			}
		}
		return "redirect:/resume_view.do?board_id=7";
	}

	/* 이력서 이동 팝업 창 */
	@RequestMapping("/resume_move_win.do")
	public String resume_move_win(@RequestParam Map<String, Object> paramMap, Model model) {
		model.addAttribute("boardList", re.chec_select(paramMap));
		return "recruit/resume/resume_move_win";
	}

	/* 이력서 검색 */
	@RequestMapping(value = "/resume_list_re.do", method = RequestMethod.POST)
	public String resume_list_re(int all_no, @RequestParam Map<String, Object> paramMap, Model model,
			HttpSession session) {
		/* 페이징 */
		/*
		 * 날 짜: 2018-06-14 16:10 내 용: 권한추가 이 름: 박권수
		 */
		Map<String, Object> paraAuth = new HashMap<String, Object>();
		paraAuth.put("admin_id", session.getAttribute("admin_id"));
		paraAuth.put("board_id", paramMap.get("board_id"));
		String auth = authorityService.authority(paraAuth);
		model.addAttribute("auth", auth);
		// ====================================================

		model.addAttribute("boardList", re.getContentList(paramMap));

		List<Resume> list = rs.all_no_select(all_no);
		model.addAttribute("resume_list", list);
		model.addAttribute("boardList", re.getContentList(paramMap));
		model.addAttribute("resumeCount", rs.resumeCount(all_no));
		return "recruit/resume/resume_view";
	}

	/* 채용정보동의자관리 */
	@RequestMapping("/privacy_agreement_view.do")
	public String privacy_agreement_view(@RequestParam Map<String, Object> paramMap, Model model) {
		/* model.addAttribute("prilist", py.select(paramMap)); */
		return "recruit/agreement/privacy_agreement_view";
	}

	@RequestMapping(value = "/privacy_del_at.do", method = RequestMethod.GET)
	public String privacy_del_at(@RequestParam int[] privacy_no) throws Exception {
		for (int j = 0; j < privacy_no.length; j++) {
			try {
				int no = rs.select_privacy_no(privacy_no[j]);
				rs.delete(no); // PKFK삭제
			} catch (Exception e) {
			}
			py.delete(privacy_no[j]);
		}
		return "redirect:/privacy_agreement_view.do";
	}

	@RequestMapping("/sms_view.do")
	public String sms_view(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
		/*
		 * 날 짜: 2018-06-14 16:10 내 용: 권한추가 이 름: 박권수
		 */
		Map<String, Object> paraAuth = new HashMap<String, Object>();
		paraAuth.put("admin_id", session.getAttribute("admin_id"));
		paraAuth.put("board_id", paramMap.get("board_id"));
		String auth = authorityService.authority(paraAuth);
		model.addAttribute("auth", auth);
		// ====================================================
		model.addAttribute("boardList", re.getContentList(paramMap));
		return "recruit/sms/sms_view";
	}

	/*
	 * @RequestMapping(value = "/sms_list.do", method = RequestMethod.POST) public
	 * String sms_list(int all_no, @RequestParam Map<String, Object> paramMap, Model
	 * model) { model.addAttribute("boardList", re.getContentList(paramMap)); return
	 * "recruit/sms/sms_view"; }
	 */

	@ResponseBody
	@RequestMapping(value = "/sms_list.do", method = RequestMethod.POST)
	public List<Object> sms_list(@RequestParam(value = "all_no") int all_no, Model model) {
		List<Object> params = py.sms_list(all_no);
		return params;
	}

	@RequestMapping("/checkplus_main.do")
	public String checkplus_main() {
		return "nice/checkplus_main";
	}

	@RequestMapping("/checkplus_fail.do")
	public String checkplus_fail() {
		return "nice/checkplus_fail";
	}

	@RequestMapping("/checkplus_success.do")
	public String checkplus_success() {
		return "nice/checkplus_success";
	}

	@RequestMapping("/NewFile.do")
	public String NewFile() {
		return "NewFile";
	}

	/* 컨벤션 */
	@RequestMapping("/convention_list.do")
	public String convention_list(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {

		/*
		 * 날 짜: 2018-06-14 16:10 내 용: 권한추가 이 름: 박권수
		 */
		Map<String, Object> paraAuth = new HashMap<String, Object>();
		paraAuth.put("admin_id", session.getAttribute("admin_id"));
		paraAuth.put("board_id", paramMap.get("board_id"));
		String auth = authorityService.authority(paraAuth);
		// ====================================================

		/* 페이징 */
		model.addAttribute("boardList", re.getContentList(paramMap));
		// 조회 하려는 페이지
		int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage") != null
				? Integer.parseInt(paramMap.get("startPage").toString())
				: 1);

		// 한페이지에 보여줄 리스트 수
		int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages") != null
				? Integer.parseInt(paramMap.get("visiblePages").toString())
				: 10);
		// 일단 전체 건수를 가져온다.
		int totalCnt = cvs.selectContentCnt(paramMap);

		// 아래 1,2는 실제 개발에서는 class로 빼준다. (여기서는 이해를 위해 직접 적음)
		// 1.하단 페이지 네비게이션에서 보여줄 리스트 수를 구한다.
		BigDecimal decimal1 = new BigDecimal(totalCnt);
		BigDecimal decimal2 = new BigDecimal(visiblePages);
		BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);

		// int allCount = boardService.getallCount(paramMap);

		int startLimitPage = 0;
		// 2.mysql limit 범위를 구하기 위해 계산
		if (startPage == 1) {
			startLimitPage = 0;
		} else {
			startLimitPage = (startPage - 1) * visiblePages;
		}

		paramMap.put("start", startLimitPage);
		paramMap.put("end", visiblePages);
		// jsp 에서 보여줄 정보 추출
		model.addAttribute("startPage", startPage + "");// 현재 페이지
		model.addAttribute("totalCnt", totalCnt);// 전체 게시물수
		model.addAttribute("totalPage", totalPage);// 페이지 네비게이션에 보여줄 리스트 수
		model.addAttribute("con_list", cvs.getList(paramMap));

		/*
		 * 날 짜: 2018-06-27 16:10 내 용: board_id 및 검색 조건 추가 이 름: 박권수
		 */

		model.addAttribute("board_id", paramMap.get("board_id"));
		model.addAttribute("sch_value", paramMap.get("sch_value"));
		model.addAttribute("sch_type", paramMap.get("sch_type"));

		/*
		 * 날 짜: 2018-06-14 16:10 내 용: 권한추가 이 름: 박권수
		 */
		model.addAttribute("auth", auth);

		// ==================================

		/* 페이징 end */
		return "convention/convention_list";
	}

	@RequestMapping("/convention_add.do")
	public String convention_add() {
		return "convention/convention_add";
	}

	/* 컨벤션 일정등록 */
	@RequestMapping("/convention_event_add_form.do")
	public String convention_event_add_form(Convention convention, HttpSession session, Map<String, Object> paramMap) {
		Map<String, Object> paraAuth = new HashMap<String, Object>();
		paraAuth.put("admin_id", session.getAttribute("admin_id"));
		paraAuth.put("board_id", paramMap.get("board_id"));
		
		convention.setAdmin_id((String)session.getAttribute("admin_id"));
		convention.setAdmin_name((String)session.getAttribute("admin_name"));
		cvs.insert(convention);
		return "redirect:/convention_list.do?board_id=8";
	}

	/* 컨벤션 미리보기 */
	@RequestMapping("/convention_view.do")
	public String convention_view(@RequestParam Map<String, Object> paramMap, int con_no, Model model,
			HttpSession session) {

		/*
		 * 날 짜: 2018-06-14 16:10 내 용: 권한추가 이 름: 박권수
		 */
		Map<String, Object> paraAuth = new HashMap<String, Object>();
		paraAuth.put("admin_id", session.getAttribute("admin_id"));
		paraAuth.put("board_id", paramMap.get("board_id"));
		String auth = authorityService.authority(paraAuth);
		model.addAttribute("auth", auth);
		// 권수 end

		model.addAttribute("con_view", cvs.conno_select(con_no));
		return "convention/convention_view";
	}

	/* 컨벤션 list 삭제 */
	@RequestMapping(value = "/convention_list_del.do", method = RequestMethod.GET)
	public String convention_list_del(@RequestParam(value = "con_no") int[] con_no) {
		for (int j = 0; j < con_no.length; j++) {
			cvs.conno_delete(con_no[j]);
		}
		return "redirect:/convention_list.do?board_id=8";
	}

	@RequestMapping(value = "/convention_list_del1.do", method = RequestMethod.GET)
	public String convention_list_del1(@RequestParam(value = "con_no") int[] con_no) {
		for (int j = 0; j < con_no.length; j++) {
			Convention convention = new Convention();
			convention.setCon_no(con_no[j]);
			convention.setUSE_YN("N");
			cvs.user_del(convention);
		}
		return "redirect:/convention_list.do?board_id=8";
	}

	/* 컨벤션 수정화면 */
	@RequestMapping("/convention_re_add.do")
	public String convention_re_add(int con_no, Model model) {
		model.addAttribute("view", cvs.conno_select(con_no));
		return "convention/convention_re_add";
	}

	/* 컨벤션 수정 */
	@RequestMapping(value = "/convention_update.do", method = RequestMethod.POST)
	public String convention_update(Convention con, HttpSession session) {
		con.setUpdate_id((String)session.getAttribute("admin_id"));
		cvs.update(con);
		return "redirect:/convention_list.do?board_id=8";
	}

	/* sms 문자전송 */
	@RequestMapping(value = "/send.do", method = RequestMethod.POST)
	public String send(SMSSend smssend, String[] phone1, String[] phone2, String[] phone3, String[] name) {
		smssend.setSphone1("051");
		smssend.setSphone2("400");
		smssend.setSphone3("3104");
		smssend.setMember(0);
		smssend.setInDate("");
		smssend.setInTime("");
		/* sms 번호 공백 발신방지 */
		for (int j = 0; j < phone1.length; j++) {
			String q = "";
			if (phone1[j] != q) {
				smssend.setRphone1(phone1[j]);
				smssend.setRphone2(phone2[j]);
				smssend.setRphone3(phone3[j]);
				smssend.setRecvName(name[j]);
				System.out.println(smssend.toString());
				try {
					py.smsinsert(smssend);
				} catch (Exception e) {
					System.out.println("문자저장실패");
				}
			}
		}
		return "redirect:/sms_view.do?board_id=7";
	}

	/* 배너 */
	@RequestMapping("/banner_c.do")
	public String banner_c(@RequestParam Map<String, Object> paramMap, HttpSession session, Model model) {
		
		Map<String, Object> paraAuth = new HashMap<String, Object>();
        paraAuth.put("admin_id", session.getAttribute("admin_id"));
        paraAuth.put("board_id", paramMap.get("board_id"));
        //String.valueOf(paraAuth.get("board_id"));

        String auth = authorityService.authority(paraAuth);
        model.addAttribute("board_id", paramMap.get("board_id"));
        model.addAttribute("auth", auth);
        
        //채용권한만 체크해도 sms활성화
        Map<String, Object> paraAuth2 = new HashMap<String, Object>();
		paraAuth2.put("admin_id", session.getAttribute("admin_id"));
		paraAuth2.put("board_id", paramMap.get("board_id2"));
		String auth2 = authorityService.authority(paraAuth2);
		model.addAttribute("auth2", auth2);
		System.out.println("paraAuth2 ================= ?" + paraAuth2);
		
		return "etc/banner_c";
	}

	@RequestMapping("/banner_c1.do")
	public String banner_c1(@RequestParam Map<String, Object> paramMap, int banner_no, Model model, HttpSession session) {
		
		Map<String, Object> paraAuth = new HashMap<String, Object>();
        paraAuth.put("admin_id", session.getAttribute("admin_id"));
        paraAuth.put("board_id", paramMap.get("board_id"));
        //String.valueOf(paraAuth.get("board_id"));

        String auth = authorityService.authority(paraAuth);
        model.addAttribute("board_id", paramMap.get("board_id"));
        model.addAttribute("auth", auth);
        
        //채용권한만 체크해도 sms활성화
        Map<String, Object> paraAuth2 = new HashMap<String, Object>();
		paraAuth2.put("admin_id", session.getAttribute("admin_id"));
		paraAuth2.put("board_id", paramMap.get("board_id2"));
		String auth2 = authorityService.authority(paraAuth2);
		model.addAttribute("auth2", auth2);
		System.out.println("paraAuth2 ================= ?" + paraAuth2);
		
		model.addAttribute("banner_no", banner_no);
		model.addAttribute("view", bs.no_select(banner_no));
		return "etc/banner_c1";
	}

	/* 배너추가 */
	@RequestMapping(value = "/banner_add.do", method = RequestMethod.POST)
	public String banner_add(Fileup fileup, HttpServletRequest request, Model model, Banner banner,
			Map<String, Object> paramMap) {
		/* 파일 */
		Date today = new Date();
		SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyyMMdd");
		String mm = simpledateformat.format(today);
		List<MultipartFile> files = fileup.getUploadfile();
		List<String> fileNames = new ArrayList<String>();
		System.out.println(banner.toString());
		if (null != files && files.size() > 0) {
			for (MultipartFile multipartFile : files) {
				/* 상대경로 */
				String root_path = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "resources/banner/";
				System.out.println(root_path + attach_path);
				String fileName = multipartFile.getOriginalFilename();
				String fileName2 = mm + UUID.randomUUID().toString() + fileName;
				File f = new File(root_path + attach_path + fileName2);
				try {
					multipartFile.transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				fileNames.add(fileName);

				/* banner model에 파일명 입력 */
				banner.setBanner_filename(fileName2);
				banner.setBanner_path(attach_path);
			}
		}

		/* 파일명에서 확장자 추출 */
		String filename = banner.getBanner_filename();
		int fileLen = filename.length();
		int lastDot = filename.lastIndexOf('.');
		String fileExt = filename.substring(lastDot, fileLen).toLowerCase();

		banner.setBanner_extentionname(fileExt);
		banner.setUSE_YN("Y");
		System.out.println(banner.toString());

		try {
			bs.insert(banner);
		} catch (Exception e) {
			System.out.println("insert실패");
		}
		return "redirect:/banner_view.do";
	}

	/* 배너 업데이트 */
	@RequestMapping(value = "/banner_add1.do", method = RequestMethod.POST)
	public String banner_add1(Fileup fileup, HttpServletRequest request, Model model, Banner banner, String fName,
			String flag) {
		Date today = new Date();
		SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyyMMdd");
		String mm = simpledateformat.format(today);

		if ("D".equals(flag)) {
			/* 파일 */
			List<MultipartFile> files = fileup.getUploadfile();
			List<String> fileNames = new ArrayList<String>();
			if (null != files && files.size() > 0) {
				for (MultipartFile multipartFile : files) {
					/* 상대경로 */
					String root_path = request.getSession().getServletContext().getRealPath("/");
					String attach_path = "resources/banner/";
					System.out.println(root_path + attach_path);
					String fileName = multipartFile.getOriginalFilename();
					String fileName2 = mm + UUID.randomUUID().toString() + fileName;
					File f = new File(root_path + attach_path + fileName2);
					try {
						multipartFile.transferTo(f);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					fileNames.add(fileName);

					/* banner model에 파일명 입력 */
					banner.setBanner_filename(fileName2);
					banner.setBanner_path(attach_path);
				}
			}

			/* 파일명에서 확장자 추출 */
			String filename = banner.getBanner_filename();
			int fileLen = filename.length();
			int lastDot = filename.lastIndexOf('.');
			String fileExt = filename.substring(lastDot, fileLen).toLowerCase();

			banner.setBanner_extentionname(fileExt);

			/* 배너삭제 */
			String file_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "resources/banner/";
			File file = new File(file_path + attach_path + fName);
			if (file.exists()) {
				if (file.delete()) {
					System.out.println("파일삭제 성공");
				} else {
					System.out.println("파일삭제 실패");
				}
			} else {
				System.out.println("파일이 존재하지 않습니다.");
			}
		} else {
			banner.setBanner_filename(fName);
			banner.setBanner_path("resources/banner/");
		}
		banner.setUSE_YN("Y");
		bs.update(banner);

		return "redirect:/banner_view.do";
	}

	@RequestMapping("/banner_delete.do")
	public String banner_delete(int banner_no, HttpServletRequest request, String fName) {
		Banner b = bs.no_select(banner_no);
		fName = b.getBanner_filename();
		String file_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/banner/";
		File file = new File(file_path + attach_path + fName);
		if (file.exists()) {
			if (file.delete()) {
				System.out.println("파일삭제 성공");
			} else {
				System.out.println("파일삭제 실패");
			}
		} else {
			System.out.println("파일이 존재하지 않습니다.");
		}
		bs.delete(banner_no);
		return "redirect:/banner_view.do";
	}

	/* 이력서다운 */
	@RequestMapping("/resumefiledown.do")
	private void resumefiledown(String filename, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		System.out.println(filename);
		String u = rs.file_select(filename);
		// 파일 업로드된 경로
		try {
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "resources/recruit/resume/";
			String savePath = root_path + attach_path;
			String fileName = filename;
			System.out.println(root_path + attach_path);

			// 실제 내보낼 파일명
			String oriFileName = u;
			System.out.println(oriFileName);
			System.out.println("fileName" + fileName);
			InputStream in = null;
			OutputStream os = null;
			File file = null;
			boolean skip = false;
			String client = "";

			// 파일을 읽어 스트림에 담기
			try {
				file = new File(savePath, fileName);
				in = new FileInputStream(file);
			} catch (FileNotFoundException fe) {
				skip = true;
			}

			client = request.getHeader("User-Agent");

			// 파일 다운로드 헤더 지정
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

	/* test */
	@RequestMapping("/recruit_list1.do")
	public String recruit_list1() {
		return "recruit/recruit1/recruit_list1";
	}

	@RequestMapping("/sms_view1.do")
	public String sms_view1(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
		/*권수 2018-07-26 권한 추가*/
		Map<String, Object> paraAuth = new HashMap<String, Object>();
		paraAuth.put("admin_id", session.getAttribute("admin_id"));
		paraAuth.put("board_id", paramMap.get("board_id"));
		String auth = authorityService.authority(paraAuth);
		model.addAttribute("auth", auth);
		System.out.println("paraAuth ================= ?" + paraAuth);
		System.out.println(auth);
		// ====================================================
		
		Map<String, Object> paraAuth2 = new HashMap<String, Object>();
		paraAuth2.put("admin_id", session.getAttribute("admin_id"));
		paraAuth2.put("board_id", paramMap.get("board_id2"));
		String auth2 = authorityService.authority(paraAuth2);
		model.addAttribute("auth2", auth2);
		System.out.println("paraAuth2 ================= ?" + paraAuth2);
		System.out.println(auth2);
		// ====================================================
		model.addAttribute("boardList", re.getContentList(paramMap));

		return "recruit/sms1/sms_view1";
	}
	
	/*sms api 전송*/
	@RequestMapping(value = "/send_api.do", method = RequestMethod.POST)
	public String send_api(Map<String, Object> paramMap, Surem_admin surem_admin, SMS_td sms_td, String[] user_name1,
			String[] tell1, HttpSession session, Fileup fileup, HttpServletRequest request) {
		Map<String, Object> paraAuth = new HashMap<String, Object>();
		paraAuth.put("admin_id", session.getAttribute("admin_id"));
		paraAuth.put("board_id", paramMap.get("board_id"));
		String auth = authorityService.authority(paraAuth);
		// ====================================================

		surem_admin = sms.surem_admin_select(paramMap);
		String usercode = surem_admin.getUsercode();
		String deptcode = surem_admin.getDeptcode();
		String from = surem_admin.getTell();
		String reserved_time = surem_admin.getReserved_time();
		String text = sms_td.getMessages();
		String division = sms_td.getDivision();
		String result ="";
		int message_id = sms.sms_select_no(paramMap);
		message_id += 1;
		
		
		String stringData1 = "{'usercode':'" + usercode + "',\n" + "'deptcode':'" + deptcode + "',\n"
				+ "'messages':[{'message_id' : '"+message_id+"','to':'" + tell1[0] + "'}";
		if(user_name1.length > 1) {
		for (int i = 1; i < user_name1.length; i++) {
			String q = "";
			if (user_name1[i] != q) {
				message_id += 1;
				stringData1 += ",{'message_id' : '"+message_id+"','to':'" + tell1[i] + "'}";
			}
		}
		}
		stringData1 += "],\n" + "'text':'" + text + "',\n" + "'from':'" + from + "',\n" + "'reserved_time':'"
				+ reserved_time + "'}";
		
		System.out.println(division+"------------"+stringData1);


		/* sms 문자전송 */
		String url = "";
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/sms/";
		List<String> fileNames = new ArrayList<String>();

		if ("S".equals(division)) {
			url = "https://api.surem.com/sms/v1/json";
			System.out.println("sms url-----*");
		} else if ("L".equals(division)) {
			url = "https://api.surem.com/lms/v1/json";
			System.out.println("lms url-----*");
		} else if ("M".equals(division)) {
			url = "https://api.surem.com/mms/v1";
			System.out.println("mms url-----*");
		}
		

		  try {
		        CloseableHttpClient httpclient = HttpClients.createDefault();
		        HttpPost httpPost = new HttpPost(url);
		        //전달하고자 하는 PARAMETER를 List객체에 담는다
		        
		        if("S".equals(division)) {
		        	@SuppressWarnings("deprecation")
					StringEntity params =new StringEntity(stringData1,HTTP.UTF_8);
		        	httpPost.setHeader("Content-type", "application/json");
		        	httpPost.setEntity(params);
		        }else if ("L".equals(division)) {
		        	@SuppressWarnings("deprecation")
					StringEntity params =new StringEntity(stringData1,HTTP.UTF_8);
		        	httpPost.setHeader("Content-type", "application/json");
		        	httpPost.setEntity(params);
		        }else if ("M".equals(division)) {
		        	
		        	 /*파일저장 */
		        	List<MultipartFile> files = fileup.getUploadfile();
		        	
		    		if (null != files && files.size() > 0) {
		    			for (MultipartFile multipartFile : files) {
		    				if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
		    				/* 상대경로 */
		    				String fileName = multipartFile.getOriginalFilename();
		    				
		    				File f = new File(root_path + attach_path + fileName);
		    				try {
		    					multipartFile.transferTo(f);
		    				} catch (IllegalStateException e) {
		    					e.printStackTrace();
		    				} catch (IOException e) {
		    					e.printStackTrace();
		    				}
		    				fileNames.add(fileName);
		    				}
		    			}
		    		}
		    		/* 파일저장 end */
		    		
		        	httpPost.setHeader("Connection", "Keep-Alive");
		        	httpPost.setHeader("Accept-Charset", "UTF-8");
		        	MultipartEntity reqEntity = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE,     
		                    null, Charset.forName("UTF-8"));
		        	
		        	for(int k=0; k<fileNames.size(); k++) {
		        	File f1 = new File(root_path + attach_path + fileNames.get(k).toString());
		        	/*File f1 = new File("C:\\Users\\interlink\\Desktop\\KakaoTalk_20180724_104457508.jpg");*/
		        	FileBody bin = new FileBody(f1);
		        	int v = k+1;
		        	reqEntity.addPart("image"+v+"", bin);
		        	}
					reqEntity.addPart("reqJSON", new StringBody(stringData1, Charset.forName("utf-8")));
					
					httpPost.setEntity(reqEntity);
					
		        }
		        //UTF-8은 한글
		      /*  httpPost.setEntity(new UrlEncodedFormEntity(reqEntity,"UTF-8"));*/
		        
				


		        CloseableHttpResponse response = httpclient.execute(httpPost);
		        try {
		            System.out.println(response.getStatusLine());
		            //API서버로부터 받은 JSON 문자열 데이터
		            result = EntityUtils.toString(response.getEntity());
		            HttpEntity entity = response.getEntity();
		            EntityUtils.consume(entity);
		            System.out.println(result);
		        } finally {
		            response.close();
		        }  
		        httpclient.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		  
		  /* 파일삭제 */
		  for(int k=0; k<fileNames.size(); k++) {
			  File file = new File(root_path + attach_path + fileNames.get(k).toString());
				System.out.println("=========path============>" + root_path + attach_path + fileNames.get(k).toString());
	
				if (file.exists()) {
					if (file.delete()) {
						System.out.println("파일삭제 성공");
					} else {
						System.out.println("파일삭제 실패");
					}
				} else {
					System.out.println("파일이 존재하지 않습니다.");
				}
			  }

		  
		/* sms DB 저장 */
		
		  for(int i = 0; i < user_name1.length; i++) { 
			  String q = "";
			  if(user_name1[i]!=q) {
				  sms_td.setUser_name(user_name1[i]);
				  sms_td.setTell(tell1[i]);
				  sms_td.setAdmin_id((String)session.getAttribute("admin_id"));
				  String sendresult = result.substring(9,12);
				  sms_td.setSend_result(sendresult);
			      sms_td.setEtc("null"); 
			      try { 
			    	  sms.sms_td_insert(sms_td); 
			      } catch (Exception e){
			    	  System.out.println("sms DB insert fail");
			    	  System.out.println(e);
				  } 
			  } 
		  }
		return "redirect:/sms_view1.do";
	}

	@RequestMapping("/sms_result.do")
	public String sms_result(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
		
		Map<String, Object> paraAuth = new HashMap<String, Object>();
		paraAuth.put("admin_id", session.getAttribute("admin_id"));
		paraAuth.put("board_id", paramMap.get("board_id"));
		String auth = authorityService.authority(paraAuth);
		model.addAttribute("auth", auth);
		System.out.println(auth);
		
        //채용권한만 체크해도 sms활성화
        Map<String, Object> paraAuth2 = new HashMap<String, Object>();
		paraAuth2.put("admin_id", session.getAttribute("admin_id"));
		paraAuth2.put("board_id", paramMap.get("board_id2"));
		String auth2 = authorityService.authority(paraAuth2);
		model.addAttribute("auth2", auth2);
		System.out.println("paraAuth2 ================= ?" + paraAuth2);
		System.out.println(auth2);
		
		String id = (String) session.getAttribute("admin_id");
		
		if ("bpfcadmin".equals(id)) {
			model.addAttribute("smsList", sms.sms_select_all(paramMap));
		}else if ("interlink".equals(id)) {
			model.addAttribute("smsList", sms.sms_select_all(paramMap));
		}else {
			model.addAttribute("smsList", sms.sms_select_adminid(id));
		}
		return "recruit/sms1/sms_result";
	}
	/*sms 결과값 송신*/
	@RequestMapping("/sms_get.do")
	public String sms_get(@RequestParam(value="Result", required=true) List<String> Result, @RequestParam(value="SeqNum", required=true) List<String> SeqNum,
			@RequestParam(value="UserCode", required=true) List<String> UserCode, @RequestParam(value="DeptCode", required=true) List<String> DeptCode,
			@RequestParam(value="Phone", required=true) List<String> Phone, @RequestParam(value="RTime", required=true) List<String> RTime,
			@RequestParam(value="RecvTime", required=true) List<String> RecvTime, @RequestParam(value="ReqPhone", required=true) List<String> ReqPhone,
			@RequestParam(value="CallCount", required=true) List<String> CallCount, @RequestParam(value="Error", required=true) List<String> Error) {
		
		for(int i =0; i < Result.size(); i++) {
			Surem_result suremresult = new Surem_result();
			suremresult.setResult(Result.get(i));
			suremresult.setSeqNum(SeqNum.get(i));
			suremresult.setUserCode(UserCode.get(i));
			suremresult.setDeptCode(DeptCode.get(i));
			suremresult.setPhone(Phone.get(i));
			suremresult.setRTime(RTime.get(i));
			suremresult.setRecvTime(RecvTime.get(i));
			suremresult.setReqPhone(ReqPhone.get(i));
			suremresult.setCallCount(CallCount.get(i));
			suremresult.setError(Error.get(i));
			String resultetc = Result.get(i)+SeqNum.get(i)+UserCode.get(i)+DeptCode.get(i)+Phone.get(i)+RTime.get(i)+RecvTime.get(i)
			+ReqPhone.get(i)+CallCount.get(i)+Error.get(i);
			suremresult.setEtc(resultetc);
			System.out.println(resultetc);
				try {
					sms.surem_result_insert(suremresult);
				} catch (Exception e) {
					System.out.println("surem_result_insert fail");
					System.out.println(e);
				}
				
				SMS_td sms_td = new SMS_td();
				int seqnum = Integer.parseInt(SeqNum.get(i));
				sms_td.setSms_no(seqnum);
				sms_td.setResult(Result.get(i));
				sms_td.setError(Error.get(i));
				try {
					sms.sms_update(sms_td);
				} catch (Exception e) {
					System.out.println("sms_update fail");
					System.out.println(e);
				}
		}
		return "recruit/sms1/sms_get";
	}
	
	@RequestMapping("/lms_get.do")
	public String lms_get(@RequestParam(value="Result", required=true) List<String> Result,
			@RequestParam(value="SeqNum", required=true) List<String> SeqNum,
			@RequestParam(value="UserCode", required=true) List<String> UserCode,
			@RequestParam(value="DeptCode", required=true) List<String> DeptCode,
			@RequestParam(value="Phone", required=true) List<String> Phone,
			@RequestParam(value="RecvTime", required=true) List<String> RecvTime,
			@RequestParam(value="ReqPhone", required=true) List<String> ReqPhone,
			@RequestParam(value="Error", required=true) List<String> Error) {
		
		/*{Result=2, SeqNum=29, UserCode=seantour2011, DeptCode=AK-UFG-AG, Phone=01031663135, RecvTime=20180801183041, ReqPhone=01096908579, Error=101}*/

		
		for(int i =0; i < Result.size(); i++) {
			Surem_result suremresult = new Surem_result();
			suremresult.setResult(Result.get(i));
			suremresult.setSeqNum(SeqNum.get(i));
			suremresult.setUserCode(UserCode.get(i));
			suremresult.setDeptCode(DeptCode.get(i));
			suremresult.setPhone(Phone.get(i));
			suremresult.setRTime("lms,mms-전송X");
			suremresult.setRecvTime(RecvTime.get(i));
			suremresult.setReqPhone(ReqPhone.get(i));
			suremresult.setCallCount("lms,mms-전송X");
			suremresult.setError(Error.get(i));
			String resultetc = Result.get(i)+SeqNum.get(i)+UserCode.get(i)+DeptCode.get(i)+Phone.get(i)+"lms,mms-전송X"+RecvTime.get(i)
			+ReqPhone.get(i)+"lms,mms-전송X"+Error.get(i);
			suremresult.setEtc(resultetc);
			System.out.println(resultetc);
				try {
					System.out.println("surem_result_insert ok");
					sms.surem_result_insert(suremresult);
				} catch (Exception e) {
					System.out.println("surem_result_insert fail");
					System.out.println(e);
				}
				
				SMS_td sms_td = new SMS_td();
				int seqnum = Integer.parseInt(SeqNum.get(i));
				sms_td.setSms_no(seqnum);
				sms_td.setResult(Result.get(i));
				sms_td.setError(Error.get(i));
				try {
					System.out.println("sms_update ok");
					sms.sms_update(sms_td);
				} catch (Exception e) {
					System.out.println("sms_update fail");
					System.out.println(e);
				}
		}
		
		return "recruit/sms1/lms_get";
	}


}
