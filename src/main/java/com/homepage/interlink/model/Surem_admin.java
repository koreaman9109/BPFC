package com.homepage.interlink.model;

public class Surem_admin {

	private int no;
	private String usercode;
	private String deptcode;
	private String tell;
	private String reserved_time;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUsercode() {
		return usercode;
	}

	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}

	public String getDeptcode() {
		return deptcode;
	}

	public void setDeptcode(String deptcode) {
		this.deptcode = deptcode;
	}

	public String getTell() {
		return tell;
	}

	public void setTell(String tell) {
		this.tell = tell;
	}

	public String getReserved_time() {
		return reserved_time;
	}

	public void setReserved_time(String reserved_time) {
		this.reserved_time = reserved_time;
	}

	@Override
	public String toString() {
		return "Surem_admin [no=" + no + ", usercode=" + usercode + ", deptcode=" + deptcode + ", tell=" + tell
				+ ", reserved_time=" + reserved_time + "]";
	}

}
