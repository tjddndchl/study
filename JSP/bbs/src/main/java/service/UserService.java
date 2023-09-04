package service;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.UserDao;
import jdbc.ConnectionPool;
import model.BbsVo;
import model.DetailedBbsVo;
import model.UserVO;

public class UserService {
	private ConnectionPool cp = ConnectionPool.getInstance();
	
	private UserDao dao =  UserDao.getInstance();
	private static UserService instance = new UserService();
	
	public static UserService getInstance() {
		return instance;
	}
	//로그인
	public UserVO loginUser(String id, String pw) {
		Connection conn = cp.getConnection();
		try {
			UserVO vo = dao.loginUser(conn, id);
			if (vo.getUserId() != null) {
				if (vo.getUserPw().equals(pw)) {
					return vo;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (conn != null)cp.releaseConnection(conn);
				
		}
		return null;
	}
	
	//회원가입
	public int insertUser(UserVO user) {
		Connection conn =cp.getConnection();
		try {
			return dao.insertUser(conn, user);
		} catch (SQLException e) {
			System.out.println("중복된 아이디 입니다.!!!");
			e.printStackTrace();
		}
		return 0;
	} 
	//게시판 출력
	public ArrayList<BbsVo> bbsList (){
		Connection conn =cp.getConnection();
		try {
			return dao.bbsList(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public ArrayList<DetailedBbsVo> DetailList (int bbsno){
		Connection conn = cp.getConnection();
		
		try {
			return dao.DetailList(conn, bbsno);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;
	}
}
