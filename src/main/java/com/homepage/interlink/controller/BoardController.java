package com.homepage.interlink.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream.PutField;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.imageio.ImageIO;
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
import org.springframework.web.multipart.MultipartFile;
import com.homepage.interlink.model.Authority;
import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.BoardFile;
import com.homepage.interlink.model.Fileup;
import com.homepage.interlink.model.Inquiry;
import com.homepage.interlink.model.Lost;
import com.homepage.interlink.model.Privacy;
import com.homepage.interlink.service.AuthorityService;
import com.homepage.interlink.service.BoardFileService;

//import org.json.simple.JSONObject;


import com.homepage.interlink.service.BoardService;
import com.homepage.interlink.service.EtcService;



@Controller

public class BoardController {
 
    @Autowired
    BoardService boardService;
    @Autowired
    AuthorityService authorityService;
    @Autowired
    BoardFileService boardFileService;
    @Autowired
    EtcService etcService;

    
    /* ===================== 공지사항 Controller Start======================= */
    //board_id=1
    
    //공지사항 목록 
    @RequestMapping(value="/centernews_list.do")
    public String centernews_list(@RequestParam Map<String, Object> paramMap, Model model, Authority authority, int board_id, HttpSession session) {
    	
    	try {
    		

            Map<String, Object> paraAuth = new HashMap<String, Object>();
            paraAuth.put("admin_id", session.getAttribute("admin_id"));
            paraAuth.put("board_id", paramMap.get("board_id"));
            //String.valueOf(paraAuth.get("board_id"));

            String auth = authorityService.authority(paraAuth);

    	
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
	        
	        model.addAttribute("auth", auth);
	        
	        //jsp 에서 보여줄 정보 추출
	        model.addAttribute("startPage", startPage+"");//현재 페이지      
	        model.addAttribute("totalCnt", totalCnt);//전체 게시물수
	        model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
	        model.addAttribute("board_list", boardService.getContentList(paramMap));
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        model.addAttribute("sch_value", paramMap.get("sch_value"));
	        model.addAttribute("sch_type", paramMap.get("sch_type"));
	        model.addAttribute("ahority", authority.getBoard_id());
	        
    	}catch(Exception e) {
    		System.out.println("=========================> ERRRRRRRRRR ");
    		e.printStackTrace();    		
    	}
    	
//    	System.out.println("=========================> E....");
	      
        return "board/centernews_list";

    }
    
    //공지사항 상세 보기
    @RequestMapping("/centernews_detail.do")
    public String centernews_detail(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
    	 Map<String, Object> paraAuth = new HashMap<String, Object>();
         paraAuth.put("admin_id", session.getAttribute("admin_id"));
         paraAuth.put("board_id", paramMap.get("board_id"));
         //String.valueOf(paraAuth.get("board_id"));

        String auth = authorityService.authority(paraAuth);
    	
    	
    	model.addAttribute("file_list", boardFileService.getRead(paramMap));
    	model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
        model.addAttribute("board_id", paramMap.get("board_id"));
        model.addAttribute("auth", auth);
       

        return "board/centernews_detail";

    }
 

 
    //공지사항 작성폼
    @RequestMapping(value="/centernews_write.do", method=RequestMethod.GET)
    public String centernews_write(@RequestParam Map<String, Object> paramMap, HttpSession session, Model model){
    	
        
   		Map<String, Object> paraAuth = new HashMap<String, Object>();
        paraAuth.put("admin_id", session.getAttribute("admin_id"));
        paraAuth.put("board_id", Integer.parseInt((String)paramMap.get("board_id")));
        
//        System.out.println("paraAuth =============" + paraAuth.put("board_id", Integer.parseInt((String)paramMap.get("board_id"))));
       

        model.addAttribute("board_id", paramMap.get("board_id"));
        String auth = authorityService.authority(paraAuth);
        String view_name = authorityService.auView_name(paraAuth);
        
//        System.out.println("????????????????????????" + view_name);
        
        
        model.addAttribute("auth", auth);
        model.addAttribute("view_name", view_name);
        
        if(!"1".equals(auth)) {

        	return "redirect:/centernews_list.do?board_id=" + (String)paramMap.get("board_id");
        }else
        	
        	return "board/centernews_write"; // write.jsp로 이동
    }
    
