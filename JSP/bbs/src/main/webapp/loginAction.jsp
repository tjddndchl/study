<%@page import="model.UserVO"%>
<%@page import="service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id = request.getParameter("userId");
	String pw = request.getParameter("userPw");
	System.out.println(id);
	System.out.println(pw);
	UserService userService = UserService.getInstance();
//	UserService userService = null; NULL 오류뜸
	UserVO userVO = userService.loginUser(id, pw);
	System.out.println(userVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		if(userVO != null){ 
		session.setAttribute("userId", userVO.getUserId());
		session.setMaxInactiveInterval(1 * 60); // 1분
	%>
		
		<script> 
				alert("환영합니다.^^")
				location.href="main.jsp";
		</script>
	<% }else{ %>
		<script> alert("아이디/비번을 확인하세요!");
				history.back();
		</script>
	<%} %>
</body>
</html>