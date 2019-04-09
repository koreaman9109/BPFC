package com.homepage.interlink.model;



public class BoardFile {

	private int file_key;
	private int board_id;
	private int seq_id;
	private String file_name;
	private String file_name2;
	private String extention_name;
	private String file_path;
	private String use_yn;
	private String admin_id;
	private String register_date;
	private String update_id;
	private String update_date;
	public int getFile_key() {
		return file_key;
	}
	public void setFile_key(int file_key) {
		this.file_key = file_key;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getSeq_id() {
		return seq_id;
	}
	public void setSeq_id(int seq_id) {
		this.seq_id = seq_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_name2() {
		return file_name2;
	}
	public void setFile_name2(String file_name2) {
		this.file_name2 = file_name2;
	}
	public String getExtention_name() {
		return extention_name;
	}
	public void setExtention_name(String extention_name) {
		this.extention_name = extention_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	public String getUpdate_id() {
		return update_id;
	}
	public void setUpdate_id(String update_id) {
		this.update_id = update_id;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	@Override
	public String toString() {
		return "BoardFile [file_key=" + file_key + ", board_id=" + board_id + ", seq_id=" + seq_id + ", file_name="
				+ file_name + ", file_name2=" + file_name2 + ", extention_name=" + extention_name + ", file_path="
				+ file_path + ", use_yn=" + use_yn + ", admin_id=" + admin_id + ", register_date=" + register_date
				+ ", update_id=" + update_id + ", update_date=" + update_date + "]";
	}
	
	
}
