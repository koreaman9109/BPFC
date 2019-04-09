package com.homepage.interlink.model;

public class Member {
	private String bpfc_rank;
	private String bpfc_department;
	private String bpfc_name;
	private String bpfc_phone;
	private String bpfc_task;
	private String bpfc_task2;
	private String bpfc_no;
	public String getBpfc_rank() {
		return bpfc_rank;
	}
	public void setBpfc_rank(String bpfc_rank) {
		this.bpfc_rank = bpfc_rank;
	}
	public String getBpfc_department() {
		return bpfc_department;
	}
	public void setBpfc_department(String bpfc_department) {
		this.bpfc_department = bpfc_department;
	}
	public String getBpfc_name() {
		return bpfc_name;
	}
	public void setBpfc_name(String bpfc_name) {
		this.bpfc_name = bpfc_name;
	}
	public String getBpfc_phone() {
		return bpfc_phone;
	}
	public void setBpfc_phone(String bpfc_phone) {
		this.bpfc_phone = bpfc_phone;
	}
	public String getBpfc_task() {
		return bpfc_task;
	}
	public void setBpfc_task(String bpfc_task) {
		this.bpfc_task = bpfc_task;
	}
	public String getBpfc_task2() {
		return bpfc_task2;
	}
	public void setBpfc_task2(String bpfc_task2) {
		this.bpfc_task2 = bpfc_task2;
	}
	public String getBpfc_no() {
		return bpfc_no;
	}
	public void setBpfc_no(String bpfc_no) {
		this.bpfc_no = bpfc_no;
	}
	@Override
	public String toString() {
		return "Member [bpfc_rank=" + bpfc_rank + ", bpfc_department=" + bpfc_department + ", bpfc_name=" + bpfc_name
				+ ", bpfc_phone=" + bpfc_phone + ", bpfc_task=" + bpfc_task + ", bpfc_task2=" + bpfc_task2
				+ ", bpfc_no=" + bpfc_no + "]";
	}

	
}
