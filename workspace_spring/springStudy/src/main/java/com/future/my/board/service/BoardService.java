package com.future.my.board.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.future.my.board.dao.IBoardDAO;
import com.future.my.board.vo.BoardVO;

@Service
public class BoardService {
	
	
	@Autowired //이거 안쓰면 DB하고 안붙음
	IBoardDAO dao;
	
	public List<BoardVO> getBoardList(){
		List<BoardVO> result = dao.getBoardList();
		return result;
	}
	public void writeBoard(BoardVO board) throws Exception{
		int result = dao.writeBoard(board);
		if (result==0) {
			throw new Exception();
		}
	}
	
	public BoardVO getBoard(int boardNo) throws Exception{
		BoardVO result = dao.getBoard(boardNo);
		
		if (result == null) {
			throw new Exception();
		}
		
		return result;
	}
}
