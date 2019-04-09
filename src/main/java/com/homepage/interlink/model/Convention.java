package com.homepage.interlink.model;

public class Convention {
	private int con_no; // 컨벤션 이벤트 번호
	private String con_start_date; // 행사일
	private String con_end_date;
	private String con_time; // 행사시간
	private String event_name; // 행사명
	private String con_place; // 행사장소
	private String con_phone; // 담당자 번호
	private String con_division; // 행사 구분
	private String con_usage; // 용도
	private String con_paricipants; // 참가인원
	private String con_organizer; // 행사주관업체
	private String con_setting; // 세팅형태
	private String con_check; // 계약체결여부
	private String con_rent; // 임대료
	private String con_deposit; // 예치금
	private String con_paymentdate; // 납부일자
	private String con_payment; // 납부여부
	private String con_etc1; // 비고
	private String con_etc2; // 공실
	private String USE_YN;
	private String admin_id;
	private String admin_name;
	private String update_date;
	private String update_id;

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public String getUpdate_id() {
		return update_id;
	}

	public void setUpdate_id(String update_id) {
		this.update_id = update_id;
	}

	public String getUSE_YN() {
		return USE_YN;
	}

	public void setUSE_YN(String uSE_YN) {
		USE_YN = uSE_YN;
	}

	public int getCon_no() {
		return con_no;
	}

	public void setCon_no(int con_no) {
		this.con_no = con_no;
	}

	public String getCon_start_date() {
		return con_start_date;
	}

	public void setCon_start_date(String con_start_date) {
		this.con_start_date = con_start_date;
	}

	public String getCon_end_date() {
		return con_end_date;
	}

	public void setCon_end_date(String con_end_date) {
		this.con_end_date = con_end_date;
	}

	public String getCon_time() {
		return con_time;
	}

	public void setCon_time(String con_time) {
		this.con_time = con_time;
	}

	public String getEvent_name() {
		return event_name;
	}

	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}

	public String getCon_place() {
		return con_place;
	}

	public void setCon_place(String con_place) {
		this.con_place = con_place;
	}

	public String getCon_phone() {
		return con_phone;
	}

	public void setCon_phone(String con_phone) {
		this.con_phone = con_phone;
	}

	public String getCon_division() {
		return con_division;
	}

	public void setCon_division(String con_division) {
		this.con_division = con_division;
	}

	public String getCon_usage() {
		return con_usage;
	}

	public void setCon_usage(String con_usage) {
		this.con_usage = con_usage;
	}

	public String getCon_paricipants() {
		return con_paricipants;
	}

	public void setCon_paricipants(String con_paricipants) {
		this.con_paricipants = con_paricipants;
	}

	public String getCon_organizer() {
		return con_organizer;
	}

	public void setCon_organizer(String con_organizer) {
		this.con_organizer = con_organizer;
	}

	public String getCon_setting() {
		return con_setting;
	}

	@Override
	public String toString() {
		return "Convention [con_no=" + con_no + ", con_start_date=" + con_start_date + ", con_end_date=" + con_end_date
				+ ", con_time=" + con_time + ", event_name=" + event_name + ", con_place=" + con_place + ", con_phone="
				+ con_phone + ", con_division=" + con_division + ", con_usage=" + con_usage + ", con_paricipants="
				+ con_paricipants + ", con_organizer=" + con_organizer + ", con_setting=" + con_setting + ", con_check="
				+ con_check + ", con_rent=" + con_rent + ", con_deposit=" + con_deposit + ", con_paymentdate="
				+ con_paymentdate + ", con_payment=" + con_payment + ", con_etc1=" + con_etc1 + ", con_etc2=" + con_etc2
				+ ", USE_YN=" + USE_YN + ", admin_id=" + admin_id + ", admin_name=" + admin_name + ", update_date="
				+ update_date + ", update_id=" + update_id + "]";
	}

	public void setCon_setting(String con_setting) {
		this.con_setting = con_setting;
	}

	public String getCon_check() {
		return con_check;
	}

	public void setCon_check(String con_check) {
		this.con_check = con_check;
	}

	public String getCon_rent() {
		return con_rent;
	}

	public void setCon_rent(String con_rent) {
		this.con_rent = con_rent;
	}

	public String getCon_deposit() {
		return con_deposit;
	}

	public void setCon_deposit(String con_deposit) {
		this.con_deposit = con_deposit;
	}

	public String getCon_paymentdate() {
		return con_paymentdate;
	}

	public void setCon_paymentdate(String con_paymentdate) {
		this.con_paymentdate = con_paymentdate;
	}

	public String getCon_payment() {
		return con_payment;
	}

	public void setCon_payment(String con_payment) {
		this.con_payment = con_payment;
	}

	public String getCon_etc1() {
		return con_etc1;
	}

	public void setCon_etc1(String con_etc1) {
		this.con_etc1 = con_etc1;
	}

	public String getCon_etc2() {
		return con_etc2;
	}

	public void setCon_etc2(String con_etc2) {
		this.con_etc2 = con_etc2;
	}

}
