<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("name", "최성웅");
	application.setAttribute("address", "대전시관저동서구리슈빌아파트108동1603호");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 테스트1</title>
</head>
<body>
	<h1>이름과 주소를 저장합니다.</h1>
	<a href="appTest2.jsp">두 번째 웹페이지로 이동</a>
</body>
</html>