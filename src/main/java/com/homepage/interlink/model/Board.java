package com.homepage.interlink.model;

public class Board {

	private int seq_id;
	private int board_id;
	private String title;
	private int hit;
	private int top_seq;
	private int pre_seq; //답글 게시판일경우 앞글 게시물 번호
	private int step;       //답글 게시판일 경우 앞글의 Step + 1
	private String content;
	private String admin_id;
	private String view_name;
	private String admin_rank;
	private String admin_name;
	private String admin_nickname;
	private String admin_department;
	private String admin_task;
	private String admin_email;
	private String register_date;
	private String update_id;
	private String update_date; 
	private String use_yn;
	private int Privacy_no; 
	private boolean enableAutoLogin;
	private int inquiry_id;
	private String user_name;
	private String user_name2;
	private String password;
	private String password2;
	private int inquiry_division;
	private String thumnail;
	private int num;
	
	private int lost_id;
	private String organization;
	private String learn;
	private String lost_date;
	private String lost_name;
	private String contact;
	private String storage_site;
	private String lost_status;
	
	//2018-10-04
	//수정자 : 박권수
	//내  용 : 문의사항 원글+답글 출력을 이유로 추가
	private String recnt;          //댓글갯수카운터 --->이걸로 답글상태확인
	private String extention_name; //파일확장자
	private String file_name2;     //파일이름 암호화
	private String file_name;      //파일이름 원본
	private String use_yn_file;    //파일테이블 use_yn
	
	//2018-10-26 
	//수정자 : 박권수
	//내   용 : list_thumbnail 추가
	private String list_thumnail;

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getTop_seq() {
		return top_seq;
	}

	public void setTop_seq(int top_seq) {
		this.top_seq = top_seq;
	}

	public int getPre_seq() {
		return pre_seq;
	}

	public void setPre_seq(int pre_seq) {
		this.pre_seq = pre_seq;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getAdmin_rank() {
		return admin_rank;
	}

	public void setAdmin_rank(String admin_rank) {
		this.admin_rank = admin_rank;
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

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public int getPrivacy_no() {
		return Privacy_no;
	}

	public void setPrivacy_no(int privacy_no) {
		Privacy_no = privacy_no;
	}

	public boolean isEnableAutoLogin() {
		return enableAutoLogin;
	}

	public void setEnableAutoLogin(boolean enableAutoLogin) {
		this.enableAutoLogin = enableAutoLogin;
	}

	public int getInquiry_id() {
		return inquiry_id;
	}

	public void setInquiry_id(int inquiry_id) {
		this.inquiry_id = inquiry_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_name2() {
		return user_name2;
	}

	public void setUser_name2(String user_name2) {
		this.user_name2 = user_name2;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public int getInquiry_division() {
		return inquiry_division;
	}

	public void setInquiry_division(int inquiry_division) {
		this.inquiry_division = inquiry_division;
	}

	public String getThumnail() {
		return thumnail;
	}

	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getLost_id() {
		return lost_id;
	}

	public void setLost_id(int lost_id) {
		this.lost_id = lost_id;
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

	public String getRecnt() {
		return recnt;
	}

	public void setRecnt(String recnt) {
		this.recnt = recnt;
	}

	public String getExtention_name() {
		return extention_name;
	}

	public void setExtention_name(String extention_name) {
		this.extention_name = extention_name;
	}

	public String getFile_name2() {
		return file_name2;
	}

	public void setFile_name2(String file_name2) {
		this.file_name2 = file_name2;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getUse_yn_file() {
		return use_yn_file;
	}

	public void setUse_yn_file(String use_yn_file) {
		this.use_yn_file = use_yn_file;
	}

	public String getList_thumnail() {
		return list_thumnail;
	}

	public void setList_thumnail(String list_thumnail) {
		this.list_thumnail = list_thumnail;
	}

	@Override
	public String toString() {
		return "Board [seq_id=" + seq_id + ", board_id=" + board_id + ", title=" + title + ", hit=" + hit + ", top_seq="
				+ top_seq + ", pre_seq=" + pre_seq + ", step=" + step + ", content=" + content + ", admin_id="
				+ admin_id + ", view_name=" + view_name + ", admin_rank=" + admin_rank + ", admin_name=" + admin_name
				+ ", admin_nickname=" + admin_nickname + ", admin_department=" + admin_department + ", admin_task="
				+ admin_task + ", admin_email=" + admin_email + ", register_date=" + register_date + ", update_id="
				+ update_id + ", update_date=" + update_date + ", use_yn=" + use_yn + ", Privacy_no=" + Privacy_no
				+ ", enableAutoLogin=" + enableAutoLogin + ", inquiry_id=" + inquiry_id + ", user_name=" + user_name
				+ ", user_name2=" + user_name2 + ", password=" + password + ", password2=" + password2
				+ ", inquiry_division=" + inquiry_division + ", thumnail=" + thumnail + ", num=" + num + ", lost_id="
				+ lost_id + ", organization=" + organization + ", learn=" + learn + ", lost_date=" + lost_date
				+ ", lost_name=" + lost_name + ", contact=" + contact + ", storage_site=" + storage_site
				+ ", lost_status=" + lost_status + ", recnt=" + recnt + ", extention_name=" + extention_name
				+ ", file_name2=" + file_name2 + ", file_name=" + file_name + ", use_yn_file=" + use_yn_file
				+ ", list_thumnail=" + list_thumnail + "]";
	}
	
	
		}
