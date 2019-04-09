package com.homepage.interlink.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.homepage.interlink.model.Authority;
import com.homepage.interlink.service.AuthorityService;
import com.homepage.interlink.service.BoardFileService;
import com.homepage.interlink.service.BoardService;
import com.homepage.interlink.service.EtcService;

@Controller
public class EtcController {

	@Autowired
	BoardService boardService;
	@Autowired
	AuthorityService authorityService;
	@Autowired
	BoardFileService boardFileService;
	@Autowired
	EtcService etcService;

	/* ===================== 휴지통 Controller Start======================= */

	// 휴지통 목록
	@RequestMapping(value = "/del_list.do")
	public String del_list(@RequestParam Map<String, Object> paramMap, Model model, int board_id, Authority authority,
			HttpSession session) {

		try {

			/*
			 * Map<String, Object> paraAuth = new HashMap<String, Object>();
			 * paraAuth.put("admin_id", session.getAttribute("admin_id"));
			 * paraAuth.put("board_id", paramMap.get("board_id"));
			 * //String.valueOf(paraAuth.get("board_id"));
			 * 
			 * String auth = authorityService.authority(paraAuth);
			 */

			if (board_id == 7) {
				System.out.println("============board_id : " + board_id);
				/* 컨벤션 리스트 */

				// 조회 하려는 페이지
				int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage") != null
						? Integer.parseInt(paramMap.get("startPage").toString())
						: 1);
				// 한페이지에 보여줄 리스트 수
				int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages") != null
						? Integer.parseInt(paramMap.get("visiblePages").toString())
						: 10);
				// 일단 전체 건수를 가져온다.

				int totalCnt = etcService.selectDelConventionContentCnt(paramMap);

				BigDecimal decimal1 = new BigDecimal(totalCnt);
				BigDecimal decimal2 = new BigDecimal(visiblePages);
				BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);

				int startLimitPage = 0;
				if (startPage == 1) {
					startLimitPage = 0;
				} else {
					startLimitPage = (startPage - 1) * visiblePages;
				}

				paramMap.put("start", startLimitPage);
				paramMap.put("end", visiblePages);
				model.addAttribute("startPage", startPage + "");// 현재 페이지
				model.addAttribute("totalCnt", totalCnt);// 전체 게시물수
				model.addAttribute("totalPage", totalPage);// 페이지 네비게이션에 보여줄 리스트 수
				model.addAttribute("board_list", etcService.selectDelConventionContent(paramMap));

