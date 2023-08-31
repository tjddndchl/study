<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
 	request.setCharacterEncoding("utf-8");
 	int dan = Integer.parseInt(request.getParameter("dan")); //전송될 단수를 구합니다.
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단출력</title>
</head>
<body>
	<table border="1" width='800'>
	<tr align="center" bgcolor="#FFFFF66">
		<td colspan="2"><%= dan %>단 출력</td>
	</tr>
	<%
		for(int i=1; i<10; i++){
	%>
	
	<% if(i%2==1){ %>
	<tr align="center" bgcolor="#CCFF66">
	<% 
	} else{
	%>
	<tr align="center" bgcolor="#CCCCFF">
	<%
	}
	%>
		<td>
			<%=dan  %> * <%=i %>
		</td>
		<td width="400">
			<%= i*dan %>
		</td>
	</tr>	
<% 
		}
%>
	</table>
</body>
</html>