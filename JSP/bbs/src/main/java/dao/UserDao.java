package dao;
//DB에 사용되는 부분을 작성

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.BbsVo;
import model.DetailedBbsVo;
import model.UserVO;


public class UserDao {
	private static UserDao instance = new UserDao();
	
	public static UserDao getInstance() {
		return instance;
	}
	
	//회원 조회 로그인 관련
 	public UserVO loginUser(Connection conn,String id) throws SQLException {
 		UserVO userVO = new UserVO();
 		StringBuffer query = new StringBuffer();
 		query.append("	SELECT 	   user_id ");
 		query.append("            ,user_nm ");
 		query.append("            ,user_pw ");
 		query.append("            ,user_mileage ");
 		query.append("	FROM tb_user ");
 		query.append("	WHERE user_id = ? ");
 		PreparedStatement ps =
 				conn.prepareStatement(query.toString());
 		ps.setString(1, id);
 		ResultSet rs = ps.executeQuery();
 		while(rs.next()) {
 			userVO.setUserId(rs.getString("user_id"));
 			userVO.setUserNm(rs.getString("user_nm"));
 			userVO.setUserPw(rs.getString("user_pw"));
 			userVO.setUserMileage(rs.getInt("user_mileage"));
 		}
 		if(ps != null)ps.close();
 		if(rs !=null)rs.close();
 		
 		return userVO;
 	}
 	
 	//회원 가입 (INSERT)
 	public int insertUser(Connection conn,UserVO user) throws SQLException {
 		StringBuffer query = new StringBuffer();
 		query.append("	INSERT INTO  tb_user(user_id, user_nm, user_pw, create_dt)");
 		query.append("	VALUES(?, ?, ?, SYSDATE)");
 		PreparedStatement ps = conn.prepareStatement(query.toString());
 		int idx =1;
 		ps.setString(idx++, user.getUserId());
 		ps.setString(idx++, user.getUserPw());
 		ps.setString(idx++, user.getUserNm());
 		
 		int cnt = ps.executeUpdate();
 		if(ps != null)ps.close();
 		return cnt;
 	}
 	
 	public ArrayList<BbsVo> bbsList(Connection conn) throws SQLException{
 		ArrayList<BbsVo> bbsList= new ArrayList<BbsVo>();
 		StringBuffer query = new StringBuffer();
 		query.append("	SELECT rownum                  as rnum");
 		query.append("            ,COUNT(*) OVER() as all_cnt");
 		query.append("            ,a.bbs_no               as bbs_no");
 		query.append("            ,a.bbs_title              as bbs_title");
 		query.append("            ,a.author_id             as  author_id");
 		query.append("            ,a.update_dt            as  update_dt");
 		query.append("	");
 		query.append("	FROM(   SELECT  bbs_no");
 		query.append("            ,bbs_title");
 		query.append("            ,author_id");
 		query.append("            ,TO_CHAR(update_dt,'YYMMDD HH24:MI:SS') as update_dt");
 		query.append("	FROM bbs");
 		query.append("	WHERE parent_no IS NULL");
 		query.append("	ORDER BY update_dt DESC) a");
 		PreparedStatement ps =
 			conn.prepareStatement(query.toString());
 			ResultSet rs = ps.executeQuery();
 			 while (rs.next()) {
 		        BbsVo bbsVo = new BbsVo();
 		       bbsVo.setRnum(rs.getInt("rnum"));
 		
 		        bbsVo.setBbsNo(rs.getInt("bbs_no"));
 		        bbsVo.setBbsTitle(rs.getString("bbs_title"));
 		        bbsVo.setAuthorId(rs.getString("author_id"));
 		        bbsVo.setUpdateDt(rs.getString("update_dt"));
 		        bbsList.add(bbsVo);
 		    }
 		    
 		    if (ps != null) ps.close();
 		    if (rs != null) rs.close();
 		    
 		    return bbsList;
 	}
 		
	public ArrayList<DetailedBbsVo> DetailList(Connection conn, int bbsno) throws SQLException{
 		ArrayList<DetailedBbsVo> DetailList= new ArrayList<DetailedBbsVo>();
 		StringBuffer query = new StringBuffer();
 		query.append("	SELECT ");
 		query.append("    DECODE(level, 1, '메인글','댓글')");
 		query.append("     , bbs_no    as bbs_no         ");
 		
 		query.append("     ,LPAD(' ',3 * (level-1))|| a.bbs_content    as bbs_content          ");
 		query.append("     ,author_id    as author_id      ");
 		query.append("    ,update_dt      as update_dt   ");
 		query.append("	FROM bbs a");
 		query.append("	START WITH bbs_no = ? ");
 		query.append("	CONNECT BY PRIOR bbs_no = parent_no ");
 		query.append("	ORDER SIBLINGS BY update_dt desc ");
 		PreparedStatement ps =
 			conn.prepareStatement(query.toString());
 			ps.setInt(1,bbsno);
 			ResultSet rs = ps.executeQuery();
 			 while (rs.next()) {
 		        DetailedBbsVo BBSVO = new DetailedBbsVo();
 		       BBSVO.setBbsNo(rs.getInt("bbs_no"));
 		       BBSVO.setBbsContent(rs.getString("bbs_content"));
 		       BBSVO.setAuthorId(rs.getString("author_id"));
 		      BBSVO.setUpdateDt(rs.getString("update_dt"));
 		      DetailList.add(BBSVO);
 		    }
 		    
 		    if (ps != null) ps.close();
 		    if (rs != null) rs.close();
 		    
 		    return DetailList;
 	}
	public int updateUser(Connection conn,UserVO user) throws SQLException {
 		StringBuffer query = new StringBuffer();
 		query.append(" UPDATE tb_user ");
 		query.append("	SET user_nm=? ");
 		query.append("	WHERE user_id=? ");
 		PreparedStatement ps = conn.prepareStatement(query.toString());
 		int idx =1;
 		ps.setString(1, user.getUserNm());
 		ps.setString(2, user.getUserId());
 		
 		int cnt = ps.executeUpdate();
 		if(ps != null)ps.close();
 		return cnt;
 	}
 	
}
