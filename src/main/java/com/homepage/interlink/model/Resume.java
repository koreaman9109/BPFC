package com.homepage.interlink.model;

public class Resume {
	private int resume_no; // 이력서 순번
	private int all_no; // 채용게시판 순번
	private String resume_file; // 이력서파일
	private String resume_extension; // 이력서확장자
	private String resume_path; // 파일위치
	private String title; // 채용게시판 제목
	private String name; // 지원자명
	private int privacy_no; // 이증순번
	private String re_date; // 등록일자
	private String resume_file2;
	private String USE_YN;
	private String del_date;

	public String getDel_date() {
		return del_date;
	}

	public void setDel_date(String del_date) {
		this.del_date = del_date;
	}

	public String getUSE_YN() {
		return USE_YN;
	}

	public void setUSE_YN(String uSE_YN) {
		USE_YN = uSE_YN;
	}

	public int getAll_no() {
		return all_no;
	}

	public void setAll_no(int all_no) {
		this.all_no = all_no;
	}

	public int getResume_no() {
		return resume_no;
	}

	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}

	public String getResume_file() {
		return resume_file;
	}

	public void setResume_file(String resume_file) {
		this.resume_file = resume_file;
	}

	public String getResume_extension() {
		return resume_extension;
	}

	public void setResume_extension(String resume_extension) {
		this.resume_extension = resume_extension;
	}

	public String getResume_path() {
		return resume_path;
	}

	public void setResume_path(String resume_path) {
		this.resume_path = resume_path;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrivacy_no() {
		return privacy_no;
	}

	public void setPrivacy_no(int privacy_no) {
		this.privacy_no = privacy_no;
	}

	public String getRe_date() {
		return re_date;
	}

	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}

	public String getResume_file2() {
		return resume_file2;
	}

	public void setResume_file2(String resume_file2) {
		this.resume_file2 = resume_file2;
	}

	@Override
	public String toString() {
		return "Resume [resume_no=" + resume_no + ", all_no=" + all_no + ", resume_file=" + resume_file
				+ ", resume_extension=" + resume_extension + ", resume_path=" + resume_path + ", title=" + title
				+ ", name=" + name + ", privacy_no=" + privacy_no + ", re_date=" + re_date + ", resume_file2="
				+ resume_file2 + ", USE_YN=" + USE_YN + ", del_date=" + del_date + "]";
	}

}
