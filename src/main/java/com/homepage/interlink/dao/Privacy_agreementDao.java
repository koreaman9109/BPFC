package com.homepage.interlink.dao;

import java.util.Map;

import com.homepage.interlink.model.Privacy_agreement;

public interface Privacy_agreementDao {
	Privacy_agreement last_select(Map<String, Object> paramMap);
}
