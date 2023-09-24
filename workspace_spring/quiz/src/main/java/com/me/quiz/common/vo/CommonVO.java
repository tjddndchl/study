package com.me.quiz.common.vo;

public class CommonVO {
	private String memId;
	private String memPw;
	private String memNm;
	
	public CommonVO() {}

	public CommonVO(String memId, String memPw, String memNm) {
		super();
		this.memId = memId;
		this.memPw = memPw;
		this.memNm = memNm;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	@Override
	public String toString() {
		return "CommonVO [memId=" + memId + ", memPw=" + memPw + ", memNm=" + memNm + "]";
	}
	
	
	

	
	
}
