<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>게시판</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c: forEach items="${list}" var="list">
				<tr>
					<td>${list.seq}</td>
					<td>${list.subject}</td>
					<td>${list.content}</td>
					<td>${list.name}</td>
					<td>${list.regDate}</td>
					<td>${list.readCount}</td>
				</tr>
			</c: forEach>
		</tbody>
	</table>
</body>
</html>