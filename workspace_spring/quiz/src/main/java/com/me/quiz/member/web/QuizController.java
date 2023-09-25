package com.me.quiz.member.web;

import java.util.Collections;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.me.quiz.common.vo.CommonVO;
import com.me.quiz.member.dao.IQuizDAO;
import com.me.quiz.member.vo.QuizVO;
import com.me.quiz.server.StartupPy;


@Controller
public class QuizController {
	@Autowired
	private IQuizDAO quizDAO;
    @Autowired
    private StartupPy startupPy;
	
    // initializeStartupPy() 메서드 호출
    
	
	@RequestMapping("/quiz")
	public String index(Model model, HttpSession session) {
		
        if (startupPy != null) {
        	startupPy.initialize();
		}
		
		
        List<QuizVO> quizList = quizDAO.quizList(); // 여러 개의 퀴즈를 조회하는 메서드
        
        // 퀴즈 목록의 크기를 얻어옴
        

        Collections.shuffle(quizList);

        // 퀴즈 데이터를 콘솔에 출력
        for (QuizVO quiz : quizList) {
            System.out.println("퀴즈 질문: " + quiz.getQuizPb());
            System.out.println("퀴즈 정답: " + quiz.getQuizAns());
        }

        // 퀴즈 데이터를 JavaScript 코드로 생성하여 모델에 추가
        StringBuilder javascriptCode = new StringBuilder();
        javascriptCode.append("let questions = [");
        
        int numberOfQuestions = 5; // 출력할 퀴즈 개수

        for (int i = 0; i < numberOfQuestions && i < quizList.size(); i++) {
            QuizVO quiz = quizList.get(i);
       
            javascriptCode.append("{");
            javascriptCode.append("numb: " + quiz.getQuizNm() + ",");
            javascriptCode.append("question: '" + quiz.getQuizPb() + "',");
            javascriptCode.append("answer: '" + quiz.getQuizAns() + "',");
            javascriptCode.append("options: [");

            // 여기에서 퀴즈 옵션을 추가하세요
            javascriptCode.append("'" + quiz.getQuizAns() + "',");
            javascriptCode.append("'" + quiz.getQuizAns() +"1"  + "',");
            javascriptCode.append("'" + quiz.getQuizAns() +"2"+ "',");
            javascriptCode.append("'" + quiz.getQuizAns() +"3" +"',");
            
            // 모든 옵션 추가 후 마지막 쉼표 제거
            javascriptCode.deleteCharAt(javascriptCode.length() - 1);
            javascriptCode.append("]");
            javascriptCode.append("},");
        }

        // 모든 퀴즈 추가 후 마지막 쉼표 제거
        javascriptCode.deleteCharAt(javascriptCode.length() - 1);
        javascriptCode.append("];");

        // JavaScript 코드를 모델에 추가
        model.addAttribute("javascriptCode", javascriptCode.toString());
        
        

        return "index";
    }
    
	
	@RequestMapping("/memberlogin")
	public String login() {
		return "login";
	}
	@RequestMapping("/chatbot1")
	public String chatbot() {
		return "chatbot";
	}
	
	
	
	
}








