package com.myspring.kmpetition.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.kmpetition.member.vo.EnableVO;
import com.myspring.kmpetition.member.vo.HistoryVO;
import com.myspring.kmpetition.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

//	로그인 정보 조회
	@Override
	public MemberVO login(Map loginMap) throws DataAccessException {
		System.out.println("DAO의 login");
		MemberVO member = sqlSession.selectOne("mapper.member.login", loginMap);
		return member;
	}

	public int selectFailCount(String id) {
		
		return sqlSession.selectOne("mapper.member.selectFailCount", id);
	}
	
	public void updateFailCount(EnableVO enable) {
		
		sqlSession.update("mapper.member.updateFailCount", enable);
	}
	
	public void updateTime(EnableVO enable) {
		
		sqlSession.update("mapper.member.updateTime", enable);
	}
	
	public String selectTime(String id) {
		
		return sqlSession.selectOne("mapper.member.selectTime", id);
	}
	
	
	
	@Override
	public void updateLastLogin(String id) throws DataAccessException {
		System.out.println("dao의 접속일업뎃 메서드 진입");
		 sqlSession.update("mapper.member.updateLastLogin", id);

	}


	@Override
	public MemberVO selectForAwake(MemberVO memberVO) throws DataAccessException {
		System.out.println("dao의 조회작업 진입");
//		System.out.println("id : "+memberMap.get("id"));
//		System.out.println("pwd : "+memberMap.get("pwd"));
//		System.out.println("email : "+memberMap.get("email"));
//		System.out.println("name : " + memberMap.get("name"));
		return sqlSession.selectOne("mapper.member.selectForAwake", memberVO);
		
	}
	
//	회원가입
//	@Override
//	public void insertMember(MemberVO member) throws DataAccessException {
//		sqlSession.selectOne("mapper.member.insertMember", member);
//
//	}

	// 이멜 드롭박스 회원가입
	@Override
	public void insertMember(Map<String, String> memberMap) throws DataAccessException {
		sqlSession.selectOne("mapper.member.insertMember", memberMap);

	}

//	ID중복체크(회원가입)
	@Override
	public String overlapped(String id) throws DataAccessException {
		MemberVO memberVO = sqlSession.selectOne("mapper.member.checkId", id);
		if (memberVO != null && memberVO.getId() != null) {
			return "true"; // ID체크 불합격(이미 동일한 ID 존재)
		} else {
			return "false"; // ID체크 합격(동일한 ID 없음)
		}
	}

//	이메일 중복체크(회원가입)
	@Override
	public String checkEmail(String email) throws DataAccessException {
		MemberVO memberVO = sqlSession.selectOne("mapper.member.checkEmail", email);
		if (memberVO != null && memberVO.getId() != null) {
			return "true"; // 이멜체크 불합격(이미 동일한 이메일 존재)
		} else {
			return "false"; // 이멜체크 합격(동일한 이메일 없음)
		}
	}

	@Override
	public MemberVO selectForFindId(Map<String, String> findMap) throws DataAccessException {
//	public MemberVO selectForFindId(MemberVO member) throws DataAccessException {
		System.out.println("dao의 findid");
		MemberVO memberVO = (MemberVO) sqlSession.selectOne("mapper.member.findId", findMap);
//		MemberVO memberVO=(MemberVO)sqlSession.selectOne("mapper.member.findId", member);
		return memberVO;
	}

	@Override
	public MemberVO selectForFindPwd(Map<String, String> findMap) throws DataAccessException {
		MemberVO memberVO = (MemberVO) sqlSession.selectOne("mapper.member.findPwd", findMap);
		return memberVO;
	}

	@Override
	public void updatePwd(Map<String, String> modMap) throws DataAccessException {
		sqlSession.update("mapper.member.updatePwd", modMap);

	}

	@Override
	public void insertHistory(HistoryVO historyVO) throws DataAccessException {
		sqlSession.insert("mapper.member.insertHistory", historyVO);
		
	}
	
	
	public Map<String, List<String>> selectAllUploadList(String id) throws DataAccessException{
		
		List<String> boardUploadList = sqlSession.selectList("mapper.member.selectAllBoardUploadList", id);
		List<String> replyUploadList = sqlSession.selectList("mapper.member.selectAllReplyUploadList", id);
		
		Map<String, List<String>> deleteMap = new HashMap<String, List<String>>();
		
		deleteMap.put("board", boardUploadList);
		deleteMap.put("reply", replyUploadList);
		
		return deleteMap;
	}
	
	public void deleteMember(String id) throws DataAccessException{
		
		sqlSession.delete("mapper.member.deleteMember", id);
	}

	
	

}
