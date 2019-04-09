package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Admin_sms;
import com.homepage.interlink.model.Privacy;
import com.homepage.interlink.model.SMSSend;

public interface PrivacyDao {

	int insert (Privacy privacy);
	List<Privacy> select(Map<String, Object> paramMap);
	Privacy phone_select(String phone);
	int delete (int privacy_no);
	int smsinsert (SMSSend smssend);
	List<Object> sms_list(int all_no);
	
	int update(Admin_sms admin_sms);
	Admin_sms select1(int no);
	int insert1 (Admin_sms admin_sms);
	
	/*Map<String, Object>*/
	
}
