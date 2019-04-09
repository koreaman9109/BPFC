package com.homepage.interlink.model;

public class Surem_result {
	
	private String Result;     //결과값
	private String SeqNum;     //고유값
	private String UserCode;
	private String DeptCode;
	private String Phone;      //수신번호
	private String RTime;      //슈어엠측으로 전송된 시간
	private String RecvTime;   //핸드폰전송시간
	private String ReqPhone;   //회신번호
	private String CallCount;  //슈어엠측일련번호
	private String Error;      //에러코드
	private String etc;

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getResult() {
		return Result;
	}

	public void setResult(String result) {
		Result = result;
	}

	public String getSeqNum() {
		return SeqNum;
	}

	public void setSeqNum(String seqNum) {
		SeqNum = seqNum;
	}

	public String getUserCode() {
		return UserCode;
	}

	public void setUserCode(String userCode) {
		UserCode = userCode;
	}

	public String getDeptCode() {
		return DeptCode;
	}

	public void setDeptCode(String deptCode) {
		DeptCode = deptCode;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getRTime() {
		return RTime;
	}

	public void setRTime(String rTime) {
		RTime = rTime;
	}

	public String getRecvTime() {
		return RecvTime;
	}

	public void setRecvTime(String recvTime) {
		RecvTime = recvTime;
	}

	public String getReqPhone() {
		return ReqPhone;
	}

	public void setReqPhone(String reqPhone) {
		ReqPhone = reqPhone;
	}

	public String getCallCount() {
		return CallCount;
	}

	public void setCallCount(String callCount) {
		CallCount = callCount;
	}

	public String getError() {
		return Error;
	}

	public void setError(String error) {
		Error = error;
	}

	@Override
	public String toString() {
		return "Surem_result [Result=" + Result + ", SeqNum=" + SeqNum + ", UserCode=" + UserCode + ", DeptCode="
				+ DeptCode + ", Phone=" + Phone + ", RTime=" + RTime + ", RecvTime=" + RecvTime + ", ReqPhone="
				+ ReqPhone + ", CallCount=" + CallCount + ", Error=" + Error + ", etc=" + etc + "]";
	}

}
