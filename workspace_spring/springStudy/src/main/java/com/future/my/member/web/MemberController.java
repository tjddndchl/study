package com.future.my.member.web;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.future.my.member.service.MemberService;
import com.future.my.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/registView")
	public String registView() {
		return "member/registView";
		
	}
	@RequestMapping("/registDo")
	public String registDo(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nm = request.getParameter("nm");
		System.out.println(nm);
		MemberVO member = new MemberVO(id, pw, nm);
		try {
			memberService.registMember(member);
		} catch (Exception e) {
			e.printStackTrace();
			return "errorView";
		}
		return "redirect:/";
	}
	@RequestMapping("/loginView")
	public String loginView() {
		return "member/loginView";
	}
	@RequestMapping("/loginDo")
	public String loginDo(MemberVO member, HttpSession session) {
		System.out.println(member);
		MemberVO login = memberService.loginMember(member);
		if (login==null) {
			return "redirect:/loginView?msg=N";
		}
		session.setAttribute("login", login);
		
		
		return "redirect:/";
	}
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session) {
	
		session.invalidate();
		return "redirect:/"; 
	}
}
