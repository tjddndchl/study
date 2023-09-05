<%@page import="model.UserVO"%>
<%@page import="service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="service.UserService" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="userVO" class="model.UserVO" scope="page"></jsp:useBean>
<jsp:setProperty property="userId" name="userVO"/>
<jsp:setProperty property="userPw" name="userVO"/>
<jsp:setProperty property="userNm" name="userVO"/>
<% 
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String userNm = request.getParameter("userNm");
	System.out.println(userNm);
	System.out.println(userVO);
	UserService userService = UserService.getInstance();
	int cnt = userService.insertUser(userVO);
	System.out.println(cnt);
// 	userVO = userService.loginUser(userId, userPw);
// 	System.out.println(userVO);	
	
	%>
	<!-- UserService 의 insertUser 메서드를 호출하여 회원정보 저장 후
	 	리턴값이 1 이면(정상저장) 세션에 userId 저장 후 main.jsp 로 이동 -->
	<!-- 리턴값이 0 이면 join.jsp 화면으로 이동시켜 주세요^^ --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinAction</title>
</head>
<body>
	<% if(cnt == 0) {%>
		<script>
			alert("중복된아이디입니다.");
			location.href = "join.jsp";	
		</script>
	<%}else {	
		session.setAttribute("userId", userVO.getUserId());
	 %>
		<script>
			alert("환영합니다.");
			location.href = "main.jsp";
		</script>	
			
	<%} %>
	
</body>
</html>