    //공지사항 작성액션
    @RequestMapping(value="/centernews_insert.do", method=RequestMethod.POST)
    public String centernews_insert(@ModelAttribute Board board, Fileup fileup, HttpServletRequest request, Model model) throws Exception{
    	
    	int b_seq = boardService.getBoardSeq();
    	
    	board.setSeq_id(b_seq);
    	board.setTop_seq(b_seq);//답글 게시판일경우 최상위 게시물 번호
    	board.setPre_seq(b_seq);//답글 게시판일경우 앞글 게시물 번호
    	board.setStep(0); //답글 게시판일 경우 앞글의 Step + 1
    	board.setUse_yn("Y");
    	board.setPrivacy_no(0); //필요할때
    	board.setUpdate_id(board.getAdmin_id());
    	  /*부장님 end  */    	
    	
    	
    	boardService.create(board);
    	//int i = boardService.maxSelect(board.getBoard_id()); /*마지막 저장된 seq_id*/
    	
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
		//List<String> fileNames = new ArrayList<String>();
		if (null != files && files.size() > 0) {
			
			for (MultipartFile multipartFile : files) {
				if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
				
					System.out.println("file = " + multipartFile.getOriginalFilename() + "/" + multipartFile.getSize());
				/*	 상대경로*/ 
					String file_path = request.getSession().getServletContext().getRealPath("/");
					String attach_path = "resources/board/centernews/";
					String file_name = multipartFile.getOriginalFilename();
					String file_name2 = time + "_" + UUID.randomUUID().toString() +"_" +file_name;
					
					File f = new File(file_path + attach_path + file_name2);
					
					System.out.println("===========공지사항 파일업로드 실제 Path=========" + f);
					try {
						multipartFile.transferTo(f);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					//fileNames.add(file_name);
					
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

        
        return "redirect:/centernews_list.do?board_id=" + board.getBoard_id();
    }
    
     /*공지사항 다운로드 */
    @RequestMapping("/centernewsFileDown.do")
    private void centernewsFileDown(String file_name, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	request.setCharacterEncoding("UTF-8");
    	
    	String u = boardFileService.file_select(file_name);
    	//파일 업로드된 경로
    	System.out.println(file_name);
    	
    	try {
			 /*상대경로 */
    		String file_path = request.getSession().getServletContext().getRealPath("/");
    		String attach_path = "resources/board/centernews/";
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
    		

    
    
    /*
     * //공지사항 목록 삭제 2018-05-29 실제로 파일까지 지워지는 액션 -필요시 사용할 것
    @RequestMapping(value = "/centernewsListDelete.do", method = RequestMethod.GET)
	public String centernewsListDelete(@RequestParam  Map<String, Object> paramMap, int[] seq_id, int board_id, HttpServletRequest request) throws Exception {
    	
    	List<String> file_name = new ArrayList<String>(); 
    	String file_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/board/centernews/";
		
		for (int j = 0; j < seq_id.length; j++) {
			
//			BoardFile boardFile = new BoardFile();
			file_name = boardFileService.list_file_name(seq_id[j]);
			System.out.println("=============seq_id3==========" + seq_id[j]);
			System.out.println("=============file_name==========" + file_name);
			

			
			for(String fnm:file_name) {
				File file = new File(file_path + attach_path + fnm);
				System.out.println("=========공지사항 File Path=========>" + file);
				
				if( file.exists() ){
					if(file.delete()){
						System.out.println("파일삭제 성공");
					}else{
						System.out.println("파일삭제 실패");
					}
				}else{
					System.out.println("파일이 존재하지 않습니다.");
				}
				
			}
			
			boardFileService.fileDelete(seq_id[j]);
			boardService.ListDelete(seq_id[j]);
			
			
		}
		
		return "redirect:/centernews_list.do?board_id=" + board_id;
		
		
	}*/
    
  //공지사항 목록 삭제 - 실제로 업데이트로 'N'처리
    @RequestMapping(value = "/centernewsListDelete.do", method = RequestMethod.GET)
	public String centernewsListDelete(@RequestParam  Map<String, Object> paramMap, Board board, BoardFile boardFile, int[] seq_id, int board_id, HttpServletRequest request,  HttpSession ss) throws Exception {
    	
    	for (int j = 0; j < seq_id.length; j++) {
    		Object obj_id = ss.getAttribute("admin_id");
    		
			board.setUpdate_id(obj_id.toString());
			board.setSeq_id(seq_id[j]);
    		
    		boardService.BoardDelete(board);
    		
    		boardFile.setUpdate_id(obj_id.toString());
    		boardFile.setSeq_id(seq_id[j]);
    		boardFileService.fileDeleteBySeqid(boardFile);
    		
			
		}
		
		return "redirect:/centernews_list.do?board_id=" + board_id;
		
		
	}
    
    
/*    //공지사항 상세보기 삭제 2018-05-29 실제로 파일까지 지워지는 액션 -필요시 사용할 것
    @RequestMapping(value = "/centernewsBoardDelete.do", method = RequestMethod.GET)
	public String centernewsBoardDelete(@RequestParam Map<String, Object> paramMap, int seq_id, HttpServletRequest request) throws Exception {
    	
    	List<String> file_name = new ArrayList<String>(); 
//    	BoardFile boardFile = new BoardFile();
    	System.out.println("===========seq_id==============>" + paramMap.get("seq_id"));
    	System.out.println("===========board_id==============>" + paramMap.get("board_id"));
    	file_name = boardFileService.file_name(paramMap);
    	
    	
    	System.out.println("===========file_name===========>" + file_name);

    	String file_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/board/centernews/";
    	for(String fnm:file_name) {
    		
//  			File file = new File("resources/board/" + fnm);
  			File file = new File(file_path + attach_path + fnm);

    			System.out.println("=========공지사항 게시물 파일삭제 path============>" + file);
  			
            if( file.exists() ){
                if(file.delete()){
                    System.out.println("파일삭제 성공");
                }else{
                    System.out.println("파일삭제 실패");
                }
            }else{
                System.out.println("파일이 존재하지 않습니다.");
            }
    	}

    		boardFileService.fileDelete(Integer.parseInt((String)paramMap.get("seq_id")));
    		System.out.println("================파일삭제확인============" + paramMap.get("seq_id"));
			boardService.BoardDelete(Integer.parseInt((String)paramMap.get("seq_id")));
			System.out.println("--------------board_del = seq_id------>" + paramMap.get("seq_id"));
		
		return "redirect:/centernews_list.do?board_id=" + paramMap.get("board_id");
		
	}*/
    
    
  //공지사항 상세보기 삭제 
    @RequestMapping(value = "/centernewsBoardDelete.do", method = RequestMethod.GET)
	public String centernewsBoardDelete(@RequestParam Map<String, Object> paramMap, Board board, BoardFile boardFile, int[] seq_id, String[] file_key, HttpServletRequest request, HttpSession ss) throws Exception {
    	
    	for(int i = 0; i < seq_id.length; i++) {
    		Object obj_id = ss.getAttribute("admin_id");
    		
			board.setUpdate_id(obj_id.toString());
			board.setSeq_id(seq_id[i]);
    		
    		boardService.BoardDelete(board);
    		
	    	boardFile.setSeq_id(seq_id[i]);
			boardFile.setUpdate_id(obj_id.toString());
		
			boardFileService.fileDeleteBySeqid(boardFile);
    	
    	}
		
		return "redirect:/centernews_list.do?board_id=" + paramMap.get("board_id");
		
	}
    
    
    //공지사항 수정폼
    @RequestMapping("/centernewsBoardUpdateForm.do")
    public String centernewsBoardUpdateForm(@RequestParam Map<String, Object> paramMap, Model model) {
    	
    	model.addAttribute("file_list", boardFileService.getRead(paramMap));
    	model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
        model.addAttribute("board_id", paramMap.get("board_id"));
        
        return "board/centernews_update";

    }
    
    /*//공지사항 수정 액션 - 실제 파일이 삭제되고 재업로드가 되는 컨트롤러
    @SuppressWarnings("unchecked")
	@RequestMapping(value = "/centernewsBoardUpdate.do", method = RequestMethod.POST)
   	public String centernewsBoardUpdate(@RequestParam Map<String, Object> paramMap, @ModelAttribute Board board, BoardFile boardFile,  Fileup fileup, HttpServletRequest request, Model model, String[] fileKey, String[] flag, String[] fName) {
    		
    		
    		board.setUpdate_id(board.getAdmin_id());
    		boardService.updateAllBoard(board);
    		
       		boardFile.setSeq_id(board.getSeq_id());
            boardFile.setBoard_id(board.getBoard_id());
            System.out.println("===========board_id TEST......=========== " + board.getBoard_id());
            boardFile.setAdmin_id(board.getAdmin_id());
            boardFile.setUse_yn("Y");
            
            파일
            Date date = new Date();
    		long mm = date.getMonth()+date.getTime();
    		List<MultipartFile> files = fileup.getUploadfile();
    		System.out.println("File ----->" + files);
    		//List<String> fileNames = new ArrayList<String>();
    		String y = "";
    		if (null != files && files.size() > 0) {
    			
    			for (MultipartFile multipartFile : files) {
    				if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
    				
    					System.out.println("file = " + multipartFile.getOriginalFilename() + "/" + multipartFile.getSize());
    					 상대경로 
    					String file_path = request.getSession().getServletContext().getRealPath("/");
    					String attach_path = "resources/board/centernews/";
    					String file_name = multipartFile.getOriginalFilename();
    					String file_name2 = file_name+mm;
    					
    					File f = new File(file_path + attach_path +file_name2);
    					System.out.println("=========실제 경로 path=====" + f);
    					
    					try {
    						multipartFile.transferTo(f);
    					} catch (IllegalStateException e) {
    						e.printStackTrace();
    					} catch (IOException e) {
    						e.printStackTrace();
    					}
    					//fileNames.add(file_name);
    					y += file_name+""; // 다중 업로드시 구분을 위해 [  /   ] 추가해야함 2018.04.20
    					
    					이력서 model에 파일명,주소 저장
    					boardFile.setFile_name(file_name);
    					boardFile.setFile_name2(file_name2);
    					boardFile.setFile_path("/" + attach_path);
    					
    			         파일명에서 확장자 추출 
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

    				String file_path = request.getSession().getServletContext().getRealPath("/");
					String attach_path = "resources/board/centernews/";
    				File file = new File(file_path + attach_path + fName[i]);
   					System.out.println("=========boardcontroller수정경로============>" + file);
    					
   					if( file.exists()){
   						if(file.delete()){
   							
   							
   							System.out.println("파일삭제 성공");
   						}else{
   							System.out.println("파일삭제 실패");
   						}
   					}else{
   						System.out.println("파일이 존재하지 않습니다.");
   					}
   					boardFileService.fileDeleteByFileKey(Integer.parseInt(fileKey[i]));
					System.out.println("======================== last : " + boardFileService.fileDelete(Integer.parseInt(fileKey[i])));
						
    			}
    		}
    		}
    		
    		return "redirect:/centernews_list.do?board_id=" + board.getBoard_id();

   	}*/
    
    //공지사항 수정 액션 - 실제 파일이 삭제안되고 use_yn = N처리
    @SuppressWarnings("unchecked")
	@RequestMapping(value = "/centernewsBoardUpdate.do", method = RequestMethod.POST)
   	public String centernewsBoardUpdate(@RequestParam Map<String, Object> paramMap, @ModelAttribute Board board, BoardFile boardFile, Fileup fileup, HttpServletRequest request, Model model, String[] file_key, String[] flag, String[] fName,HttpSession ss) {
    		
    		
    		Object obj_id = ss.getAttribute("admin_id");
    		board.setUpdate_id(obj_id.toString());
    		boardService.updateAllBoard(board);
    		
       		boardFile.setSeq_id(board.getSeq_id());
            boardFile.setBoard_id(board.getBoard_id());
            boardFile.setAdmin_id(obj_id.toString());
            boardFile.setUpdate_id(obj_id.toString());
            boardFile.setUse_yn("Y");
            
            
            /*파일*/
            Calendar cal = Calendar.getInstance()  ;
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
            String time = dateFormat.format(cal.getTime());

    		List<MultipartFile> files = fileup.getUploadfile();
    		System.out.println("File ----->" + files);
    		//List<String> fileNames = new ArrayList<String>();
    		/*String y = "";*/
    		if (null != files && files.size() > 0) {
    			
    			for (MultipartFile multipartFile : files) {
    				if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
    				
    					System.out.println("file = " + multipartFile.getOriginalFilename() + "/" + multipartFile.getSize());
    				/*	 상대경로*/ 
    					String file_path = request.getSession().getServletContext().getRealPath("/");
    					String attach_path = "resources/board/centernews/";
    					String file_name = multipartFile.getOriginalFilename();
    					/*String file_name2 = time + "_" +file_name;*/
    					String file_name2 = time+ "_" + UUID.randomUUID().toString() +"_" +file_name;
    					
    					File f = new File(file_path + attach_path +file_name2);
    					System.out.println("=========실제 경로 path=====" + f);
    					
    					try {
    						multipartFile.transferTo(f);
    					} catch (IllegalStateException e) {
    						e.printStackTrace();
    					} catch (IOException e) {
    						e.printStackTrace();
    					}
    					//fileNames.add(file_name);
    					/*y += file_name+""; // 다중 업로드시 구분을 위해 [  /   ] 추가해야함 2018.04.20
*/    					
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
    		if(file_key != null) {
    		
    		for(int i=0; i<file_key.length ; i++) {
    			
    			System.out.println("===========fileKey==============>" + file_key[i]);
    			System.out.println("===========flag==============>" + flag[i]);
        		System.out.println("===========fName==============>" + fName[i]);

        		//flag가 D인건 삭제. 데이터도 삭제, 파일도 삭제.
    			if("D".equals(flag[i])) {
    				boardFile.setFile_key(Integer.parseInt(file_key[i]));
    				boardFile.setUpdate_id(obj_id.toString());
    				
    				boardFileService.fileDeleteByBoardFile(boardFile);
					System.out.println("======================== fileKey 값 : " + boardFileService.fileDeleteByBoardFile(boardFile));
						
    			}
    		}
    		}
    		
    		return "redirect:/centernews_list.do?board_id=" + board.getBoard_id();

   	}
    
    /* ===================== 공지사항 Controller End======================= */
    
    
    
    
    
    
    /* ===================== 사보 Controller Start======================= */
    //board_id=2
    
    // 사보 작성화면
    @RequestMapping(value="/newsletter_write.do", method=RequestMethod.GET)
    public String newsletter_write(@RequestParam Map<String, Object> paramMap, HttpSession session, Model model){
    	
        
   		Map<String, Object> paraAuth = new HashMap<String, Object>();
        paraAuth.put("admin_id", session.getAttribute("admin_id"));
        paraAuth.put("board_id", Integer.parseInt((String)paramMap.get("board_id")));
        
        model.addAttribute("board_id", paramMap.get("board_id"));
        String auth = authorityService.authority(paraAuth);
        String view_name = authorityService.auView_name(paraAuth);
        
        model.addAttribute("auth", auth);
        model.addAttribute("view_name", view_name);
        
        if(!"1".equals(auth)) {

        	
        	return "redirect:/newsletter_list.do?board_id=" + (String)paramMap.get("board_id");
        }else
        
        

        	return "board/newsletter_write"; // write.jsp로 이동
    }
    
    // 사보 작성처리
    @RequestMapping(value="/newsletter_insert.do", method=RequestMethod.POST)
    public String newsletter_insert(@ModelAttribute Board board, Fileup fileup, HttpServletRequest request, Model model) throws Exception{

  	int b_seq = boardService.getBoardSeq();
  	
  	board.setSeq_id(b_seq);
	board.setTop_seq(b_seq);//답글 게시판일경우 최상위 게시물 번호
	board.setPre_seq(b_seq);//답글 게시판일경우 앞글 게시물 번호
	board.setStep(0); //답글 게시판일 경우 앞글의 Step + 1
	board.setUse_yn("Y");
	board.setPrivacy_no(0); //필요할때
	board.setUpdate_id(board.getAdmin_id());
	  /*부장님 end  */   
  	
  	
  	boardService.create(board);
  	//int i = boardService.maxSelect(board.getBoard_id()); /*마지막 저장된 seq_id*/
  	
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
		//List<String> fileNames = new ArrayList<String>();

		if (null != files && files.size() > 0) {
			
			for (MultipartFile multipartFile : files) {
				if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
				
					System.out.println("file = " + multipartFile.getOriginalFilename() + "/" + multipartFile.getSize());
				/*	 상대경로*/ 
					String file_path = request.getSession().getServletContext().getRealPath("/");
					String attach_path = "resources/board/newsletter/";
					String file_name = multipartFile.getOriginalFilename();
					String file_name2 = time + "_" + UUID.randomUUID().toString() +"_" +file_name;
					File f = new File(file_path + attach_path + file_name2);
					System.out.println("===========BPFC 소식지 파일업로드 실제 Path=========" +f);
					try {
						multipartFile.transferTo(f);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					//fileNames.add(file_name);

					
				/*	이력서 model에 파일명,주소 저장*/
					boardFile.setFile_name(file_name);
					boardFile.setFile_name2(file_name2);
					boardFile.setFile_path("/" + attach_path);
//					boardFile.setFile_path(file_path);
					
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


        
        return "redirect:/newsletter_list.do?board_id=" + board.getBoard_id();
    }
    


    
  
  
    
    //사보 수정폼
    @RequestMapping(value = "/newsletterBoardUpdateForm.do")
	public String newsletterBoardUpdateForm(@RequestParam Map<String, Object> paramMap, Model model) {
    	
    	model.addAttribute("file_list", boardFileService.getRead(paramMap));
    	paramMap.put("board_cnt", boardService.getcntBoard(paramMap));
    	model.addAttribute("newsletter_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
        model.addAttribute("board_id", paramMap.get("board_id"));
    		
    		return "board/newsletter_update";

		
	}
    
    /*//사보 수정 액션 - 실제 파일이 삭제되고 재업로드가 되는 컨트롤러
    @SuppressWarnings("unchecked")
  	@RequestMapping(value = "/newsletterBoardUpdate.do", method = RequestMethod.POST)
     	public String newsletterBoardUpdate(@RequestParam Map<String, Object> paramMap, @ModelAttribute Board board, Fileup fileup, HttpServletRequest request, Model model, String[] fileKey, String[] flag, String[] fName) {
      		
      		board.setUpdate_id(board.getAdmin_id());
      		boardService.updateAllBoard(board);
         		
              	BoardFile boardFile = new BoardFile();
	      		boardFile.setSeq_id(board.getSeq_id());
	            boardFile.setBoard_id(board.getBoard_id());
	            System.out.println("===========board_id TEST......=========== " + board.getBoard_id());
	            boardFile.setAdmin_id(board.getAdmin_id());
              
              파일
      		List<MultipartFile> files = fileup.getUploadfile();
      		System.out.println("File ----->" + files);
      		//List<String> fileNames = new ArrayList<String>();
      		String y = "";
      		if (null != files && files.size() > 0) {
      			
      			for (MultipartFile multipartFile : files) {
      				if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
      				
      					System.out.println("file = " + multipartFile.getOriginalFilename() + "/" + multipartFile.getSize());
      					 상대경로 
      					String file_path = request.getSession().getServletContext().getRealPath("/");
      					String attach_path = "resources/board/newsletter/";
      					String file_name = multipartFile.getOriginalFilename();
      					File f = new File(file_path + attach_path +file_name);
      					try {
      						multipartFile.transferTo(f);
      					} catch (IllegalStateException e) {
      						e.printStackTrace();
      					} catch (IOException e) {
      						e.printStackTrace();
      					}
      					//fileNames.add(file_name);
      					y += file_name+""; // 다중 업로드시 구분을 위해 [  /   ] 추가해야함 2018.04.20
      					
      					이력서 model에 파일명,주소 저장
      					boardFile.setFile_name(file_name);
      					boardFile.setFile_path("/" + attach_path);
      					
      			         파일명에서 확장자 추출 
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

      				String file_path = request.getSession().getServletContext().getRealPath("/");
					String attach_path = "resources/board/newsletter/";
      				File file = new File(file_path + attach_path + fName[i]);
     					System.out.println("=========사보수정액션파일path============>" + file);
      					
     					if( file.exists()){
     						if(file.delete()){
     							
     							
     							System.out.println("파일삭제 성공");
     						}else{
     							System.out.println("파일삭제 실패");
     						}
     					}else{
     						System.out.println("파일이 존재하지 않습니다.");
     					}
     					boardFileService.fileDeleteByFileKey(Integer.parseInt(fileKey[i]));
  					System.out.println("======================== last : " + boardFileService.fileDelete(Integer.parseInt(fileKey[i])));
  						
      			}
      		}
      		}
      		
      		
      		
      		

         		
         		
         		return "redirect:/newsletter_list.do?board_id=" + board.getBoard_id();

     		
     	}*/
    
  //사보 수정 액션 - 실제 파일이 삭제안되고 use_yn = N처리
    @SuppressWarnings("unchecked")
  	@RequestMapping(value = "/newsletterBoardUpdate.do", method = RequestMethod.POST)
     	public String newsletterBoardUpdate(@RequestParam Map<String, Object> paramMap, @ModelAttribute Board board, BoardFile boardFile, Fileup fileup, HttpServletRequest request, Model model, String[] file_key, String[] flag, String[] fName, HttpSession ss) {
      		
	    	Object obj_id = ss.getAttribute("admin_id");
			board.setUpdate_id(obj_id.toString());
			boardService.updateAllBoard(board);
			
	   		boardFile.setSeq_id(board.getSeq_id());
	        boardFile.setBoard_id(board.getBoard_id());
	        boardFile.setAdmin_id(obj_id.toString());
	        boardFile.setUpdate_id(obj_id.toString());
	        boardFile.setUse_yn("Y");
              
              /*파일*/
	        Calendar cal = Calendar.getInstance()  ;
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
	        String time = dateFormat.format(cal.getTime());
	            
      		List<MultipartFile> files = fileup.getUploadfile();
      		System.out.println("File ----->" + files);
      		//List<String> fileNames = new ArrayList<String>();
      		if (null != files && files.size() > 0) {
      			
      			for (MultipartFile multipartFile : files) {
      				if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
      				
      					System.out.println("file = " + multipartFile.getOriginalFilename() + "/" + multipartFile.getSize());
      				/*	 상대경로*/ 
      					String file_path = request.getSession().getServletContext().getRealPath("/");
      					String attach_path = "resources/board/newsletter/";
      					String file_name = multipartFile.getOriginalFilename();
    					String file_name2 = time + "_" + UUID.randomUUID().toString() +"_" +file_name;
      					
    					File f = new File(file_path + attach_path +file_name2);
    					System.out.println("=========실제 경로 path=====" + f);
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
      		if(file_key != null) {
      		
      		for(int i=0; i<file_key.length ; i++) {
      			
      			System.out.println("===========fileKey==============>" + file_key[i]);
      			System.out.println("===========flag==============>" + flag[i]);
          		System.out.println("===========fName==============>" + fName[i]);

          		//flag가 D인건 삭제. 데이터도 삭제, 파일도 삭제.
      			if("D".equals(flag[i])) {

      				boardFile.setFile_key(Integer.parseInt(file_key[i]));
    				boardFile.setUpdate_id(obj_id.toString());
    				
    				boardFileService.fileDeleteByBoardFile(boardFile);
					System.out.println("======================== fileKey 값 : " + boardFileService.fileDeleteByBoardFile(boardFile));
  						
      			}
      		}
      		}
      		
      		
      		
      		

         		
         		
         		return "redirect:/newsletter_list.do?board_id=" + board.getBoard_id();

     		
     	}

   		
   	
  	/*사보 다운로드 */
    @RequestMapping("/newsletterFileDown.do")
    private void newsletterFileDown(String file_name, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	request.setCharacterEncoding("UTF-8");
    	
    	String u = boardFileService.file_select(file_name);
    	//파일 업로드된 경로
    	System.out.println(file_name);
    	
    	try {
			 /*상대경로 */
    		String file_path = request.getSession().getServletContext().getRealPath("/");
    		String attach_path = "resources/board/newsletter/";
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
    
    //사보 목록 리스트
    @RequestMapping(value="/newsletter_list.do")
    public String newsletter_list(@RequestParam Map<String, Object> paramMap, Authority authority, Model model, int board_id, HttpSession session) {
    	
    	try {
    		
    		
    		
            Map<String, Object> paraAuth = new HashMap<String, Object>();
            paraAuth.put("admin_id", session.getAttribute("admin_id"));
            paraAuth.put("board_id", paramMap.get("board_id"));
//            String.valueOf(paraAuth.get("board_id"));

            String auth = authorityService.authority(paraAuth);
    	
	        //조회 하려는 페이지
	        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);
	
	        //한페이지에 보여줄 리스트 수
	        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):5);
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
	        
	        model.addAttribute("auth", auth);
	        
	        //jsp 에서 보여줄 정보 추출
	        model.addAttribute("startPage", startPage+"");//현재 페이지      
	        model.addAttribute("totalCnt", totalCnt);//전체 게시물수
	        model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
	        model.addAttribute("board_list", boardService.getContentList(paramMap));
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        model.addAttribute("sch_value", paramMap.get("sch_value"));
	        model.addAttribute("sch_type", paramMap.get("sch_type"));
	        model.addAttribute("ahority", authority.getBoard_id());

	        
 
    	}catch(Exception e) {

    		e.printStackTrace();    		
    	}
    	

	      
        return "board/newsletter_list";

    }	
    
  //사보 상세 보기
    @RequestMapping("/newsletter_detail.do")
    public String newsletter_detail(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
    	
    	Map<String, Object> paraAuth = new HashMap<String, Object>();
        paraAuth.put("admin_id", session.getAttribute("admin_id"));
        paraAuth.put("board_id", paramMap.get("board_id"));
 
        String auth = authorityService.authority(paraAuth);
    	
    	List<BoardFile> boardFile = boardFileService.getRead(paramMap);
    	BoardFile pdfFile = new BoardFile();
    	
    	for(BoardFile file:boardFile) {
    		if(".pdf".equals(file.getExtention_name().toLowerCase())) {
    			pdfFile = file;
    		}
    	}
    	
    	model.addAttribute("pdfFile", pdfFile);
    	
    	model.addAttribute("file_list", boardFileService.getRead(paramMap));
        model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
        model.addAttribute("board_id", paramMap.get("board_id"));
        model.addAttribute("auth", auth);
                
        return "board/newsletter_detail";

    }
    
  /*
   * //사보 리스트 삭제 - 2018-05-29 실제로 파일까지 지워지는 액션 -필요시 사용할 것
    @RequestMapping(value = "/newsletterListDelete.do", method = RequestMethod.GET)
	public String newsletterListDelete(@RequestParam int[] seq_id, int board_id, HttpServletRequest request) throws Exception {
    	List<String> file_name = new ArrayList<String>(); 
    	String file_path = request.getSession().getServletContext().getRealPath("/");
    	String attach_path = "resources/board/newsletter/";
		
    	for (int j = 0; j < seq_id.length; j++) {
			
//			BoardFile boardFile = new BoardFile();
			file_name = boardFileService.list_file_name(seq_id[j]);
			System.out.println("=============seq_id3==========" + seq_id[j]);
			System.out.println("=============file_name==========" + file_name);
			
			for(String fnm:file_name) {
				File file = new File(file_path + attach_path + fnm);
				System.out.println("=========사보리스트삭제파일path============>" + file);
				if( file.exists() ){
					if(file.delete()){
						System.out.println("파일삭제 성공");
					}else{
						System.out.println("파일삭제 실패");
					}
				}else{
					System.out.println("파일이 존재하지 않습니다.");
				}
				
			}
			boardFileService.fileDelete(seq_id[j]);
			boardService.ListDelete(seq_id[j]);
		}
		return "redirect:/newsletter_list.do?board_id=" + board_id;
		
	}*/
    
    
    
  //사보 리스트 삭제 - 실제로 업데이트로 'N'처리
    @RequestMapping(value = "/newsletterListDelete.do", method = RequestMethod.GET)
	public String newsletterListDelete(@RequestParam  Map<String, Object> paramMap, Board board, BoardFile boardFile, int[] seq_id, int board_id, HttpServletRequest request,  HttpSession ss) throws Exception {

    	for (int j = 0; j < seq_id.length; j++) {
    		Object obj_id = ss.getAttribute("admin_id");
    		
			board.setUpdate_id(obj_id.toString());
			board.setSeq_id(seq_id[j]);
    		
    		boardService.BoardDelete(board);
    		
    		boardFile.setUpdate_id(obj_id.toString());
    		boardFile.setSeq_id(seq_id[j]);
    		boardFileService.fileDeleteBySeqid(boardFile);
    	}
		return "redirect:/newsletter_list.do?board_id=" + board_id;
		
	}
    
    /*
     * //사보 게시물 삭제 - 2018-05-29 실제로 파일까지 지워지는 액션 -필요시 사용할 것
    @RequestMapping(value = "/newsletterBoardDelete.do", method = RequestMethod.GET)
	public String newsletterBoardDelete(@RequestParam Map<String, Object> paramMap, int seq_id, HttpServletRequest request) throws Exception {
    	
    	List<String> file_name = new ArrayList<String>(); 
    	BoardFile boardFile = new BoardFile();
    	System.out.println("===========seq_id==============>" + paramMap.get("seq_id"));
    	System.out.println("===========board_id==============>" + paramMap.get("board_id"));
    	file_name = boardFileService.file_name(paramMap);
    	
    	System.out.println("===========file_name===========>" + file_name);

    	String file_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/board/newsletter/";
		for(String fnm:file_name) {
    		
  			File file = new File(file_path + attach_path + fnm);

    			System.out.println("=========사보게시물파일삭제 path============>" + file);
  			
            if( file.exists() ){
                if(file.delete()){
                    System.out.println("파일삭제 성공");
                }else{
                    System.out.println("파일삭제 실패");
                }
            }else{
                System.out.println("파일이 존재하지 않습니다.");
            }
    	}


			boardFileService.fileDelete(Integer.parseInt((String)paramMap.get("seq_id")));
			System.out.println("================파일삭제확인============" + paramMap.get("seq_id"));
			boardService.BoardDelete(Integer.parseInt((String)paramMap.get("seq_id")));
			System.out.println("--------------board_del = seq_id------>" + paramMap.get("seq_id"));
			
		return "redirect:/newsletter_list.do?board_id=" + paramMap.get("board_id");
		
	}*/
    
    
  //사보 게시물 삭제 - 실제로 업데이트로 'N'처리
    @RequestMapping(value = "/newsletterBoardDelete.do", method = RequestMethod.GET)
	public String newsletterBoardDelete(@RequestParam Map<String, Object> paramMap, Board board, BoardFile boardFile, int[] seq_id, String[] file_key, HttpServletRequest request, HttpSession ss) throws Exception {
    	
    	for(int i = 0; i < seq_id.length; i++) {
    		Object obj_id = ss.getAttribute("admin_id");
    		
			board.setUpdate_id(obj_id.toString());
			board.setSeq_id(seq_id[i]);
    		
    		boardService.BoardDelete(board);
    		
	    	boardFile.setSeq_id(seq_id[i]);
			boardFile.setUpdate_id(obj_id.toString());
		
			boardFileService.fileDeleteBySeqid(boardFile);
    	
    	}
			
		return "redirect:/newsletter_list.do?board_id=" + paramMap.get("board_id");
		
	}
    
    
	/* ===================== 사보 Controller End======================= */
    
    
    
    
    
    /* ===================== 포토갤러리 Controller Start======================= */
    //board_id=3
    
    //포토갤러리 작성폼
    @RequestMapping(value="/photo_write.do", method=RequestMethod.GET)
    public String photo_write(@RequestParam Map<String, Object> paramMap, HttpSession session, Model model){
    	
        
   		Map<String, Object> paraAuth = new HashMap<String, Object>();
        paraAuth.put("admin_id", session.getAttribute("admin_id"));
        paraAuth.put("board_id", Integer.parseInt((String)paramMap.get("board_id")));
        
        model.addAttribute("board_id", paramMap.get("board_id"));
        String auth = authorityService.authority(paraAuth);
        String view_name = authorityService.auView_name(paraAuth);
        
        model.addAttribute("auth", auth);
        model.addAttribute("view_name", view_name);
        
        if(!"1".equals(auth)) {

        	
        	return "redirect:/photo_list.do?board_id=" + (String)paramMap.get("board_id");
        }else
        
        

        	return "board/photo_write"; // write.jsp로 이동
    }
    
    /*포토갤러리 다운로드 */
    @RequestMapping("/photoFileDown.do")
    private void photoFileDown(String file_name, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	request.setCharacterEncoding("UTF-8");
    	
    	String u = boardFileService.file_select(file_name);
    	
    	//파일 업로드된 경로
    	System.out.println(file_name);
    	
    	try {
			 /*상대경로 */
    		String file_path = request.getSession().getServletContext().getRealPath("/");
    		String attach_path = "resources/board/photo/";
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
    
    
    // 포토갤러리 작성액션
    @RequestMapping(value="/photo_insert.do", method=RequestMethod.POST)
    public String photo_insert(@ModelAttribute Board board, Fileup fileup, HttpServletRequest request, Model model) throws Exception{
    	System.out.println("들어온다다다다ㅏ");
  	  /*부장님 start*/  
    	int b_seq = boardService.getBoardSeq();
    	
    	board.setSeq_id(b_seq);
    	board.setTop_seq(b_seq);//답글 게시판일경우 최상위 게시물 번호
    	board.setPre_seq(b_seq);//답글 게시판일경우 앞글 게시물 번호
    	board.setStep(0); //답글 게시판일 경우 앞글의 Step + 1
    	board.setUse_yn("Y");
    	board.setPrivacy_no(0); //필요할때
    	board.setUpdate_id(board.getAdmin_id());
    	  /*부장님 end  */     	
  	
  	boardService.create(board);
  	//int i = boardService.maxSelect(board.getBoard_id()); /*마지막 저장된 seq_id*/
  	
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
					String attach_path = "resources/board/photo/";
					String file_name = multipartFile.getOriginalFilename();
					String file_name2 = time + "_" + UUID.randomUUID().toString() +"_" +file_name;
					
					File f = new File(file_path + attach_path + file_name2);
					System.out.println("===========포토갤러리 파일업로드 실제 Path=========" + f);
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
		           
		           //섬네일 생성
		           //가로사이즈
		            int thumbnail_width2 = 400;
		            //썸네일 세로사이즈
		            int thumbnail_height2 = 300;
		            //원본이미지파일의 경로+파일명
		            File origin_file_name2 = new File(file_path + attach_path + file_name2);
		            //생성할 썸네일파일의 경로+썸네일파일명
		            File thumb_file_name2 = new File(file_path + attach_path + "thumb/thumb_" + file_name2);
		 

		            
		            BufferedImage buffer_original_image2 = ImageIO.read(origin_file_name2);
		            BufferedImage buffer_thumbnail_image2 = new BufferedImage(thumbnail_width2, thumbnail_height2, BufferedImage.TYPE_3BYTE_BGR);
		            Graphics2D graphic2 = buffer_thumbnail_image2.createGraphics();
		            graphic2.drawImage(buffer_original_image2, 0, 0, thumbnail_width2, thumbnail_height2, null);
		            ImageIO.write(buffer_thumbnail_image2, "jpg", thumb_file_name2);
				 } catch (Exception e) {
			            e.printStackTrace();
			        }
					
					
					try { 
						
						boardFileService.insert(boardFile);
					} catch (Exception e) {
						model.addAttribute("msg", "다시 입력하세요.");
					}
				}
			}
		}

        
        return "redirect:/photo_list.do?board_id=" + board.getBoard_id();
    }
    


    
  
  
    
    //포토갤러리 수정 jsp로 이동
    @RequestMapping(value = "/photoBoardUpdateForm.do")
	public String photoBoardUpdateForm(@RequestParam Map<String, Object> paramMap, Model model) {
    	
    	model.addAttribute("file_list", boardFileService.getRead(paramMap));
    	model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
        model.addAttribute("board_id", paramMap.get("board_id"));

    	return "board/photo_update";

		
	}
    
    //포토갤러리 게시물 수정 액션 컨트롤러
	@SuppressWarnings("unchecked")
    @RequestMapping(value = "/photoBoardUpdate.do", method = RequestMethod.POST)
   	public String photoBoardUpdate(@RequestParam Map<String, Object> paramMap, @ModelAttribute Board board, BoardFile boardFile, Fileup fileup, HttpServletRequest request, Model model, String[] file_key, String[] flag, String[] fName,HttpSession ss) {
		
		Object obj_id = ss.getAttribute("admin_id");
		board.setUpdate_id(obj_id.toString());
		boardService.updateAllBoard(board);
		
   		boardFile.setSeq_id(board.getSeq_id());
        boardFile.setBoard_id(board.getBoard_id());
        boardFile.setAdmin_id(obj_id.toString());
        boardFile.setUpdate_id(obj_id.toString());
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
					String attach_path = "resources/board/photo/";
					String file_name = multipartFile.getOriginalFilename();
					String file_name2 = time+ "_" + UUID.randomUUID().toString() +"_" +file_name;
					File f = new File(file_path + attach_path +file_name2);
					System.out.println("=========포토갤러리 실제 경로 path=====" + f);
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
				           
				           //섬네일 생성
				           //가로사이즈
				            int thumbnail_width2 = 400;
				            //썸네일 세로사이즈
				            int thumbnail_height2 = 300;
				            //원본이미지파일의 경로+파일명
				            File origin_file_name2 = new File(file_path + attach_path + file_name2);
				            //생성할 썸네일파일의 경로+썸네일파일명
				            File thumb_file_name2 = new File(file_path + attach_path + "thumb/thumb_" + file_name2);
				 

				            
				            BufferedImage buffer_original_image2 = ImageIO.read(origin_file_name2);
				            BufferedImage buffer_thumbnail_image2 = new BufferedImage(thumbnail_width2, thumbnail_height2, BufferedImage.TYPE_3BYTE_BGR);
				            Graphics2D graphic2 = buffer_thumbnail_image2.createGraphics();
				            graphic2.drawImage(buffer_original_image2, 0, 0, thumbnail_width2, thumbnail_height2, null);
				            ImageIO.write(buffer_thumbnail_image2, "jpg", thumb_file_name2);
						 } catch (Exception e) {
					            e.printStackTrace();
					        }
					
					
					try { 
						
						boardFileService.insert(boardFile);
					} catch (Exception e) {
						model.addAttribute("msg", "다시 입력하세요.");
					}
				}
			}
		}
		if(file_key != null) {
		
		for(int i=0; i<file_key.length ; i++) {
			
			System.out.println("===========fileKey==============>" + file_key[i]);
			System.out.println("===========flag==============>" + flag[i]);
    		System.out.println("===========fName==============>" + fName[i]);

    		//flag가 D인건 삭제. 데이터도 삭제, 파일도 삭제.
			if("D".equals(flag[i])) {

				boardFile.setFile_key(Integer.parseInt(file_key[i]));
				boardFile.setUpdate_id(obj_id.toString());
				
				boardFileService.fileDeleteByBoardFile(boardFile);
				System.out.println("======================== fileKey 값 : " + boardFileService.fileDeleteByBoardFile(boardFile));
					
			}
		}
		}
		
		
		
		
       		return "redirect:/photo_list.do?board_id=" + board.getBoard_id();

   		
   	}
    
    
    //포토갤러리 목록 리스트
    @RequestMapping(value="/photo_list.do")
    public String photo_list(@RequestParam Map<String, Object> paramMap, Model model, Authority authority, int board_id, HttpSession session) {
    	
    	try {
   		
            Map<String, Object> paraAuth = new HashMap<String, Object>();
            paraAuth.put("admin_id", session.getAttribute("admin_id"));
            paraAuth.put("board_id", paramMap.get("board_id"));
//            String.valueOf(paraAuth.get("board_id"));

            String auth = authorityService.authority(paraAuth);
    	
	        //조회 하려는 페이지
	        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);
	
	        //한페이지에 보여줄 리스트 수
	        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):5);
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
	        
	        model.addAttribute("auth", auth);
	        
	        //jsp 에서 보여줄 정보 추출
	        model.addAttribute("startPage", startPage+"");//현재 페이지      
	        model.addAttribute("totalCnt", totalCnt);//전체 게시물수
	        model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
	        model.addAttribute("board_list", boardService.getContentList(paramMap));
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        model.addAttribute("sch_value", paramMap.get("sch_value"));
	        model.addAttribute("sch_type", paramMap.get("sch_type"));
	        model.addAttribute("ahority", authority.getBoard_id());
	        
 
    	}catch(Exception e) {

    		e.printStackTrace();    		
    	}
    	

	      
        return "board/photo_list";

    }	
    
  //포토갤러리 상세 보기
    @RequestMapping("/photo_detail.do")
    public String photo_detail(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
    	
    	Map<String, Object> paraAuth = new HashMap<String, Object>();
        paraAuth.put("admin_id", session.getAttribute("admin_id"));
        paraAuth.put("board_id", paramMap.get("board_id"));
//        String.valueOf(paraAuth.get("board_id"));

        String auth = authorityService.authority(paraAuth);
    	
        model.addAttribute("file_list", boardFileService.getRead(paramMap));
    	model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
        model.addAttribute("board_id", paramMap.get("board_id"));
        model.addAttribute("auth", auth);
        
        return "board/photo_detail";

    }
    
/*  
 * //포토갤러리 리스트 삭제 - 2018-05-29 실제로 파일까지 지워지는 액션 -필요시 사용할 것
    @RequestMapping(value = "/photoListDelete.do", method = RequestMethod.GET)
	public String photoListDelete(@RequestParam int[] seq_id, int board_id, HttpServletRequest request) throws Exception {
    	
    	List<String> file_name = new ArrayList<String>(); 
    	String file_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/board/photo/";
		
		for (int j = 0; j < seq_id.length; j++) {
			
//			BoardFile boardFile = new BoardFile();
			file_name = boardFileService.list_file_name(seq_id[j]);
			System.out.println("=============seq_id3==========" + seq_id[j]);
			System.out.println("=============file_name==========" + file_name);
			
			for(String fnm:file_name) {
				File file = new File(file_path + attach_path + fnm);
				System.out.println("=========포토갤러리 리스트 삭제 File path=========>" + file);
				if( file.exists() ){
					if(file.delete()){
						System.out.println("파일삭제 성공");
					}else{
						System.out.println("파일삭제 실패");
					}
				}else{
					System.out.println("파일이 존재하지 않습니다.");
				}
				
			}
			boardFileService.fileDelete(seq_id[j]);
			boardService.ListDelete(seq_id[j]);
		}
		
		return "redirect:/photo_list.do?board_id=" + board_id;
		
	}*/
    
    //포토갤러리 리스트 삭제 - 실제로 업데이트로 'N'처리
    @RequestMapping(value = "/photoListDelete.do", method = RequestMethod.GET)
	public String photoListDelete(@RequestParam  Map<String, Object> paramMap, Board board, BoardFile boardFile, int[] seq_id, int board_id, HttpServletRequest request,  HttpSession ss) throws Exception {
    	
    	for (int j = 0; j < seq_id.length; j++) {
    		Object obj_id = ss.getAttribute("admin_id");
    		
			board.setUpdate_id(obj_id.toString());
			board.setSeq_id(seq_id[j]);
    		
    		boardService.BoardDelete(board);
    		
    		boardFile.setUpdate_id(obj_id.toString());
    		boardFile.setSeq_id(seq_id[j]);
    		boardFileService.fileDeleteBySeqid(boardFile);
    		
			
		}
		
		return "redirect:/photo_list.do?board_id=" + board_id;
		
	}
    
   /* //포토갤러리 게시물 삭제  - 2018-05-29 실제로 파일까지 지워지는 액션 -필요시 사용할 것
    @RequestMapping(value = "/photoBoardDelete.do", method = RequestMethod.GET)
	public String photoBoardDelete(@RequestParam Map<String, Object> paramMap, int seq_id, HttpServletRequest request) throws Exception {
    	
    	List<String> file_name = new ArrayList<String>(); 
//    	BoardFile boardFile = new BoardFile();
    	System.out.println("===========seq_id==============>" + paramMap.get("seq_id"));
    	System.out.println("===========board_id==============>" + paramMap.get("board_id"));
    	file_name = boardFileService.file_name(paramMap);
    	
    	
    	System.out.println("===========file_name===========>" + file_name);

    	String file_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/board/photo/";
    	for(String fnm:file_name) {
    		
  			File file = new File(file_path + attach_path + fnm);

    			System.out.println("=========포토갤러리 게시물 File path============>" + file);
  			
            if( file.exists() ){
                if(file.delete()){
                    System.out.println("파일삭제 성공");
                }else{
                    System.out.println("파일삭제 실패");
                }
            }else{
                System.out.println("파일이 존재하지 않습니다.");
            }
    	}

    		
    		boardFileService.fileDelete(Integer.parseInt((String)paramMap.get("seq_id")));
    		System.out.println("================파일삭제확인============" + paramMap.get("seq_id"));
    		boardService.BoardDelete(Integer.parseInt((String)paramMap.get("seq_id")));
    		System.out.println("--------------board_del = seq_id------>" + paramMap.get("seq_id"));
			
    		return "redirect:/photo_list.do?board_id=" + paramMap.get("board_id");
		
	}*/
    
    //포토갤러리 게시물 삭제  - 실제로 업데이트로 'N'처리
    @RequestMapping(value = "/photoBoardDelete.do", method = RequestMethod.GET)
	public String photoBoardDelete(@RequestParam Map<String, Object> paramMap, Board board, BoardFile boardFile, int[] seq_id, String[] file_key, HttpServletRequest request, HttpSession ss) throws Exception {
    
    	for(int i = 0; i < seq_id.length; i++) {
    		Object obj_id = ss.getAttribute("admin_id");
    		
			board.setUpdate_id(obj_id.toString());
			board.setSeq_id(seq_id[i]);
    		
    		boardService.BoardDelete(board);
    		
	    	boardFile.setSeq_id(seq_id[i]);
			boardFile.setUpdate_id(obj_id.toString());
		
			boardFileService.fileDeleteBySeqid(boardFile);
    	
    	}
			
    		return "redirect:/photo_list.do?board_id=" + paramMap.get("board_id");
		
	}
    /* ===================== 포토갤러리 Controller End========================= */
	
    
    
    
    
    /* ===================== 입찰안내 Controller Start======================= */
	    //board_id=4
	    //입찰안내 목록 
	    @RequestMapping(value="/bid_list.do")
	    public String bid_list(@RequestParam Map<String, Object> paramMap, Model model, Authority authority, int board_id, HttpSession session) {
	    	
	    	try {
	    		
	    		
	            Map<String, Object> paraAuth = new HashMap<String, Object>();
	            paraAuth.put("admin_id", session.getAttribute("admin_id"));
	            paraAuth.put("board_id", paramMap.get("board_id"));
	//            String.valueOf(paraAuth.get("board_id"));
	
	            String auth = authorityService.authority(paraAuth);
	    	
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
		        
		        model.addAttribute("auth", auth);
		        
		        //jsp 에서 보여줄 정보 추출
		        model.addAttribute("startPage", startPage+"");//현재 페이지      
		        model.addAttribute("totalCnt", totalCnt);//전체 게시물수
		        model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
		        model.addAttribute("board_list", boardService.getContentList(paramMap));
		        model.addAttribute("board_id", paramMap.get("board_id"));
		        model.addAttribute("sch_value", paramMap.get("sch_value"));
		        model.addAttribute("sch_type", paramMap.get("sch_type"));
		        model.addAttribute("ahority", authority.getBoard_id());
	 
	    	}catch(Exception e) {
	    		System.out.println("=========================> ERRRRRRRRRR ");
	    		e.printStackTrace();    		
	    	}
	    	
//	    	System.out.println("=========================> E....");
		      
	        return "board/bid_list";
	
	    }
	    
	 
	 
	    
	    //입찰안내 상세 보기
	    @RequestMapping("/bid_detail.do")
	    public String bid_detail(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
	    	 Map<String, Object> paraAuth = new HashMap<String, Object>();
	         paraAuth.put("admin_id", session.getAttribute("admin_id"));
	         paraAuth.put("board_id", paramMap.get("board_id"));
	//         String.valueOf(paraAuth.get("board_id"));
	
	        String auth = authorityService.authority(paraAuth);
	    	
	    	
	        model.addAttribute("file_list", boardFileService.getRead(paramMap));
	    	model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        model.addAttribute("auth", auth);

	        
	        return "board/bid_detail";
	
	    }
	 
	
	 
	    //입찰안내 작성폼
	    @RequestMapping(value="/bid_write.do", method=RequestMethod.GET)
	    public String bid_write(@RequestParam Map<String, Object> paramMap, HttpSession session, Model model){
	    	
	        
	   		Map<String, Object> paraAuth = new HashMap<String, Object>();
	        paraAuth.put("admin_id", session.getAttribute("admin_id"));
	        paraAuth.put("board_id", Integer.parseInt((String)paramMap.get("board_id")));
	        
	        System.out.println(" test ----" + paramMap.get("board_id"));
	
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        String auth = authorityService.authority(paraAuth);
	        String view_name = authorityService.auView_name(paraAuth);
	        
	        model.addAttribute("auth", auth);
	        model.addAttribute("view_name", view_name);
	        
	        if(!"1".equals(auth)) {
	
	        	
	        	return "redirect:/bid_list.do?board_id=" + (String)paramMap.get("board_id");
	        }else
	        
	        
	
	        	return "board/bid_write"; // write.jsp로 이동
	    }
	    
	    //입찰안내 작성액션
	    @RequestMapping(value="/bid_insert.do", method=RequestMethod.POST)
	    public String bid_insert(@ModelAttribute Board board, Fileup fileup, HttpServletRequest request, Model model) throws Exception{
  
	    	int b_seq = boardService.getBoardSeq();
	    	
	    	board.setSeq_id(b_seq);
	    	board.setTop_seq(b_seq);//답글 게시판일경우 최상위 게시물 번호
	    	board.setPre_seq(b_seq);//답글 게시판일경우 앞글 게시물 번호
	    	board.setStep(0); //답글 게시판일 경우 앞글의 Step + 1
	    	board.setUse_yn("Y");
	    	board.setPrivacy_no(0); //필요할때
	    	board.setUpdate_id(board.getAdmin_id());
	    	  /*부장님 end  */     	
	    	
	    	
	    	boardService.create(board);
	    	//int i = boardService.maxSelect(board.getBoard_id()); /*마지막 저장된 seq_id*/
	    	
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
						String attach_path = "resources/board/bid/";
						String file_name = multipartFile.getOriginalFilename();
						String file_name2 = time + "_" + UUID.randomUUID().toString() +"_" +file_name;
						
						File f = new File(file_path + attach_path + file_name2);
						System.out.println("===========입찰안내 파일업로드 실제 Path=========" + f);
						
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
	
	        
	        return "redirect:/bid_list.do?board_id=" + board.getBoard_id();
	    }
	    
	     /*입찰안내 다운로드 */
	    @RequestMapping("/bidFileDown.do")
	    private void bidFileDown(String file_name, HttpServletRequest request, HttpServletResponse response) throws Exception{
	    	request.setCharacterEncoding("UTF-8");
	    	
	    	String u = boardFileService.file_select(file_name);
	    	//파일 업로드된 경로
	    	System.out.println(file_name);
	    	
	    	try {
				 /*상대경로 */
	    		String file_path = request.getSession().getServletContext().getRealPath("/");
	    		String attach_path = "resources/board/bid/";
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
	    		
	
	    
	    
	  /*
	   * 
	   * //입찰안내 목록 삭제 - 2018-05-29 실제로 파일까지 지워지는 액션 -필요시 사용할 것
	    @RequestMapping(value = "/bidListDelete.do", method = RequestMethod.GET)
		public String bidListDelete(@RequestParam  Map<String, Object> paramMap, int[] seq_id, int board_id, HttpServletRequest request) throws Exception {
	    	
	    	List<String> file_name = new ArrayList<String>(); 
	    	String file_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "resources/board/bid/";
			
			for (int j = 0; j < seq_id.length; j++) {
				
	//			BoardFile boardFile = new BoardFile();
				file_name = boardFileService.list_file_name(seq_id[j]);
				System.out.println("=============seq_id3==========" + seq_id[j]);
				System.out.println("=============file_name==========" + file_name);
				
	
				
				for(String fnm:file_name) {
					File file = new File(file_path + attach_path + fnm);
					System.out.println("=========입찰안내 File Path=========>" + file);
					
					if( file.exists() ){
						if(file.delete()){
							System.out.println("파일삭제 성공");
						}else{
							System.out.println("파일삭제 실패");
						}
					}else{
						System.out.println("파일이 존재하지 않습니다.");
					}
					
				}
				
				boardFileService.fileDelete(seq_id[j]);
				boardService.ListDelete(seq_id[j]);
				
				
			}
			
			return "redirect:/bid_list.do?board_id=" + board_id;
			
			
		}*/
	    
	  //입찰안내 목록 삭제 - 실제로 업데이트로 'N'처리
	    @RequestMapping(value = "/bidListDelete.do", method = RequestMethod.GET)
		public String bidListDelete(@RequestParam  Map<String, Object> paramMap, Board board, BoardFile boardFile, int[] seq_id, int board_id, HttpServletRequest request,  HttpSession ss) throws Exception {
	    
	    	for (int j = 0; j < seq_id.length; j++) {
	    		Object obj_id = ss.getAttribute("admin_id");
	    		
				board.setUpdate_id(obj_id.toString());
				board.setSeq_id(seq_id[j]);
	    		
	    		boardService.BoardDelete(board);
	    		
	    		boardFile.setUpdate_id(obj_id.toString());
	    		boardFile.setSeq_id(seq_id[j]);
	    		boardFileService.fileDeleteBySeqid(boardFile);
	    		
				
			}
			
			return "redirect:/bid_list.do?board_id=" + board_id;
			
			
		}
	    
	    /*
	     * 
	     * //입찰안내 상세보기 삭제 - 2018-05-29 실제로 파일까지 지워지는 액션 -필요시 사용할 것 
	    @RequestMapping(value = "/bidBoardDelete.do", method = RequestMethod.GET)
		public String bidBoardDelete(@RequestParam Map<String, Object> paramMap, int seq_id, HttpServletRequest request) throws Exception {
	    	
	    	List<String> file_name = new ArrayList<String>(); 
	//    	BoardFile boardFile = new BoardFile();
	    	System.out.println("===========seq_id==============>" + paramMap.get("seq_id"));
	    	System.out.println("===========board_id==============>" + paramMap.get("board_id"));
	    	file_name = boardFileService.file_name(paramMap);
	    	
	    	
	    	System.out.println("===========file_name===========>" + file_name);
	
	    	String file_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "resources/board/bid/";
	    	for(String fnm:file_name) {
	    		
	//  			File file = new File("resources/board/" + fnm);
	  			File file = new File(file_path + attach_path + fnm);
	
	    			System.out.println("=========입찰안내 게시물 파일삭제 path============>" + file);
	  			
	            if( file.exists() ){
	                if(file.delete()){
	                    System.out.println("파일삭제 성공");
	                }else{
	                    System.out.println("파일삭제 실패");
	                }
	            }else{
	                System.out.println("파일이 존재하지 않습니다.");
	            }
	    	}
	
	    		boardFileService.fileDelete(Integer.parseInt((String)paramMap.get("seq_id")));
	    		System.out.println("================파일삭제확인============" + paramMap.get("seq_id"));
				boardService.BoardDelete(Integer.parseInt((String)paramMap.get("seq_id")));
				System.out.println("--------------board_del = seq_id------>" + paramMap.get("seq_id"));
			
			return "redirect:/bid_list.do?board_id=" + paramMap.get("board_id");
			
		}*/
	    
	    
	  //입찰안내 상세보기 삭제 - 실제로 업데이트로 'N'처리
	    
	    @RequestMapping(value = "/bidBoardDelete.do", method = RequestMethod.GET)
		public String bidBoardDelete(@RequestParam Map<String, Object> paramMap, Board board, BoardFile boardFile, int[] seq_id, String[] file_key, HttpServletRequest request, HttpSession ss) throws Exception {
	    	
	    	for(int i = 0; i < seq_id.length; i++) {
	    		Object obj_id = ss.getAttribute("admin_id");
	    		
				board.setUpdate_id(obj_id.toString());
				board.setSeq_id(seq_id[i]);
	    		
	    		boardService.BoardDelete(board);
	    		
		    	boardFile.setSeq_id(seq_id[i]);
				boardFile.setUpdate_id(obj_id.toString());
			
				boardFileService.fileDeleteBySeqid(boardFile);
	    	
	    	}
			
			return "redirect:/bid_list.do?board_id=" + paramMap.get("board_id");
			
		}
	    
	    
	    //입찰안내 수정폼
	    @RequestMapping("/bidBoardUpdateForm.do")
	    public String bidBoardUpdateForm(@RequestParam Map<String, Object> paramMap, Model model) {
	    	
	    	model.addAttribute("file_list", boardFileService.getRead(paramMap));
	    	model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        
	        return "board/bid_update";
	
	    }
	    
	    //입찰안내 수정 액션
	    @SuppressWarnings("unchecked")
		@RequestMapping(value = "/bidBoardUpdate.do", method = RequestMethod.POST)
	   	public String bidBoardUpdate(@RequestParam Map<String, Object> paramMap, @ModelAttribute Board board, BoardFile boardFile,  Fileup fileup, HttpServletRequest request, Model model, String[] file_key, String[] flag, String[] fName, HttpSession ss) {
	    		
		    	Object obj_id = ss.getAttribute("admin_id");
	    		board.setUpdate_id(obj_id.toString());
	    		boardService.updateAllBoard(board);
	    		
	       		boardFile.setSeq_id(board.getSeq_id());
	            boardFile.setBoard_id(board.getBoard_id());
	            boardFile.setAdmin_id(obj_id.toString());
	            boardFile.setUpdate_id(obj_id.toString());
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
	    					String attach_path = "resources/board/bid/";
	    					String file_name = multipartFile.getOriginalFilename();
	    					String file_name2 = time+ "_" + UUID.randomUUID().toString() +"_" +file_name;
	    					
	    					File f = new File(file_path + attach_path +file_name2);
	    					System.out.println("=========입찰 안내 path=====" + f);
	    					
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
	    		if(file_key != null) {
	        		
	        		for(int i=0; i<file_key.length ; i++) {
	        			
	        			System.out.println("===========fileKey==============>" + file_key[i]);
	        			System.out.println("===========flag==============>" + flag[i]);
	            		System.out.println("===========fName==============>" + fName[i]);

	            		//flag가 D인건 삭제. 데이터도 삭제, 파일도 삭제.
	        			if("D".equals(flag[i])) {
	        				boardFile.setFile_key(Integer.parseInt(file_key[i]));
	        				boardFile.setUpdate_id(obj_id.toString());
	        				
	        				boardFileService.fileDeleteByBoardFile(boardFile);
	    					System.out.println("======================== fileKey 값 : " + boardFileService.fileDeleteByBoardFile(boardFile));
	    						
	        			}
	        		}
	        		}
	    		
	    		return "redirect:/bid_list.do?board_id=" + board.getBoard_id();
	
	   	}
	    /* ===================== 입찰안내 Controller End======================= */
	    
	    
	    
	    
	    
	    /* ===================== 문의하기 Controller Start======================= */
	    //board_id=5
	    
	    //문의하기 리스트 조회
	    @RequestMapping(value="/inquiry_list.do")
	    public String inquiry_list(@RequestParam Map<String, Object> paramMap, Model model, Authority authority, int board_id, HttpSession session) {
	    	
	    	try {
	    		
	    		Map<String, Object> paraAuth = new HashMap<String, Object>();
	            paraAuth.put("admin_id", session.getAttribute("admin_id"));
	            paraAuth.put("board_id", paramMap.get("board_id"));
	     
	            String auth = authorityService.authority(paraAuth);
	            
	    	
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
		        
		        model.addAttribute("auth", auth);
		        
		        //jsp 에서 보여줄 정보 추출
		        model.addAttribute("startPage", startPage+"");//현재 페이지      
		        model.addAttribute("totalCnt", totalCnt);//전체 게시물수
		        model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
		        model.addAttribute("inquiry_list", boardService.inquiryRead(paramMap));
		        model.addAttribute("board_id", paramMap.get("board_id"));
		        model.addAttribute("sch_value", paramMap.get("sch_value"));
		        model.addAttribute("sch_type", paramMap.get("sch_type"));
		        model.addAttribute("ahority", authority.getBoard_id());
		        
		        /*권수
		        model.addAttribute("allCount", boardService.getallCount(paramMap));
		        */
	 
	    	}catch(Exception e) {
	    		System.out.println("=========================> ERRRRRRRRRR ");
	    		e.printStackTrace();    		
	    	}
	    	
//	    	System.out.println("=========================> E....");
		      
	        return "board/inquiry_list";

	    }

	    //문의하기 상세 보기
	    @RequestMapping("/inquiry_detail.do")
	    public String inquiry_detail(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
	    	
	    	Map<String, Object> paraAuth = new HashMap<String, Object>();
	        paraAuth.put("admin_id", session.getAttribute("admin_id"));
	        paraAuth.put("board_id", paramMap.get("board_id"));
	 
	        String auth = authorityService.authority(paraAuth);
	    	
	        model.addAttribute("file_list", boardFileService.getRead(paramMap));
	        model.addAttribute("useyn", boardService.getInquiryByUseYN(paramMap));
	    	model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id")))); //기존 원글에대한 seq_id가져오는 곳 2018-10-04 박권수
	    	model.addAttribute("board_detail2", boardService.getInquiryDetail(paramMap));										//원글+답글까지 뿌려지기위한 리스트로 가져오는 곳 2018-10-04 박권수
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        model.addAttribute("auth", auth);
	        
	       // System.out.println("여기까지44----------------  : " +  paramMap);
	        
	        
	        
	        
	        return "board/inquiry_detail";

	    }
	 

	 
	    //문의하기 작성화면
	    @RequestMapping(value="/inquiry_write.do", method=RequestMethod.GET)
	    public String inquiry_write(@RequestParam Map<String, Object> paramMap, HttpSession session, Model model){
	    	
	    	
	    	// --------롤 접근 권한
	        Map<String, Object> paraAuth = new HashMap<String, Object>();
	        paraAuth.put("admin_id", session.getAttribute("admin_id"));
	        paraAuth.put("board_id", Integer.parseInt((String)paramMap.get("board_id")));
	 
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        String auth = authorityService.authority(paraAuth);
	        String view_name = authorityService.auView_name(paraAuth);
	        
//	        System.out.println("????????????????????????" + view_name);
	        
	        model.addAttribute("auth", auth);
	        model.addAttribute("view_name", view_name);
	        
	        
	    	if(!"R".equals(paramMap.get("flag"))) {
	    		
	    		paramMap.put("flag", "O");
	    		paramMap.put("top_seq", "0");
	    		paramMap.put("step", "0");
	    		paramMap.put("seq_id", "0");
	    		
	    		
	    	}
	    	
	    	model.addAttribute("inquiry_re", paramMap);  
//	    	System.out.println("--------------> 들어오는 값 " + paramMap);
	    	
	        
	        return "board/inquiry_write"; // write.jsp로 이동
	    }
	    
	    //문의하기 작성액션
	    @RequestMapping(value="/inquiry_insert.do", method=RequestMethod.POST)
	    public String inquiry_insert(@ModelAttribute Privacy privacy, Board board, Inquiry inquiry, Fileup fileup, HttpServletRequest request, Model model, String flag) throws Exception{
	    	

	    	int b_seq = boardService.getBoardSeq();
	    	
	    	
	    	Board vBoard = board;

	    	

	    	if(!"R".equals(flag)) { //일반
	    		vBoard.setSeq_id(b_seq);
	    		vBoard.setTop_seq(b_seq);//답글 게시판일경우 최상위 게시물 번호
	    		vBoard.setPre_seq(b_seq);//답글 게시판일경우 앞글 게시물 번호
	    		vBoard.setStep(0); 
	    		vBoard.setUse_yn("Y");
	        	
	    		vBoard.setUpdate_id(board.getAdmin_id());
	    	}else { //답글
	    		
	    		vBoard.setPrivacy_no(privacy.getPrivacy_no());
	    		vBoard.setSeq_id(b_seq);
	    		vBoard.setTop_seq(board.getTop_seq());//답글 게시판일경우 최상위 게시물 번호
	    		vBoard.setPre_seq(b_seq);//답글 게시판일경우 앞글 게시물 번호
	    		vBoard.setStep(1); //답글 게시판일 경우 앞글의 Step + 1
	    		vBoard.setUse_yn("Y");
	        	
	    		vBoard.setUpdate_id(board.getAdmin_id());    		
	    	}
	    	
	    	/*  부장님 end  */
	    	
	    	boardService.create(vBoard);

	    	inquiry.setSeq_id(board.getSeq_id());
	        inquiry.setBoard_id(board.getBoard_id());
	        inquiry.setUse_yn("Y");
	        
	        boardService.inquiryInsert(inquiry);
	    	
	    	
	    	
	    	
	        board = boardService.read(vBoard.getSeq_id());
	        BoardFile boardFile = new BoardFile();
	        boardFile.setBoard_id(vBoard.getBoard_id());
	        boardFile.setSeq_id(vBoard.getSeq_id());
	        boardFile.setAdmin_id(vBoard.getAdmin_id());
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
						String attach_path = "resources/board/admininquiry/";
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
	        
	        
	        
	        return "redirect:/inquiry_detail.do?board_id=" + vBoard.getBoard_id() + "&seq_id=" + vBoard.getTop_seq();
	    }
	    
	    /* 문의하기 다운로드 */
	    @RequestMapping("/inquiryFileDown.do")
	    private void inquiryFileDown(String file_name, HttpServletRequest request, HttpServletResponse response) throws Exception{
	    	request.setCharacterEncoding("UTF-8");
	    	
	    	String u = boardFileService.file_select(file_name);
	    	
	    	//파일 업로드된 경로
	    	System.out.println(file_name);
	    	
	    	try {
				/* 상대경로 */
	    		String file_path = request.getSession().getServletContext().getRealPath("/");
	    		String attach_path = "resources/board/admininquiry/";
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
	    		

	     
/*	    //문의하기 게시글 확인
	    @RequestMapping(value="/inquiry_check.do", method=RequestMethod.POST)
	    @ResponseBody
	    public Object boardCheck(@RequestParam Map<String, Object> paramMap) {
	 
	        //리턴값
	        Map<String, Object> retVal = new HashMap<String, Object>();
	 
	        //패스워드 암호화
	        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
	        String password = encoder.encodePassword(paramMap.get("password").toString(), null);
	        paramMap.put("password", password);
	 
	        //정보입력
	        int result = boardService.getBoardCheck(paramMap);
	 
	        if(result>0){
	            retVal.put("code", "OK");
	        }else{
	            retVal.put("code", "FAIL");
	            retVal.put("message", "패스워드를 확인해주세요.");
	        }
	 
	        return retVal;
	 
	    }*/
	 
	    
	    
	    //문의하기 관리자 페이지 리스트 삭제
	    @RequestMapping(value = "/inquiryListDelete.do", method = RequestMethod.GET)
		public String inquiryListDelete(@RequestParam  Map<String, Object> paramMap, Board board, BoardFile boardFile, int[] seq_id, int board_id, HttpServletRequest request,  HttpSession ss) throws Exception {
	    	
	    	for (int j = 0; j < seq_id.length; j++) {
				Object obj_id = ss.getAttribute("admin_id");
				boardFile.setUpdate_id(obj_id.toString());
				boardFile.setSeq_id(seq_id[j]);
				boardFileService.inqiryFileDeleteBySeqid(boardFile);

				board.setUpdate_id(obj_id.toString());
				board.setSeq_id(seq_id[j]);
				boardService.inquiryListDelete(board); //2018-10-25 박권수 관리자페이지에서 체크 된 항목들 삭제 | 테이블 명: board_tb --> use_yn='n' 처리
				
				boardService.adminDeleteInquiry(board); //2018-10-25 박권수 관리자페이지에서 체크 된 항목들 삭제 | 테이블 명: inquiry_tb --> use_yn='n' 처리
				
			}

			return "redirect:/inquiry_list.do?board_id=5";
			
		}

	    
	    //문의하기 게시물 삭제 
	    @RequestMapping(value = "/inquiryBoardDelete.do", method = RequestMethod.GET)
		public String inquiryBoardDelete(@RequestParam Map<String, Object> paramMap, Board board, BoardFile boardFile,int[] seq_id, String[] file_key, HttpServletRequest request, HttpSession ss) throws Exception {
	    	
	    	
	    	for(int i = 0; i < seq_id.length; i++) {
	    		Object obj_id = ss.getAttribute("admin_id");
	    		
				board.setUpdate_id(obj_id.toString());
				board.setSeq_id(seq_id[i]);
	    		
	    		boardService.BoardDelete(board);
	    		boardService.userDeleteInquiry(seq_id[i]);
	    		
		    	boardFile.setSeq_id(seq_id[i]);
				boardFile.setUpdate_id(obj_id.toString());
			
				boardFileService.fileDeleteBySeqid(boardFile);
	    	
	    	}
	    	
	    	
	    	paramMap.get("useyn");
	    	
	    	if(paramMap.get("useyn").equals("Y")) {
	    		return "redirect:/inquiry_detail.do?board_id=5&seq_id="+board.getTop_seq();
	    	}else { 
	    		return "redirect:/inquiry_list.do?board_id=5";
	    	}
			
			
		}
	    
	    //문의하기 수정 폼 이동
	    @RequestMapping(value = "/inquiryBoardUpdateForm.do")
		public String inquiryBoardUpdateForm(@RequestParam Map<String, Object> paramMap, Model model) {

			
	    	model.addAttribute("file_list", boardFileService.getRead(paramMap));
	    	model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
	        model.addAttribute("board_id", paramMap.get("board_id"));
	    		
	    		return "board/inquiry_update";

			
		}
	    
	    //문의하기 게시물 수정 액션 컨트롤러
	    @SuppressWarnings("unchecked")
	    @RequestMapping(value = "/inquiryBoardUpdate.do", method = RequestMethod.POST)
	   	public String inquiryBoardUpdate(@RequestParam Map<String, Object> paramMap, @ModelAttribute Board board,  Fileup fileup, HttpServletRequest request, Model model, String[] file_key, String[] flag, String[] fName, HttpSession ss) {
	    		
	    		Object obj = ss.getAttribute("admin_id");
	    		 
	    		board.setUpdate_id(obj.toString());
	    		
	    		
	       		boardService.updateBoard(board);
	       		BoardFile boardFile = new BoardFile();
	       		
	       		boardFile.setSeq_id(board.getSeq_id());
	       		boardFile.setBoard_id(board.getBoard_id());
	            boardFile.setAdmin_id(obj.toString());
	            boardFile.setUpdate_id(obj.toString());
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
	    					String attach_path = "resources/board/admininquiry/";
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
	    		if(file_key != null) {
	        		
	        		for(int i=0; i<file_key.length ; i++) {
	        			
	        			System.out.println("===========fileKey==============>" + file_key[i]);
	        			System.out.println("===========flag==============>" + flag[i]);
	            		System.out.println("===========fName==============>" + fName[i]);

	            		//flag가 D인건 삭제. 데이터도 삭제, 파일도 삭제.
	        			if("D".equals(flag[i])) {
	        				boardFile.setFile_key(Integer.parseInt(file_key[i]));
	        				boardFile.setUpdate_id(obj.toString());
	        				
	        				boardFileService.fileDeleteByBoardFile(boardFile);
	    					System.out.println("======================== fileKey 값 : " + boardFileService.fileDeleteByBoardFile(boardFile));
	    						
	        			}
	        		}
	        		}
	       		
	       		return "redirect:/inquiry_detail.do?board_id=5&seq_id=" + board.getTop_seq();
	       		/*return "redirect:/inquiry-body.do?seq_id=" + board.getSeq_id();*/

	   		
	   	}
	    /* ===================== 문의하기 Controller End========================= */
	    
	    
	    
	    /* ===================== 분실물센터 Controller Start========================= */
	    //board_id=6
	    
	    // 분실물센터 작성 화면
	    @RequestMapping(value="/lost_write.do", method=RequestMethod.GET)
	    public String lost_write(@RequestParam Map<String, Object> paramMap, HttpSession session, Model model){
	    	
	    	Map<String, Object> paraAuth = new HashMap<String, Object>();
	        paraAuth.put("admin_id", session.getAttribute("admin_id"));
	        paraAuth.put("board_id", Integer.parseInt((String)paramMap.get("board_id")));
	        
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        String auth = authorityService.authority(paraAuth);
	        String view_name = authorityService.auView_name(paraAuth);
	        
	        model.addAttribute("auth", auth);
	        model.addAttribute("view_name", view_name);
	        
	        if(!"1".equals(auth)) {
	        	return "redirect:/lost_list.do?board_id=" + (String)paramMap.get("board_id");
	        }else
	        	return "board/lost_write"; // write.jsp로 이동
	    }
	    
	    // 분실물센터 작성 액션
	    @RequestMapping(value="/lost_insert.do", method=RequestMethod.POST)
	    public String lost_insert(@ModelAttribute  Board board, Lost lost, Fileup fileup, HttpServletRequest request, Model model) throws Exception{
    	  /*부장님 start*/  
    	int b_seq = boardService.getBoardSeq();
    	
    	board.setSeq_id(b_seq);
    	board.setTop_seq(b_seq);//답글 게시판일경우 최상위 게시물 번호
    	board.setPre_seq(b_seq);//답글 게시판일경우 앞글 게시물 번호
    	board.setStep(0); //답글 게시판일 경우 앞글의 Step + 1
    	board.setUse_yn("Y");
    	board.setPrivacy_no(0); //필요할때
    	board.setUpdate_id(board.getAdmin_id());
    	  /*부장님 end  */  	
	  	
	  	boardService.lostInsertContent(board);   
	  	
	  	board = boardService.read(board.getSeq_id());  
	  	lost.setSeq_id(board.getTop_seq());
	  	lost.setBoard_id(board.getBoard_id());
	  	lost.setTitle(board.getTitle());
	  	lost.setUse_yn("Y");
	  	
	  	boardService.lostCreate(lost);   
	  	
	  	
	  	board = boardService.read(board.getSeq_id());
        BoardFile boardFile = new BoardFile();
        boardFile.setBoard_id(board.getBoard_id());
        boardFile.setSeq_id(board.getSeq_id());
        boardFile.setAdmin_id(board.getAdmin_id());
        boardFile.setUpdate_id(board.getAdmin_id());
        boardFile.setUse_yn("Y");
	      
	      /*파일*/
	      	Calendar cal = Calendar.getInstance();
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
	        String time = dateFormat.format(cal.getTime());
	      	
			List<MultipartFile> files = fileup.getUploadfile();
			System.out.println("File ----->" + files);
			//List<String> fileNames = new ArrayList<String>();
			if (null != files && files.size() > 0) {
				
				for (MultipartFile multipartFile : files) {
					if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
					
						System.out.println("file = " + multipartFile.getOriginalFilename() + "/" + multipartFile.getSize());
					/*	 상대경로*/ 
						String file_path = request.getSession().getServletContext().getRealPath("/");
						String attach_path = "resources/board/lost/";
						String file_name = multipartFile.getOriginalFilename();
						String file_name2 = time + "_" + UUID.randomUUID().toString() +"_" +file_name;
						
						File f = new File(file_path + attach_path + file_name2);
						System.out.println("===========분실물안내 파일업로드 실제 Path=========" + f);
						
						try {
							multipartFile.transferTo(f);
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
						//fileNames.add(file_name);
						
						boardFile.setFile_name(file_name);
						boardFile.setFile_name2(file_name2);
						boardFile.setFile_path("/" + attach_path);
						/*boardFile.setFile_path(file_path);*/
						
				         /*파일명에서 확장자 추출 */
						String filename = boardFile.getFile_name();
						int fileLen = filename.length();
						int lastDot = filename.lastIndexOf('.');
						String fileExt = filename.substring(lastDot, fileLen).toLowerCase();
						boardFile.setExtention_name(fileExt);
						
						System.out.println("확장명 : " + fileExt);
						
						 try {
							 	//썸네일생성
					            //썸네일 가로사이즈
					            int thumbnail_width = 1000;
					            //썸네일 세로사이즈
					            int thumbnail_height = 1000;
					            //원본이미지파일의 경로+파일명
					            File origin_file_name = new File(file_path + attach_path + file_name2);
					            //생성할 썸네일파일의 경로+썸네일파일명
					            File thumb_file_name = new File(file_path + attach_path + file_name2);
					 

					            
					            BufferedImage buffer_original_image = ImageIO.read(origin_file_name);
					            BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height, BufferedImage.TYPE_3BYTE_BGR);
					            Graphics2D graphic = buffer_thumbnail_image.createGraphics();
					            graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);
					            ImageIO.write(buffer_thumbnail_image, "jpg", thumb_file_name);
					           
					           //원본사이즈 교체
					           //가로사이즈
					            int thumbnail_width2 = 300;
					            //썸네일 세로사이즈
					            int thumbnail_height2 = 300;
					            //원본이미지파일의 경로+파일명
					            File origin_file_name2 = new File(file_path + attach_path + file_name2);
					            //생성할 썸네일파일의 경로+썸네일파일명
					            File thumb_file_name2 = new File(file_path + attach_path + "thumb/thumb_" + file_name2);
					 

					            
					            BufferedImage buffer_original_image2 = ImageIO.read(origin_file_name2);
					            BufferedImage buffer_thumbnail_image2 = new BufferedImage(thumbnail_width2, thumbnail_height2, BufferedImage.TYPE_3BYTE_BGR);
					            Graphics2D graphic2 = buffer_thumbnail_image2.createGraphics();
					            graphic2.drawImage(buffer_original_image2, 0, 0, thumbnail_width2, thumbnail_height2, null);
					            ImageIO.write(buffer_thumbnail_image2, "jpg", thumb_file_name2);
					            
					        } catch (Exception e) {
					            e.printStackTrace();
					        }
						
						
						try { 
							
							boardFileService.insert(boardFile);
							
							
							
						} catch (Exception e) {
							model.addAttribute("msg", "다시 입력하세요.");
						}
					}
				}
			}
	        return "redirect:/lost_list.do?board_id=" + board.getBoard_id();
	    }
	    
	    
	    //분실물 수정폼
	    @RequestMapping("/lostBoardUpdateForm.do")
	    public String lostBoardUpdateForm(@RequestParam Map<String, Object> paramMap, Model model) {
	    	

	    	model.addAttribute("file_list", boardFileService.getRead(paramMap));
	    	model.addAttribute("board_detail", boardService.lostContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        

	        return "board/lost_update";

	    }
	    
	    
	    //분실물 수정 액션 컨트롤러
		@SuppressWarnings("unchecked")
	    @RequestMapping(value = "/lostBoardUpdate.do", method = RequestMethod.POST)
	   	public String lostBoardUpdate(@RequestParam Map<String, Object> paramMap, @ModelAttribute Board board, BoardFile boardFile, Fileup fileup, HttpServletRequest request, Model model, String[] file_key, String[] flag, String[] fName,HttpSession ss) {
	   		
    		Object obj = ss.getAttribute("admin_id");
			
    		board.setUpdate_id(obj.toString());
			boardService.updateLostBoard(board);
			
			boardFile.setSeq_id(board.getSeq_id());
            boardFile.setBoard_id(board.getBoard_id());
            boardFile.setAdmin_id(obj.toString());
            boardFile.setUpdate_id(obj.toString());
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
						String attach_path = "resources/board/lost/";
						String file_name = multipartFile.getOriginalFilename();
    					String file_name2 = time+ "_" + UUID.randomUUID().toString() +"_" +file_name;
    					
    					File f = new File(file_path + attach_path +file_name2);
    					System.out.println("=========실제 경로 path=====" + f);
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
							 	//썸네일생성
					            //썸네일 가로사이즈
					            int thumbnail_width = 1000;
					            //썸네일 세로사이즈
					            int thumbnail_height = 1000;
					            //원본이미지파일의 경로+파일명
					            File origin_file_name = new File(file_path + attach_path + file_name2);
					            //생성할 썸네일파일의 경로+썸네일파일명
					            File thumb_file_name = new File(file_path + attach_path + file_name2);
					 

					            
					            BufferedImage buffer_original_image = ImageIO.read(origin_file_name);
					            BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height, BufferedImage.TYPE_3BYTE_BGR);
					            Graphics2D graphic = buffer_thumbnail_image.createGraphics();
					            graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);
					            ImageIO.write(buffer_thumbnail_image, "jpg", thumb_file_name);
					           
					           //원본사이즈 교체
					           //가로사이즈
					            int thumbnail_width2 = 300;
					            //썸네일 세로사이즈
					            int thumbnail_height2 = 300;
					            //원본이미지파일의 경로+파일명
					            File origin_file_name2 = new File(file_path + attach_path + file_name2);
					            //생성할 썸네일파일의 경로+썸네일파일명
					            File thumb_file_name2 = new File(file_path + attach_path + "thumb/thumb_" + file_name2);
					 

					            
					            BufferedImage buffer_original_image2 = ImageIO.read(origin_file_name2);
					            BufferedImage buffer_thumbnail_image2 = new BufferedImage(thumbnail_width2, thumbnail_height2, BufferedImage.TYPE_3BYTE_BGR);
					            Graphics2D graphic2 = buffer_thumbnail_image2.createGraphics();
					            graphic2.drawImage(buffer_original_image2, 0, 0, thumbnail_width2, thumbnail_height2, null);
					            ImageIO.write(buffer_thumbnail_image2, "jpg", thumb_file_name2);
					        } catch (Exception e) {
					            e.printStackTrace();
					        }
						 
						 //-----------------------
						
						
						try { 
							
							boardFileService.insert(boardFile);
						} catch (Exception e) {
							model.addAttribute("msg", "다시 입력하세요.");
						}
					}
				}
			}
			if(file_key != null) {
			
			for(int i=0; i<file_key.length ; i++) {
				
				System.out.println("===========fileKey==============>" + file_key[i]);
				System.out.println("===========flag==============>" + flag[i]);
	    		System.out.println("===========fName==============>" + fName[i]);

	    		//flag가 D인건 삭제. 데이터도 삭제, 파일도 삭제.
				if("D".equals(flag[i])) {
					
					boardFile.setFile_key(Integer.parseInt(file_key[i]));
    				boardFile.setUpdate_id(obj.toString());
    				
    				boardFileService.fileDeleteByBoardFile(boardFile);
					System.out.println("======================== fileKey 값 : " + boardFileService.fileDeleteByBoardFile(boardFile));
						
				}
			}
			}
			
			
			
			
	       		
	       		return "redirect:/lost_list.do?board_id=" + board.getBoard_id();

	   		
	   	}
		
		
	    
	    
	    //분실물센터 목록 리스트
	    @RequestMapping(value="/lost_list.do")
	    public String lost_list(@RequestParam Map<String, Object> paramMap, Model model, Authority authority, int board_id, HttpSession session) {
	    	
	    	try {
	    			    		
	            Map<String, Object> paraAuth = new HashMap<String, Object>();
	            paraAuth.put("admin_id", session.getAttribute("admin_id"));
	            paraAuth.put("board_id", paramMap.get("board_id"));

	            String auth = authorityService.authority(paraAuth);
	    	
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
		        
		        model.addAttribute("auth", auth);
		        
		        //jsp 에서 보여줄 정보 추출
		        model.addAttribute("startPage", startPage+"");//현재 페이지      
		        model.addAttribute("totalCnt", totalCnt);//전체 게시물수
		        model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
		        model.addAttribute("board_list", boardService.getContentList(paramMap));
		        model.addAttribute("file_name", paramMap.get("file_name"));	        
		        model.addAttribute("board_id", paramMap.get("board_id"));
		        model.addAttribute("sch_value", paramMap.get("sch_value"));
		        model.addAttribute("sch_type", paramMap.get("sch_type"));
		        model.addAttribute("ahority", authority.getBoard_id());
		        
	    	}catch(Exception e) {

	    		e.printStackTrace();    		
	    	}
	    	

		      
	        return "board/lost_list";

	    }	
	    
