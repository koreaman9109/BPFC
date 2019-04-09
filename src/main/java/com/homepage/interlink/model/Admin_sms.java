package com.homepage.interlink.model;

public class Admin_sms {
	private int no;
	private String phone1;
	private String phone2;
	private String phone3;
	private String USE_YN;
	private String date;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getUSE_YN() {
		return USE_YN;
	}

	public void setUSE_YN(String uSE_YN) {
		USE_YN = uSE_YN;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Admin_sms [phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", USE_YN=" + USE_YN
				+ ", date=" + date + "]";
	}

}