				model.addAttribute("board_id", paramMap.get("board_id"));
				model.addAttribute("sch_value", paramMap.get("sch_value"));
				model.addAttribute("sch_type", paramMap.get("sch_type"));
				model.addAttribute("ahority", authority.getBoard_id());

			   }else if (board_id == 8) {
			    System.out.println("============board_id : " + board_id);
				/* 채용 리스트 */

				// 조회 하려는 페이지
				int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage") != null
						? Integer.parseInt(paramMap.get("startPage").toString())
						: 1);
				// 한페이지에 보여줄 리스트 수
				int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages") != null
						? Integer.parseInt(paramMap.get("visiblePages").toString())
						: 10);
				// 일단 전체 건수를 가져온다.
				int totalCnt = etcService.selectDelRecruitContentCnt(paramMap);

				BigDecimal decimal1 = new BigDecimal(totalCnt);
				BigDecimal decimal2 = new BigDecimal(visiblePages);
				BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);

				int startLimitPage = 0;
				if (startPage == 1) {
					startLimitPage = 0;
				} else {
					startLimitPage = (startPage - 1) * visiblePages;
				}

				paramMap.put("start", startLimitPage);
				paramMap.put("end", visiblePages);
				model.addAttribute("startPage", startPage + "");// 현재 페이지
				model.addAttribute("totalCnt", totalCnt);// 전체 게시물수
				model.addAttribute("totalPage", totalPage);// 페이지 네비게이션에 보여줄 리스트 수

				model.addAttribute("board_list", etcService.selectDelRecruitContent(paramMap));
				model.addAttribute("board_id", paramMap.get("board_id"));
				model.addAttribute("sch_value", paramMap.get("sch_value"));
				model.addAttribute("sch_type", paramMap.get("sch_type"));
				model.addAttribute("ahority", authority.getBoard_id());

			} else {
				/* 게시판리스트 */
				System.out.println("============board_id : " + board_id);
				// 조회 하려는 페이지
				int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage") != null
						? Integer.parseInt(paramMap.get("startPage").toString())
						: 1);
				// 한페이지에 보여줄 리스트 수
				int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages") != null
						? Integer.parseInt(paramMap.get("visiblePages").toString())
						: 10);
				// 일단 전체 건수를 가져온다.
				int totalCnt = etcService.selectDelContentCnt(paramMap);
				BigDecimal decimal1 = new BigDecimal(totalCnt);
				BigDecimal decimal2 = new BigDecimal(visiblePages);
				BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);

				int startLimitPage = 0;
				if (startPage == 1) {
					startLimitPage = 0;
				} else {
					startLimitPage = (startPage - 1) * visiblePages;
				}

				// jsp 에서 보여줄 정보 추출
				paramMap.put("start", startLimitPage);
				paramMap.put("end", visiblePages);
				model.addAttribute("startPage", startPage + "");// 현재 페이지
				model.addAttribute("totalCnt", totalCnt);// 전체 게시물수
				model.addAttribute("totalPage", totalPage);// 페이지 네비게이션에 보여줄 리스트 수
				model.addAttribute("board_list", etcService.selectDelContent(paramMap));

				model.addAttribute("board_id", paramMap.get("board_id"));
				model.addAttribute("sch_value", paramMap.get("sch_value"));
				model.addAttribute("sch_type", paramMap.get("sch_type"));
				model.addAttribute("ahority", authority.getBoard_id());
			}

		} catch (Exception e) {
			System.out.println("=========================> ERRRRRRRRRR ");
			e.printStackTrace();
		}

		System.out.println("=========================> E....");

		return "etc/del_list";

	}

	// 휴지통 목록 삭제 실제로 파일까지 지워지는 액션 -필요시 사용할 것
	@RequestMapping(value = "/boardDelListDelete.do", method = RequestMethod.GET)
	public String boardDelListDelete(@RequestParam Map<String, Object> paramMap, int[] seq_id, int board_id,
			HttpServletRequest request) throws Exception {

		List<String> file_name = new ArrayList<String>();
		List<String> attach_path = new ArrayList<String>();
		String file_path = request.getSession().getServletContext().getRealPath("/");
		System.out.println("----------------------file_path============> " + file_path);

		for (int j = 0; j < seq_id.length; j++) {

			file_name = etcService.list_file_name(seq_id[j]);
			attach_path = etcService.list_file_path(seq_id[j]);

			System.out.println("----------------------file_name============> " + file_name);
			System.out.println("----------------------attach_path============> " + attach_path);

			for (String fnm : file_name) {
				for (String fnmm : attach_path) {
					File file = new File(file_path + fnmm + fnm);
					System.out.println("=========공지사항 File Path=========>" + file);

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

			}
			etcService.fileDeleteBySeq_id(seq_id[j]);
			etcService.lostDeleteBySeq_id(seq_id[j]);
			etcService.ListDeleteBySeq_id(seq_id[j]);

		}

		return "redirect:/del_list.do?board_id=" + board_id;

	}

	// 휴지통 목록 복구 - 업데이트로 'Y'처리
	@RequestMapping(value = "/boardDelListRestore.do", method = RequestMethod.GET)
	public String boardDelListRestore(@RequestParam Map<String, Object> paramMap, int board_id, int[] seq_id,
			HttpServletRequest request) throws Exception {

		for (int j = 0; j < seq_id.length; j++) {

			etcService.ListRestoreBySeq_id(seq_id[j]);
			System.out.println("========================>board" + etcService.ListRestoreBySeq_id(seq_id[j]));
			etcService.fileRestoreBySeq_id(seq_id[j]);
			System.out.println("========================>file" + etcService.fileRestoreBySeq_id(seq_id[j]));
			etcService.lostRestoreBySeq_id(seq_id[j]);

		}

		return "redirect:/del_list.do?board_id=" + board_id;

	}

	// 휴지통 상세 보기
	@RequestMapping("/del_detail.do")
	public String del_detail(@RequestParam Map<String, Object> paramMap, int board_id, Model model,
			HttpSession session) {

		model.addAttribute("board_id", paramMap.get("board_id"));
		model.addAttribute("file_list", etcService.getRead(paramMap));
		model.addAttribute("board_detail",
				boardService.getContentView(Integer.parseInt((String) paramMap.get("seq_id"))));

		return "etc/del_detail";

	}
	
	// 휴지통 다운로드
    @RequestMapping("/delFileDown.do")
    private void delFileDown(String file_name, int board_id, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	request.setCharacterEncoding("UTF-8");
    	
    	String u = boardFileService.file_select(file_name);
    	//파일 업로드된 경로
    	System.out.println(file_name);
    	
    	try {
			 /*상대경로 */
    		String file_path = request.getSession().getServletContext().getRealPath("/");
    		
    		if(board_id == 1) {
    		
    		//공지사항
    			
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
            
    		}else if(board_id == 2) {
    		
			//BPFC 소식지
			
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
            
			
			
    		}else if(board_id == 3) {
        		
    			//포토갤러리
    			
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
                
    			
    			
        		}else if(board_id == 4) {
            		
        			//입찰안내
        			
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
                    
        			
        			
            		}else if(board_id == 6) {
                		
            			//분실물안내
            			
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
                        
            			
            			
                		}else if(board_id == 9) {
                    		
                			//분실물안내
                			
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
                            
                			
                			
                    		}
    		
    		
    		
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }
        
    	
    }

	/* ===================== 휴지통 Controller End======================= */
}
