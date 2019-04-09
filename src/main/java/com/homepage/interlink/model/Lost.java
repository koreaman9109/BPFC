package com.homepage.interlink.model;

public class Lost {
	
	private int lost_id;
	private int seq_id;
	private int board_id;
	private String organization;
	private String learn;
	private String title;
	private String lost_date;
	private String lost_name;
	private String contact;
	private String storage_site;
	private String lost_status;
	private String use_yn;
	public int getLost_id() {
		return lost_id;
	}
	public void setLost_id(int lost_id) {
		this.lost_id = lost_id;
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
	public String getOrganization() {
		return organization;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}
	public String getLearn() {
		return learn;
	}
	public void setLearn(String learn) {
		this.learn = learn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLost_date() {
		return lost_date;
	}
	public void setLost_date(String lost_date) {
		this.lost_date = lost_date;
	}
	public String getLost_name() {
		return lost_name;
	}
	public void setLost_name(String lost_name) {
		this.lost_name = lost_name;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getStorage_site() {
		return storage_site;
	}
	public void setStorage_site(String storage_site) {
		this.storage_site = storage_site;
	}
	public String getLost_status() {
		return lost_status;
	}
	public void setLost_status(String lost_status) {
		this.lost_status = lost_status;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	@Override
	public String toString() {
		return "Lost [lost_id=" + lost_id + ", seq_id=" + seq_id + ", board_id=" + board_id + ", organization="
				+ organization + ", learn=" + learn + ", title=" + title + ", lost_date=" + lost_date + ", lost_name="
				+ lost_name + ", contact=" + contact + ", storage_site=" + storage_site + ", lost_status=" + lost_status
				+ ", use_yn=" + use_yn + "]";
	}
	
	
	
	
	
	
	

}
