package com.homepage.interlink.model;

public class Recruit_add {
	private int re_en_no;
	private String re_en; /* 모집분야 */
	private String favorable; /* 우대조건 */
	private String cond; /* 근무조건 */
	private String salary; /* 급여수준 */

	public int getRe_en_no() {
		return re_en_no;
	}

	public void setRe_en_no(int re_en_no) {
		this.re_en_no = re_en_no;
	}

	public String getRe_en() {
		return re_en;
	}

	public void setRe_en(String re_en) {
		this.re_en = re_en;
	}

	public String getFavorable() {
		return favorable;
	}

	public void setFavorable(String favorable) {
		this.favorable = favorable;
	}

	public String getCond() {
		return cond;
	}

	public void setCond(String cond) {
		this.cond = cond;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	@Override
	public String toString() {
		return "Recruit_add [re_en_no=" + re_en_no + ", re_en=" + re_en + ", favorable=" + favorable + ", cond=" + cond
				+ ", salary=" + salary + "]";
	}
	
}
