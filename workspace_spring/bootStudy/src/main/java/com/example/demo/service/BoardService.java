package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDemoDAO;
import com.example.demo.vo.BoardVO;

@Service
public class BoardService {
	
	@Autowired
	IDemoDAO dao;
	
	public List<BoardVO> boardList(){
		return dao.boardList();
	}
}
