package com.homepage.interlink.model;



public class Admin {
    private int num;
	private int admin_num;    	    //관리자seq
	private String admin_id;    	//관리자id
	private String admin_passwd;	//관리자비밀번호
	private String admin_name;		//관리자이름
	private String admin_nickname;	//관리자닉네임
	private String admin_rank;		//관리자직급
	private String admin_department;//관리자업무부서
	private String admin_task;		//관리자업무
	private String admin_email;		//관리자이메일
	private String admin_field;		//관리자담당
	private String authority;		//권한설정
	private String register_date;	//관리자등록일자
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_passwd() {
		return admin_passwd;
	}
	public void setAdmin_passwd(String admin_passwd) {
		this.admin_passwd = admin_passwd;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_nickname() {
		return admin_nickname;
	}
	public void setAdmin_nickname(String admin_nickname) {
		this.admin_nickname = admin_nickname;
	}
	public String getAdmin_rank() {
		return admin_rank;
	}
	public void setAdmin_rank(String admin_rank) {
		this.admin_rank = admin_rank;
	}
	public String getAdmin_department() {
		return admin_department;
	}
	public void setAdmin_department(String admin_department) {
		this.admin_department = admin_department;
	}
	public String getAdmin_task() {
		return admin_task;
	}
	public void setAdmin_task(String admin_task) {
		this.admin_task = admin_task;
	}
	public String getAdmin_email() {
		return admin_email;
	}
	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}
	public String getAdmin_field() {
		return admin_field;
	}
	public void setAdmin_field(String admin_field) {
		this.admin_field = admin_field;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	@Override
	public String toString() {
		return "Admin [num=" + num + ", admin_num=" + admin_num + ", admin_id=" + admin_id + ", admin_passwd="
				+ admin_passwd + ", admin_name=" + admin_name + ", admin_nickname=" + admin_nickname + ", admin_rank="
				+ admin_rank + ", admin_department=" + admin_department + ", admin_task=" + admin_task
				+ ", admin_email=" + admin_email + ", admin_field=" + admin_field + ", authority=" + authority
				+ ", register_date=" + register_date + "]";
	}

	
	
}
