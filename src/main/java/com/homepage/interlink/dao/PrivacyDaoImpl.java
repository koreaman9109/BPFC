package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Admin_sms;
import com.homepage.interlink.model.Privacy;
import com.homepage.interlink.model.SMSSend;

@Repository
public class PrivacyDaoImpl implements PrivacyDao {

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Privacy privacy) {
		return sst.insert("privacys.insert", privacy);
	}

	@Override
	public List<Privacy> select(Map<String, Object> paramMap) {
		return sst.selectList("privacys.select", paramMap);
	}

	@Override
	public Privacy phone_select(String phone) {
		return sst.selectOne("privacys.phone_select", phone);
	}

	@Override
	public int delete(int privacy_no) {
		return sst.delete("privacys.delete", privacy_no);
	}

	@Override
	public int smsinsert(SMSSend smssend) {
		return sst.insert("smssends.smsinsert", smssend);
	}

	@Override
	public List<Object> sms_list(int all_no) {
		return sst.selectList("privacys.sms_list", all_no);
	}

	@Override
	public int update(Admin_sms admin_sms) {
		return sst.update("admin_smss.update", admin_sms);
	}

	@Override
	public Admin_sms select1(int no) {
		return sst.selectOne("admin_smss.select", no);
	}

	@Override
	public int insert1(Admin_sms admin_sms) {
		return sst.insert("admin_smss.insert", admin_sms);
	}
}