	  //분실물센터 상세 보기
	    @RequestMapping("/lost_detail.do")
	    public String lost_detail(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
	    	
	    	Map<String, Object> paraAuth = new HashMap<String, Object>();
	        paraAuth.put("admin_id", session.getAttribute("admin_id"));
	        paraAuth.put("board_id", paramMap.get("board_id"));
	 
	        String auth = authorityService.authority(paraAuth);
	    	

	        model.addAttribute("file_list", boardFileService.getRead(paramMap));
	    	model.addAttribute("board_detail", boardService.lostContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        model.addAttribute("auth", auth);

	        
	        return "board/lost_detail";

	    }
	    
	    /*분실물 다운로드 */
	    @RequestMapping("/lostFileDown.do")
	    private void lostFileDown(String file_name, HttpServletRequest request, HttpServletResponse response) throws Exception{
	    	request.setCharacterEncoding("UTF-8");
	    	
	    	String u = boardFileService.file_select(file_name);
	    	//파일 업로드된 경로
	    	System.out.println(file_name);
	    	
	    	try {
				 /*상대경로 */
	    		String file_path = request.getSession().getServletContext().getRealPath("/");
	    		String attach_path = "resources/board/lost/";
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
	    
	   /* 
	    * 
	    * //분실물안내 리스트 삭제 - 삭제 2018-05-29 실제로 파일까지 지워지는 액션 -필요시 사용할 것
	    @RequestMapping(value = "/lostListDelete.do", method = RequestMethod.GET)
		public String lostListDelete(@RequestParam int[] seq_id, int board_id, HttpServletRequest request) throws Exception {
	    	
	    	List<String> file_name = new ArrayList<String>(); 
	    	String file_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "resources/board/lost/";
			
			for (int j = 0; j < seq_id.length; j++) {
//				BoardFile boardFile = new BoardFile();
				file_name = boardFileService.list_file_name(seq_id[j]);
				System.out.println("=============seq_id3==========" + seq_id[j]);
				System.out.println("=============file_name==========" + file_name);
				
				for(String fnm:file_name) {
					File file = new File(file_path + attach_path + fnm);
					System.out.println("=========분실물센터 리스트 삭제 File path=========>" + file);
					if( file.exists() ){
						if(file.delete()){
							System.out.println("파일삭제 성공");
						}else{
							System.out.println("파일삭제 실패");
						}
					}else{
						System.out.println("파일이 존재하지 않습니다.");
					}
					
				}
				
				boardFileService.fileDelete(seq_id[j]);
				boardService.lostDelete(seq_id[j]);
				boardService.ListDelete(seq_id[j]);
				
				
				
			}
			return "redirect:/lost_list.do?board_id=" + board_id;
			
		}*/
	    
	    //분실물안내 리스트 삭제 -  실제로 업데이트로 'N'처리
	    @RequestMapping(value = "/lostListDelete.do", method = RequestMethod.GET)
		public String lostListDelete(@RequestParam  Map<String, Object> paramMap, Board board, BoardFile boardFile, Lost lost, int[] seq_id, int board_id, HttpServletRequest request,  HttpSession ss) throws Exception {
	    	
	    	for (int j = 0; j < seq_id.length; j++) {
	    		Object obj_id = ss.getAttribute("admin_id");
	    		
				board.setUpdate_id(obj_id.toString());
				board.setSeq_id(seq_id[j]);
	    		
	    		boardService.BoardDelete(board);
	    		
	    		boardFile.setUpdate_id(obj_id.toString());
	    		boardFile.setSeq_id(seq_id[j]);
	    		boardFileService.fileDeleteBySeqid(boardFile);
	    		
	    		boardService.lostDelete(seq_id[j]);
	    		
				
			}
			return "redirect:/lost_list.do?board_id=" + board_id;
			
		}
	    	
	 /* 
	  * 
	  * //분실물안내 상세보기 삭제 - 2018-05-29 실제로 파일까지 지워지는 액션 -필요시 사용할 것
	    @RequestMapping(value = "/lostBoardDelete.do", method = RequestMethod.GET)
		public String lostBoardDelete(@RequestParam Map<String, Object> paramMap, int seq_id, HttpServletRequest request) throws Exception {
	    	
	    	List<String> file_name = new ArrayList<String>(); 
//	    	BoardFile boardFile = new BoardFile();
	    	System.out.println("===========seq_id==============>" + paramMap.get("seq_id"));
	    	System.out.println("===========board_id==============>" + paramMap.get("board_id"));
	    	file_name = boardFileService.file_name(paramMap);
	    	
	    	
	    	System.out.println("===========file_name===========>" + file_name);
	    	
	    	String file_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "resources/board/lost/";
			for(String fnm:file_name) {
	    		
	  			File file = new File(file_path + attach_path + fnm);

	    			System.out.println("=========분실물센터 게시물 삭제 File path============>" + file);
	  			
	            if( file.exists() ){
	                if(file.delete()){
	                    System.out.println("파일삭제 성공");
	                }else{
	                    System.out.println("파일삭제 실패");
	                }
	            }else{
	                System.out.println("파일이 존재하지 않습니다.");
	            }
	    	}

				boardFileService.fileDelete(Integer.parseInt((String)paramMap.get("seq_id")));
				System.out.println("================파일삭제확인============" + paramMap.get("seq_id"));
				boardService.lostDelete(Integer.parseInt((String)paramMap.get("seq_id")));
				System.out.println("================분실물_tb 삭제 확인============" + paramMap.get("seq_id"));
				boardService.BoardDelete(Integer.parseInt((String)paramMap.get("seq_id")));
				System.out.println("--------------board_del = seq_id------>" + paramMap.get("seq_id"));

				
			return "redirect:/lost_list.do?board_id=" + paramMap.get("board_id");
			
		}*/
	    
	    //분실물 안내 상세보기 삭제 - 실제로 업데이트로 'N'처리 
	    @RequestMapping(value = "/lostBoardDelete.do", method = RequestMethod.GET)
		public String lostBoardDelete(@RequestParam Map<String, Object> paramMap, Board board, BoardFile boardFile, Lost lost, int[] seq_id, String[] file_key, HttpServletRequest request, HttpSession ss) throws Exception {
	    	for(int i = 0; i < seq_id.length; i++) {
	    		Object obj_id = ss.getAttribute("admin_id");
	    		
				board.setUpdate_id(obj_id.toString());
				board.setSeq_id(seq_id[i]);
	    		
	    		boardService.BoardDelete(board);
	    		
		    	boardFile.setSeq_id(seq_id[i]);
				boardFile.setUpdate_id(obj_id.toString());
			
				boardFileService.fileDeleteBySeqid(boardFile);
				
				boardService.lostDelete(seq_id[i]);
	    	
	    	}
			return "redirect:/lost_list.do?board_id=" + paramMap.get("board_id");
			
		}
	    /* ===================== 분실물센터 Controller End=========================== */
    
	    
	    /* ===================== 자료실 Controller Start======================= */
	    //board_id=9
	    
	    //자료실 목록 
	    @RequestMapping(value="/data_list.do")
	    public String data_list(@RequestParam Map<String, Object> paramMap, Model model, Authority authority, int board_id, HttpSession session) {
	    	
	    	try {
	    			    			    		
	            Map<String, Object> paraAuth = new HashMap<String, Object>();
	            paraAuth.put("admin_id", session.getAttribute("admin_id"));
	            paraAuth.put("board_id", paramMap.get("board_id"));

	            String auth = authorityService.authority(paraAuth);

	    	
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
		        
		        model.addAttribute("auth", auth);
		        
		        //jsp 에서 보여줄 정보 추출
		        model.addAttribute("startPage", startPage+"");//현재 페이지      
		        model.addAttribute("totalCnt", totalCnt);//전체 게시물수
		        model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
		        model.addAttribute("board_list", boardService.getContentList(paramMap));
		        model.addAttribute("board_id", paramMap.get("board_id"));
		        model.addAttribute("sch_value", paramMap.get("sch_value"));
		        model.addAttribute("sch_type", paramMap.get("sch_type"));
		        model.addAttribute("ahority", authority.getBoard_id());
		        
	    	}catch(Exception e) {
	    		System.out.println("=========================> ERRRRRRRRRR ");
	    		e.printStackTrace();    		
	    	}
	    	
//	    	System.out.println("=========================> E....");
		      
	        return "board/data_list";

	    }
	    
	    //자료실 상세 보기
	    @RequestMapping("/data_detail.do")
	    public String data_detail(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
	    	 Map<String, Object> paraAuth = new HashMap<String, Object>();
	         paraAuth.put("admin_id", session.getAttribute("admin_id"));
	         paraAuth.put("board_id", paramMap.get("board_id"));

	        String auth = authorityService.authority(paraAuth);
	    	
	    	
	        model.addAttribute("file_list", boardFileService.getRead(paramMap));
	    	model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        model.addAttribute("auth", auth);
	        

	        return "board/data_detail";

	    }
	 

	 
	    //자료실 작성폼
	    @RequestMapping(value="/data_write.do", method=RequestMethod.GET)
	    public String data_write(@RequestParam Map<String, Object> paramMap, HttpSession session, Model model){
	    	
	        
	   		Map<String, Object> paraAuth = new HashMap<String, Object>();
	        paraAuth.put("admin_id", session.getAttribute("admin_id"));
	        paraAuth.put("board_id", Integer.parseInt((String)paramMap.get("board_id")));
	        
	        
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        String auth = authorityService.authority(paraAuth);
	        String view_name = authorityService.auView_name(paraAuth);
	        
//	        System.out.println("????????????????????????" + view_name);
	        
	        
	        model.addAttribute("auth", auth);
	        model.addAttribute("view_name", view_name);      
	        
	        if(!"1".equals(auth)) {

	        	return "redirect:/data_list.do?board_id=" + (String)paramMap.get("board_id");
	        }else
	        	
	        	return "board/data_write"; // write.jsp로 이동
	    }
	    
	    //자료실 작성액션
	    @RequestMapping(value="/data_insert.do", method=RequestMethod.POST)
	    public String data_insert(@ModelAttribute Board board, Fileup fileup, HttpServletRequest request, Model model) throws Exception{

	    	int b_seq = boardService.getBoardSeq();
	    	
	    	board.setSeq_id(b_seq);
	    	board.setTop_seq(b_seq);//답글 게시판일경우 최상위 게시물 번호
	    	board.setPre_seq(b_seq);//답글 게시판일경우 앞글 게시물 번호
	    	board.setStep(0); //답글 게시판일 경우 앞글의 Step + 1
	    	board.setUse_yn("Y");
	    	board.setPrivacy_no(0); //필요할때
	    	board.setUpdate_id(board.getAdmin_id());
	    	  /*부장님 end  */ 	
	    	
	    	
	    	boardService.create(board);
	    	//int i = boardService.maxSelect(board.getBoard_id()); /*마지막 저장된 seq_id*/
	    	
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
			//List<String> fileNames = new ArrayList<String>();
			if (null != files && files.size() > 0) {
				
				for (MultipartFile multipartFile : files) {
					if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
					
						System.out.println("file = " + multipartFile.getOriginalFilename() + "/" + multipartFile.getSize());
					/*	 상대경로*/ 
						String file_path = request.getSession().getServletContext().getRealPath("/");
						String attach_path = "resources/board/data/";
						String file_name = multipartFile.getOriginalFilename();
						String file_name2 = time + "_" + UUID.randomUUID().toString() +"_" +file_name;
						
						File f = new File(file_path + attach_path + file_name2);
						
						System.out.println("===========자료실 파일업로드 실제 Path=========" + f);
						try {
							multipartFile.transferTo(f);
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
						
						//fileNames.add(file_name);
						
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

	        
	        return "redirect:/data_list.do?board_id=" + board.getBoard_id();
	    }
	    
	     /*자료실 다운로드 */
	    @RequestMapping("/dataFileDown.do")
	    private void dataFileDown(String file_name, HttpServletRequest request, HttpServletResponse response) throws Exception{
	    	request.setCharacterEncoding("UTF-8");
	    	
	    	String u = boardFileService.file_select(file_name);
	    	//파일 업로드된 경로
	    	System.out.println(file_name);
	    	
	    	try {
				 /*상대경로 */
	    		String file_path = request.getSession().getServletContext().getRealPath("/");
	    		String attach_path = "resources/board/data/";
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
	    		
	    //자료실 목록 삭제 - 실제로 업데이트로 'N'처리
	    @RequestMapping(value = "/dataListDelete.do", method = RequestMethod.GET)
		public String dataListDelete(@RequestParam  Map<String, Object> paramMap, Board board, BoardFile boardFile, int[] seq_id, int board_id, HttpServletRequest request,  HttpSession ss) throws Exception {
	    	
	    	for (int j = 0; j < seq_id.length; j++) {
	    		Object obj_id = ss.getAttribute("admin_id");
	    		
				board.setUpdate_id(obj_id.toString());
				board.setSeq_id(seq_id[j]);
	    		
	    		boardService.BoardDelete(board);
	    		
	    		boardFile.setUpdate_id(obj_id.toString());
	    		boardFile.setSeq_id(seq_id[j]);
	    		boardFileService.fileDeleteBySeqid(boardFile);
	    		
				
			}
			
			return "redirect:/data_list.do?board_id=" + board_id;
			
			
		}
	    
	    
	
	    
	    
	    //자료실 상세보기 삭제 
	    @RequestMapping(value = "/dataBoardDelete.do", method = RequestMethod.GET)
		public String dataBoardDelete(@RequestParam Map<String, Object> paramMap, Board board, BoardFile boardFile, int[] seq_id, String[] file_key, HttpServletRequest request, HttpSession ss) throws Exception {

	    	for(int i = 0; i < seq_id.length; i++) {
	    		Object obj_id = ss.getAttribute("admin_id");
	    		
				board.setUpdate_id(obj_id.toString());
				board.setSeq_id(seq_id[i]);
	    		
	    		boardService.BoardDelete(board);
	    		
		    	boardFile.setSeq_id(seq_id[i]);
				boardFile.setUpdate_id(obj_id.toString());
			
				boardFileService.fileDeleteBySeqid(boardFile);
	    	
	    	}
			return "redirect:/data_list.do?board_id=" + paramMap.get("board_id");
			
		}
	    
	    
	    //자료실 수정폼
	    @RequestMapping("/dataBoardUpdateForm.do")
	    public String dataBoardUpdateForm(@RequestParam Map<String, Object> paramMap, Model model) {
	    	
	    	model.addAttribute("file_list", boardFileService.getRead(paramMap));
	    	model.addAttribute("board_detail", boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));
	        model.addAttribute("board_id", paramMap.get("board_id"));
	        
	        return "board/data_update";

	    }
	    
	 
	    
	    //자료실 수정 액션 - 실제 파일이 삭제안되고 use_yn = N처리
	    @SuppressWarnings("unchecked")
		@RequestMapping(value = "/dataBoardUpdate.do", method = RequestMethod.POST)
	   	public String dataBoardUpdate(@RequestParam Map<String, Object> paramMap, @ModelAttribute Board board, BoardFile boardFile,  Fileup fileup, HttpServletRequest request, Model model, String[] file_key, String[] flag, String[] fName,HttpSession ss) {
	    		
	    		
		    	Object obj_id = ss.getAttribute("admin_id");
	    		board.setUpdate_id(obj_id.toString());
	    		boardService.updateAllBoard(board);
	    		
	       		boardFile.setSeq_id(board.getSeq_id());
	            boardFile.setBoard_id(board.getBoard_id());
	            boardFile.setAdmin_id(obj_id.toString());
	            boardFile.setUpdate_id(obj_id.toString());
	            boardFile.setUse_yn("Y");
	            
	            
	            /*파일*/
	            Calendar cal = Calendar.getInstance()  ;
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
	            String time = dateFormat.format(cal.getTime());

	    		List<MultipartFile> files = fileup.getUploadfile();
	    		System.out.println("File ----->" + files);
	    		//List<String> fileNames = new ArrayList<String>();
	    		/*String y = "";*/
	    		if (null != files && files.size() > 0) {
	    			
	    			for (MultipartFile multipartFile : files) {
	    				if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
	    				
	    					System.out.println("file = " + multipartFile.getOriginalFilename() + "/" + multipartFile.getSize());
	    				/*	 상대경로*/ 
	    					String file_path = request.getSession().getServletContext().getRealPath("/");
	    					String attach_path = "resources/board/data/";
	    					String file_name = multipartFile.getOriginalFilename();
	    					/*String file_name2 = time + "_" +file_name;*/
	    					String file_name2 = time+ "_" + UUID.randomUUID().toString() +"_" +file_name;
	    					
	    					File f = new File(file_path + attach_path +file_name2);
	    					System.out.println("=========실제 경로 path=====" + f);
	    					
	    					try {
	    						multipartFile.transferTo(f);
	    					} catch (IllegalStateException e) {
	    						e.printStackTrace();
	    					} catch (IOException e) {
	    						e.printStackTrace();
	    					}
	    					//fileNames.add(file_name);
	    					/*y += file_name+""; // 다중 업로드시 구분을 위해 [  /   ] 추가해야함 2018.04.20
	*/    					
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
	    		if(file_key != null) {
	        		
	        		for(int i=0; i<file_key.length ; i++) {
	        			
	        			System.out.println("===========fileKey==============>" + file_key[i]);
	        			System.out.println("===========flag==============>" + flag[i]);
	            		System.out.println("===========fName==============>" + fName[i]);

	            		//flag가 D인건 삭제. 데이터도 삭제, 파일도 삭제.
	        			if("D".equals(flag[i])) {
	        				boardFile.setFile_key(Integer.parseInt(file_key[i]));
	        				boardFile.setUpdate_id(obj_id.toString());
	        				
	        				boardFileService.fileDeleteByBoardFile(boardFile);
	    					System.out.println("======================== fileKey 값 : " + boardFileService.fileDeleteByBoardFile(boardFile));
	    						
	        			}
	        		}
	        		}
	    		
	    		return "redirect:/data_list.do?board_id=" + board.getBoard_id();

	   	}
	    
	    /* ===================== 자료실 Controller End======================= */

	    
    
}

    


 
 

