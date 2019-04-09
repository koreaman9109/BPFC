package com.homepage.interlink.model;

public class Banner {
	private int banner_no;
	private String banner_filename;
	private String banner_extentionname;
	private String banner_path;
	private String USE_YN;
	private String banner_ex;
	private String admin_id;
	private String register_date;
	private String update_id;
	private String update_date;
	private String banner_url;
	private String banner_last_date;
	private String banner_start_date;

	public String getBanner_start_date() {
		return banner_start_date;
	}

	public void setBanner_start_date(String banner_start_date) {
		this.banner_start_date = banner_start_date;
	}

	public String getBanner_url() {
		return banner_url;
	}

	public void setBanner_url(String banner_url) {
		this.banner_url = banner_url;
	}

	public String getBanner_last_date() {
		return banner_last_date;
	}

	public void setBanner_last_date(String banner_last_date) {
		this.banner_last_date = banner_last_date;
	}

	public int getBanner_no() {
		return banner_no;
	}

	public void setBanner_no(int banner_no) {
		this.banner_no = banner_no;
	}

	public String getBanner_filename() {
		return banner_filename;
	}

	public void setBanner_filename(String banner_filename) {
		this.banner_filename = banner_filename;
	}

	public String getBanner_extentionname() {
		return banner_extentionname;
	}

	public void setBanner_extentionname(String banner_extentionname) {
		this.banner_extentionname = banner_extentionname;
	}

	public String getBanner_path() {
		return banner_path;
	}

	public void setBanner_path(String banner_path) {
		this.banner_path = banner_path;
	}

	public String getUSE_YN() {
		return USE_YN;
	}

	public void setUSE_YN(String uSE_YN) {
		USE_YN = uSE_YN;
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

	public String getBanner_ex() {
		return banner_ex;
	}

	public void setBanner_ex(String banner_ex) {
		this.banner_ex = banner_ex;
	}

	@Override
	public String toString() {
		return "Banner [banner_no=" + banner_no + ", banner_filename=" + banner_filename + ", banner_extentionname="
				+ banner_extentionname + ", banner_path=" + banner_path + ", USE_YN=" + USE_YN + ", banner_ex="
				+ banner_ex + ", admin_id=" + admin_id + ", register_date=" + register_date + ", update_id=" + update_id
				+ ", update_date=" + update_date + "]";
	}

}
