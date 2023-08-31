<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String name=(String)session.getAttribute("name");//session 객체에 바인딩된 name을 가져옵니다.
	session.setAttribute("address", "대전시 관저동");//session객체에 address를 바인딩합니다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체테스트2</title>
</head>
<body>
	이름은<%=name %>입니다.<br>
	<a href="session2.jsp">두 번쨰 페이지로 이동합니다.</a>
</body>
</html>