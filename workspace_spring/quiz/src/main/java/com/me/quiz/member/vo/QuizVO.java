package com.me.quiz.member.vo;

public class QuizVO {
	private String quizPb;
	private String quizAns;
	private int quizNm;
	
	public QuizVO() {}

	public QuizVO(String quizPb, String quizAns, int quizNm) {
		super();
		this.quizPb = quizPb;
		this.quizAns = quizAns;
		this.quizNm = quizNm;
	}

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

	public int getQuizNm() {
		return quizNm;
	}

	public void setQuizNm(int quizNm) {
		this.quizNm = quizNm;
	}

	@Override
	public String toString() {
		return "QuizVO [quizPb=" + quizPb + ", quizAns=" + quizAns + ", quizNm=" + quizNm + "]";
	}

	
	
}
