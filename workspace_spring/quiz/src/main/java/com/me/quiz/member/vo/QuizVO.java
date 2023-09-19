package com.me.quiz.member.vo;

public class QuizVO {
	private String quizPb;
	private String quizAns;
	private String quizNm;
	
	public QuizVO() {}

	public String getQuizPb() {
		return quizPb;
	}

	public void setQuizPb(String quizPb) {
		this.quizPb = quizPb;
	}

	public String getQuizAns() {
		return quizAns;
	}

	public void setQuizAns(String quizAns) {
		this.quizAns = quizAns;
	}

	public String getQuizNm() {
		return quizNm;
	}

	public void setQuizNm(String quizNm) {
		this.quizNm = quizNm;
	}

	public QuizVO(String quizPb, String quizAns, String quizNm) {
		super();
		this.quizPb = quizPb;
		this.quizAns = quizAns;
		this.quizNm = quizNm;
	}

	@Override
	public String toString() {
		return "QuizVO [quizPb=" + quizPb + ", quizAns=" + quizAns + ", quizNm=" + quizNm + "]";
	}
	
	
}
