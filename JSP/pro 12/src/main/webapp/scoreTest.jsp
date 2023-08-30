<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int score =Integer.parseInt(request.getParameter("score"));//전송시 시험점수를 받아옵니다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>시험점수<%=score %>점</h1> <br>
	<%
	if(score>100){
	%>
	<script>
	alert("오류입니다.")
	</script>
	<h1>점수입력오류</h1>
	<%
	}else if(score>=90 && score<=100) {
	%>
	
	<h1>A학점입니다.</h1>
	<%
	}else if(score >=80 && score <90){
	%>
	<h1>B학점입니다.</h1>
	<%
	}else if(score>=70 && score <80){
	%>
	<h1>C학점입니다.</h1>
	<%
	}else if(score>=60 && score <70){
	%>
	<h1>D학점입니다.</h1>
	<%
	}else{
	%>
	<h1>F학점입니다.</h1>
	<%
	}
	%>
	 <br>
	 <a href="scoreTest.html">시험점수입력</a>
</body>
</html>