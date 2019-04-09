package com.homepage.interlink.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Privacy_agreement;

@Repository
public class Privacy_agreementDaoImpl implements Privacy_agreementDao {

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Privacy_agreement last_select(Map<String, Object> paramMap) {
		return sst.selectOne("privacy_agreements.last_select", paramMap);
	}
	
}
