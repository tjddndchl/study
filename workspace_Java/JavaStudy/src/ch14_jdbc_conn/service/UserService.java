package ch14_jdbc_conn.service;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import ch14_jdbc_conn.dao.UserDao;
import ch14_jdbc_conn.jdbc.ConnectionPool;
import ch14_jdbc_conn.model.BbsVo;
import ch14_jdbc_conn.model.DetailedBbsVo;
import ch14_jdbc_conn.model.UserVO;

public class UserService {
	private ConnectionPool cp = ConnectionPool.getInstance();
	
	private UserDao dao =  UserDao.getInstance();
	private static UserService instance = new UserService();
	
	public static UserService getInstance() {
		return instance;
	}
	//로그인
	public UserVO loginUser(String id) {
		Connection conn = cp.getConnection();
		try {
			return dao.loginUser(conn, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (conn != null)cp.releaseConnection(conn);
				
		}
		return new UserVO();
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
