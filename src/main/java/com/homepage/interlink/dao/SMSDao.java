package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.SMS_td;
import com.homepage.interlink.model.Surem_admin;
import com.homepage.interlink.model.Surem_result;

public interface SMSDao {
	Surem_admin surem_admin_select(Map<String, Object> paramMap);
	int sms_td_insert(SMS_td sms_td);
	List<SMS_td> sms_select_all(Map<String, Object> paramMap);
	List<SMS_td> sms_select_adminid(String admin_id);
	int sms_select_no(Map<String, Object> paramMap);
	int sms_update(SMS_td sms_td);
	int surem_result_insert(Surem_result surem_result);
	List<Surem_result> surem_result_select_num(Map<String, Object> paramMap);
	
}
