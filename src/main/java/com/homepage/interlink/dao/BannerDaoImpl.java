package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Banner;

@Repository
public class BannerDaoImpl implements BannerDao {

	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int insert(Banner banner) {
		return sst.insert("banners.insert", banner);
	}

	@Override
	public List<Banner> select(Map<String, Object> paramMap) {
		return sst.selectList("banners.select", paramMap);
	}

	@Override
	public Banner no_select(int banner_no) {
		return sst.selectOne("banners.no_select", banner_no);
	}

	@Override
	public int update(Banner banner) {
		return sst.update("banners.update", banner);
	}

	@Override
	public int delete(int banner_no) {
		return sst.delete("banners.delete", banner_no);
	}

	@Override
	public int selectContentCnt(Map<String, Object> paramMap) {
		return sst.selectOne("banners.selectContentCnt", paramMap);
	}

	@Override
	public List<Banner> main_select(Map<String, Object> paramMap) {
		return sst.selectList("banners.main_select", paramMap);
	}

	@Override
	public List<Banner> banner_no_select(Map<String, Object> paramMap) {
		return sst.selectList("banners.banner_no_select", paramMap);
	}

}
