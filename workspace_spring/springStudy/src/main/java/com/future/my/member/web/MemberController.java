package com.future.my.member.web;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
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
		return "redirect:/";
	}
}
