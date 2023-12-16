package com.my.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	private BoardDAO dao;
	
	@Override
	public List list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}
	
}
