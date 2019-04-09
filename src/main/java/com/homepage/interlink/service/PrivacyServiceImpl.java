package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.PrivacyDao;
import com.homepage.interlink.model.Admin_sms;
import com.homepage.interlink.model.Privacy;
import com.homepage.interlink.model.SMSSend;

@Service
public class PrivacyServiceImpl implements PrivacyService {

	@Autowired
	private PrivacyDao py;

	@Override
	public int insert(Privacy privacy) {
		return py.insert(privacy);
	}

	@Override
	public List<Privacy> select(Map<String, Object> paramMap) {
		return py.select(paramMap);
	}

	@Override
	public Privacy phone_select(String phone) {
		return py.phone_select(phone);
	}

	@Override
	public int delete(int privacy_no) {
		return py.delete(privacy_no);
	}

	@Override
	public int smsinsert(SMSSend smssend) {
		return py.smsinsert(smssend);
	}

	@Override
	public List<Object> sms_list(int all_no) {
		return py.sms_list(all_no);
	}

	@Override
	public int update(Admin_sms admin_sms) {
		return py.update(admin_sms);
	}

	@Override
	public Admin_sms select1(int no) {
		return py.select1(no);
	}

	@Override
	public int insert1(Admin_sms admin_sms) {
		return py.insert1(admin_sms);
	}
}
