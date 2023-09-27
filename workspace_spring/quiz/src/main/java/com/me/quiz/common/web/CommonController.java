package com.me.quiz.common.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.me.quiz.common.service.CommonService;
import com.me.quiz.common.vo.CommonVO;

@Controller
public class CommonController {

	@Autowired
	CommonService commonService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("/registView")
	public String registView() {
		return "registView";
		
	}
	@RequestMapping("/registDo")
	public String registDo(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = passwordEncoder.encode(request.getParameter("pw"));
		String nm = request.getParameter("nm");
		System.out.println(nm);
		CommonVO common = new CommonVO(id, pw , nm);
		try {
			commonService.registCommon(common);
		} catch (Exception e) {
			e.printStackTrace();
			return "registView";
		}

		    
		System.out.println("====================회원가입성공======================");
		return "redirect:loginView";
	}
	
    @RequestMapping("/loginView")
    public String loginView() {
        return "loginView"; // 
    }
	@RequestMapping("/loginDo")
	public String loginDo(CommonVO common, HttpSession session
						,boolean remember, String fromUrl, HttpServletResponse response)  {
		System.out.println(common);
		CommonVO login = commonService.loginCommon(common);
		
		boolean match = passwordEncoder.matches(common.getMemPw(), login.getMemPw());
		
		session.setAttribute("login", login);
		System.out.println(login);
		if (login==null || !match) {
			return "redirect:/loginView?msg=N";
		}
		
		if (remember) {
			//true 쿠키 생성
			Cookie cookie = new Cookie("rememberId", common.getMemId());
			response.addCookie(cookie);//응답하는 객체에 담아서 전달
		}else {
			//쿠키 삭제
			Cookie cookie = new Cookie("rememberId","");
			cookie.setMaxAge(0);
			response.addCookie(cookie); //응답하는 객체에 담아서 전달
			
		}
		System.out.println("===============로그인 성공================");
		return "redirect:quiz";
	}
	
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session,
							HttpServletRequest request) {
		
		//세션 종료
		session.invalidate();
		//현재 요청이 어느 URL을 바라보는지
		String requestToURL = request.getRequestURI().toString();
		System.out.println(requestToURL);
		String requestUrl = request.getHeader("Referer");
		System.out.println(requestUrl);
		System.out.println("===================로그아웃====================");
		return "redirect:loginView"; 
	}
    
}
