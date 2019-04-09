package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.BannerDao;
import com.homepage.interlink.model.Banner;

@Service
public class BannerServiceImpl implements BannerService {

	@Autowired
	private BannerDao bd;
	
	@Override
	public int insert(Banner banner) {
		return bd.insert(banner);
	}

	@Override
	public List<Banner> select(Map<String, Object> paramMap) {
		return bd.select(paramMap);
	}

	@Override
	public Banner no_select(int banner_no) {
		return bd.no_select(banner_no);
	}

	@Override
	public int update(Banner banner) {
		return bd.update(banner);
	}

	@Override
	public int delete(int banner_no) {
		return bd.delete(banner_no);
	}

	@Override
	public int selectContentCnt(Map<String, Object> paramMap) {
		return bd.selectContentCnt(paramMap);
	}

	@Override
	public List<Banner> main_select(Map<String, Object> paramMap) {
		return bd.main_select(paramMap);
	}

	@Override
	public List<Banner> banner_no_select(Map<String, Object> paramMap) {
		return bd.banner_no_select(paramMap);
	}

}
