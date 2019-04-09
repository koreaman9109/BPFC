package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.SMSDao;
import com.homepage.interlink.model.SMS_td;
import com.homepage.interlink.model.Surem_admin;
import com.homepage.interlink.model.Surem_result;

@Service
public class SMSServiceImpl implements SMSService {
	
	@Autowired
	private SMSDao sms;

	@Override
	public Surem_admin surem_admin_select(Map<String, Object> paramMap) {
		return sms.surem_admin_select(paramMap);
	}

	@Override
	public int sms_td_insert(SMS_td sms_td) {
		return sms.sms_td_insert(sms_td);
	}

	@Override
	public List<SMS_td> sms_select_all(Map<String, Object> paramMap) {
		return sms.sms_select_all(paramMap);
	}

	@Override
	public int sms_select_no(Map<String, Object> paramMap) {
		return sms.sms_select_no(paramMap);
	}

	@Override
	public int sms_update(SMS_td sms_td) {
		return sms.sms_update(sms_td);
	}

	@Override
	public int surem_result_insert(Surem_result surem_result) {
		return sms.surem_result_insert(surem_result);
	}

	@Override
	public List<Surem_result> surem_result_select_num(Map<String, Object> paramMap) {
		return sms.surem_result_select_num(paramMap);
	}

	@Override
	public List<SMS_td> sms_select_adminid(String admin_id) {
		return sms.sms_select_adminid(admin_id);
	}

}
