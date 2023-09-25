<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/body.css">
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	var cnt=1; //파이 업로드 name 값을 다르게 하는 변수
	function fn_addFile(){
		$("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
		cnt++;
	}
	
</script>
<body>
	<%@include file="/WEB-INF/inc/top.jsp" %>
	<h1>파일 업로드하기</h1>
	
	<form method="post" action="${contextPath }/upload" enctype="multipart/form-data">
	<label>아이디:</label>
		<input type="text" name="id"/><br>
	<label>이름:</label>
		<input type="text" name="name"/><br>
		<input type="button" value="파일 추가" onclick="fn_addFile()"/><br>
		<div id="d_file"> <!-- 자바스크립트 이용해 div태그 안에 파일 업로드 추가 -->
		
		</div>
		<input type="submit" value="업로드"/>
		
	</form>
</body>
</html>