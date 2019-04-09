package com.homepage.interlink.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.Privacy_agreementDao;
import com.homepage.interlink.model.Privacy_agreement;

@Service
public class Privacy_agreementServiceImpl implements Privacy_agreementService {

	@Autowired
	private Privacy_agreementDao pa;

	@Override
	public Privacy_agreement last_select(Map<String, Object> paramMap) {
		return pa.last_select(paramMap);
	}
}
