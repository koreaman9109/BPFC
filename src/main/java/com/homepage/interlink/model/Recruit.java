package com.homepage.interlink.model;

public class Recruit {
	private int all_no;           // 맨앞 번호
	private String title;         /* 제목 */
	private String re_en;         /* 모집분야 */
	private String no;            /* 채용인원 */
	private String favorable;     /* 우대조건 */
	private String employment;    // 채용조건(신입=1,경력=2)
	private String cond;          /* 근무조건 */
	private String place;         /* 근무지 */
	private String salary;        /* 급여수준 */
	private String period;        /* 접수기간 */
	private String way;           /* 접수방법 */
	private String date;          /* 채용일자 */
	private String etc;           /* 기타 */
	private String file;          /* 첨부파일 */
	private String chec;          // 상태(모집중=1,마감=2)
	private String day;           // 작성일자
	private String check_no;      // 조회수
	private String file2;         //변경된 파일이름
	private String fileExt;       //확장자
	private String USE_YN;
	private String admin_id;      //사번
	private String view_name;     //뷰이름
	private String admin_name;    //실명
	private String update_date;
	private String update_id;

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

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getView_name() {
		return view_name;
	}

	public void setView_name(String view_name) {
		this.view_name = view_name;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getFileExt() {
		return fileExt;
	}

	public String getUSE_YN() {
		return USE_YN;
	}

	public void setUSE_YN(String uSE_YN) {
		USE_YN = uSE_YN;
	}

	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}

	public int getAll_no() {
		return all_no;
	}

	public void setAll_no(int all_no) {
		this.all_no = all_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}

	public String getRe_en() {
		return re_en;
	}

	public void setRe_en(String re_en) {
		this.re_en = re_en;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getFavorable() {
		return favorable;
	}

	public void setFavorable(String favorable) {
		this.favorable = favorable;
	}

	public String getEmployment() {
		return employment;
	}

	public void setEmployment(String employment) {
		this.employment = employment;
	}

	public String getCond() {
		return cond;
	}

	public void setCond(String cond) {
		this.cond = cond;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getWay() {
		return way;
	}

	public void setWay(String way) {
		this.way = way;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getChec() {
		return chec;
	}

	public void setChec(String chec) {
		this.chec = chec;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getCheck_no() {
		return check_no;
	}

	public void setCheck_no(String check_no) {
		this.check_no = check_no;
	}

	@Override
	public String toString() {
		return "Recruit [all_no=" + all_no + ", title=" + title + ", re_en=" + re_en + ", no=" + no + ", favorable="
				+ favorable + ", employment=" + employment + ", cond=" + cond + ", place=" + place + ", salary="
				+ salary + ", period=" + period + ", way=" + way + ", date=" + date + ", etc=" + etc + ", file=" + file
				+ ", chec=" + chec + ", day=" + day + ", check_no=" + check_no + ", file2=" + file2 + ", fileExt="
				+ fileExt + ", USE_YN=" + USE_YN + ", admin_id=" + admin_id + ", view_name=" + view_name
				+ ", admin_name=" + admin_name + ", update_date=" + update_date + ", update_id=" + update_id + "]";
	}

}