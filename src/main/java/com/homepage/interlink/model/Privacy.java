package com.homepage.interlink.model;

public class Privacy {
	private int privacy_no; // 인증순번
	private String privacy_name; // 고객명
	private String phone; // 전화번호
	private String division; // 수신동의(채용=1,문의=2,알림서비스=3)
	private String agreement_date; // 동의일

	public int getPrivacy_no() {
		return privacy_no;
	}

	public void setPrivacy_no(int privacy_no) {
		this.privacy_no = privacy_no;
	}

	public String getPrivacy_name() {
		return privacy_name;
	}

	public void setPrivacy_name(String privacy_name) {
		this.privacy_name = privacy_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getAgreement_date() {
		return agreement_date;
	}

	public void setAgreement_date(String agreement_date) {
		this.agreement_date = agreement_date;
	}

}
