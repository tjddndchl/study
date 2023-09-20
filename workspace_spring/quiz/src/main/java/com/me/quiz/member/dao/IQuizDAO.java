package com.me.quiz.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;

import com.me.quiz.member.vo.QuizVO;


@Mapper
public interface IQuizDAO {
	
	public int registQuiz(QuizVO quiz);
	
	//퀴즈 조회하기위한 메서드
	public QuizVO selectQuiz();
	public List<QuizVO> quizList();

}
