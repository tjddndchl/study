package com.me.quiz.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.me.quiz.member.vo.QuizVO;


@Mapper
public interface IQuizDAO {
	
	public int registQuiz(QuizVO quiz);
	public QuizVO selectQuiz(QuizVO quiz);

}
