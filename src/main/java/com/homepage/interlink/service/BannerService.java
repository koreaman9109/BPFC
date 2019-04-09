package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Banner;

public interface BannerService {
	
	int insert(Banner banner);
	List<Banner> select(Map<String, Object> paramMap);
	List<Banner> main_select(Map<String, Object> paramMap);
	Banner no_select(int banner_no);
	int update(Banner banner);
	int delete(int banner_no);
	int selectContentCnt(Map<String, Object> paramMap);
	List<Banner> banner_no_select(Map<String, Object> paramMap);
	
}
