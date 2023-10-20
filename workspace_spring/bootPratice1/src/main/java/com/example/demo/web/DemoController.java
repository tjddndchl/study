package com.example.demo.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.BoardService;
import com.example.demo.vo.BoardVO;

@Controller
public class DemoController {
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/hello.do")
	public String hello(Model model) {
		List<BoardVO> boardList = boardService.boardList();
		System.out.println(boardList);
		model.addAttribute("message", "hi nick");
		model.addAttribute("boardList", boardList);
		return "hello";
	}
}
