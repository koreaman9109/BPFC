package com.homepage.interlink.model;

public class SMSSend {
	private int SeqNo;
	private String InDate;
	private String InTime;
	private int Member;
	private String SendId;
	private String SendName;
	private String Rphone1;
	private String Rphone2;
	private String Rphone3;
	private String RecvName;
	private String Sphone1;
	private String Sphone2;
	private String Sphone3;
	private String Msg;
	private String Url;
	private String Rdate;
	private String Rtime;
	private String Result;
	private String Kind;
	private int ErrCode;
	private int Retry1;
	private int Retry2;
	private String LastTime;

	public int getSeqNo() {
		return SeqNo;
	}

	public String getInDate() {
		return InDate;
	}

	public void setInDate(String inDate) {
		InDate = inDate;
	}

	public String getInTime() {
		return InTime;
	}

	public void setInTime(String inTime) {
		InTime = inTime;
	}

	public int getMember() {
		return Member;
	}

	public void setMember(int member) {
		Member = member;
	}

	public void setSeqNo(int seqNo) {
		SeqNo = seqNo;
	}

	public String getSendId() {
		return SendId;
	}

	public void setSendId(String sendId) {
		SendId = sendId;
	}

	public String getSendName() {
		return SendName;
	}

	public void setSendName(String sendName) {
		SendName = sendName;
	}

	public String getRphone1() {
		return Rphone1;
	}

	public void setRphone1(String rphone1) {
		Rphone1 = rphone1;
	}

	public String getRphone2() {
		return Rphone2;
	}

	public void setRphone2(String rphone2) {
		Rphone2 = rphone2;
	}

	public String getRphone3() {
		return Rphone3;
	}

	public void setRphone3(String rphone3) {
		Rphone3 = rphone3;
	}

	public String getRecvName() {
		return RecvName;
	}

	public void setRecvName(String recvName) {
		RecvName = recvName;
	}

	public String getSphone1() {
		return Sphone1;
	}

	public void setSphone1(String sphone1) {
		Sphone1 = sphone1;
	}

	public String getSphone2() {
		return Sphone2;
	}

	public void setSphone2(String sphone2) {
		Sphone2 = sphone2;
	}

	public String getSphone3() {
		return Sphone3;
	}

	public void setSphone3(String sphone3) {
		Sphone3 = sphone3;
	}

	public String getMsg() {
		return Msg;
	}

	public void setMsg(String msg) {
		Msg = msg;
	}

	public String getUrl() {
		return Url;
	}

	public void setUrl(String url) {
		Url = url;
	}

	public String getRdate() {
		return Rdate;
	}

	public void setRdate(String rdate) {
		Rdate = rdate;
	}

	public String getRtime() {
		return Rtime;
	}

	public void setRtime(String rtime) {
		Rtime = rtime;
	}

	public String getResult() {
		return Result;
	}

	public void setResult(String result) {
		Result = result;
	}

	public String getKind() {
		return Kind;
	}

	public void setKind(String kind) {
		Kind = kind;
	}

	public int getErrCode() {
		return ErrCode;
	}

	public void setErrCode(int errCode) {
		ErrCode = errCode;
	}

	public int getRetry1() {
		return Retry1;
	}

	public void setRetry1(int retry1) {
		Retry1 = retry1;
	}

	public int getRetry2() {
		return Retry2;
	}

	public void setRetry2(int retry2) {
		Retry2 = retry2;
	}

	public String getLastTime() {
		return LastTime;
	}

	public void setLastTime(String lastTime) {
		LastTime = lastTime;
	}

	@Override
	public String toString() {
		return "SMSSend [SeqNo=" + SeqNo + ", InDate=" + InDate + ", InTime=" + InTime + ", Member=" + Member
				+ ", SendId=" + SendId + ", SendName=" + SendName + ", Rphone1=" + Rphone1 + ", Rphone2=" + Rphone2
				+ ", Rphone3=" + Rphone3 + ", RecvName=" + RecvName + ", Sphone1=" + Sphone1 + ", Sphone2=" + Sphone2
				+ ", Sphone3=" + Sphone3 + ", Msg=" + Msg + ", Url=" + Url + ", Rdate=" + Rdate + ", Rtime=" + Rtime
				+ ", Result=" + Result + ", Kind=" + Kind + ", ErrCode=" + ErrCode + ", Retry1=" + Retry1 + ", Retry2="
				+ Retry2 + ", LastTime=" + LastTime + "]";
	}

	

}