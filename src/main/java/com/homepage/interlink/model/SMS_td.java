package com.homepage.interlink.model;

public class SMS_td {
	private int sms_no;
	private String messages;
	private String user_name;
	private String tell;
	private String send_date;
	private String admin_id;
	private int all_no;
	private String division;
	private String send_result;
	private String etc;
	private String result;
	private String error;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getSend_result() {
		return send_result;
	}

	public void setSend_result(String send_result) {
		this.send_result = send_result;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public int getSms_no() {
		return sms_no;
	}

	public void setSms_no(int sms_no) {
		this.sms_no = sms_no;
	}

	public String getMessages() {
		return messages;
	}

	public void setMessages(String messages) {
		this.messages = messages;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getTell() {
		return tell;
	}

	public void setTell(String tell) {
		this.tell = tell;
	}

	public String getSend_date() {
		return send_date;
	}

	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public int getAll_no() {
		return all_no;
	}

	public void setAll_no(int all_no) {
		this.all_no = all_no;
	}

	@Override
	public String toString() {
		return "SMS_td [sms_no=" + sms_no + ", messages=" + messages + ", user_name=" + user_name + ", tell=" + tell
				+ ", send_date=" + send_date + ", admin_id=" + admin_id + ", all_no=" + all_no + ", division="
				+ division + ", send_result=" + send_result + ", etc=" + etc + ", result=" + result + ", error=" + error
				+ "]";
	}

}
