package ch14_jdbc_conn.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.spi.DirStateFactory.Result;

public class testMain {

	public static void main(String[] args) {
		connectionFactory db = connectionFactory.getInstance();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection conn = null;
		
		try {
			 conn = db.getConnection();
			System.out.println(conn);
		
			
			StringBuffer query = new StringBuffer();
			query.append(" SELECT user_id");
			query.append("    ,user_pw");
			query.append("    ,user_nm");
			query.append("    ,user_mail");
			query.append("    ,user_mileage");
			query.append(" FROM tb_user");
			ps = conn.prepareStatement(query.toString());
			rs = ps.executeQuery();//쿼리실행문
			
			while(rs.next()) {
				String userId = rs.getString("user_id");
				String userNm = rs.getString("user_nm");
				int userMileage = rs.getInt("user_mileage");
				System.out.println("아이디"+userId+"이름:"+userNm
									+ ",마일리지:" + userMileage);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			if (rs != null) {try {rs.close();} catch (SQLException e){e.printStackTrace();}}
			if (ps != null) {try {ps.close();} catch (SQLException e) {e.printStackTrace();}}
			if (conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
		
	}

}
