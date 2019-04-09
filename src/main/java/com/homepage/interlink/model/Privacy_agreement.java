package com.homepage.interlink.model;

public class Privacy_agreement {
	private int no;             //개인정보활용동의서순번
	private String agreement;   //동의서 내용
	private String date;        //등록일자

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getAgreement() {
		return agreement;
	}

	public void setAgreement(String agreement) {
		this.agreement = agreement;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
