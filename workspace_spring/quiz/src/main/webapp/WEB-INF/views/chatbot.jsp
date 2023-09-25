<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/chatbot.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<head>
<meta charset="UTF-8">
<title>챗봇</title>
</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp" %>
    <div id="chat-container">
        <div id="chat-messages"></div>
        <div id="user-input">
            <input type="text" placeholder="메시지를 입력하세요..." />
            <button>전송</button>
        </div>
    </div>
    <script src="js/chatbot.js"></script>
</body>
</html>