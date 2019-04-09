package com.homepage.interlink.model;

public class Authority {
	private int admin_num;    	//관리자seq
	private String admin_id;    //관리자ID
	private int board_id;	//게시판 ID
	private String authority;	//게시판 권한
	private int view_name;	//게시판 리스트에서 보여질 이름 1:실명 2:부서 3:별칭
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
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public int getView_name() {
		return view_name;
	}
	public void setView_name(int view_name) {
		this.view_name = view_name;
	}
	@Override
	public String toString() {
		return "Authority [admin_num=" + admin_num + ", admin_id=" + admin_id + ", board_id=" + board_id
				+ ", authority=" + authority + ", view_name=" + view_name + "]";
	}
	
	
	


	
	
	

}
