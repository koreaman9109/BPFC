package com.homepage.interlink.model;



public class Inquiry {

	private int inquiry_id;    	//관리자seq
	private int seq_id;
	private int board_id; 
	private String user_name;
	private String password;
	private int inquiry_division;
	private String use_yn;
	public int getInquiry_id() {
		return inquiry_id;
	}
	public void setInquiry_id(int inquiry_id) {
		this.inquiry_id = inquiry_id;
	}
	public int getSeq_id() {
		return seq_id;
	}
	public void setSeq_id(int seq_id) {
		this.seq_id = seq_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getInquiry_division() {
		return inquiry_division;
	}
	public void setInquiry_division(int inquiry_division) {
		this.inquiry_division = inquiry_division;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	@Override
	public String toString() {
		return "Inquiry [inquiry_id=" + inquiry_id + ", seq_id=" + seq_id + ", board_id=" + board_id + ", user_name="
				+ user_name + ", password=" + password + ", inquiry_division=" + inquiry_division + ", use_yn=" + use_yn
				+ "]";
	}
	
	
	
	
	
	
}
