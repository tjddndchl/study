<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="css/login.css"> 
  <title>HASH TECHIE OFFICIAL - 회원 등록</title> 
</head>
<body>
    <section>
        <div class="form-box">
            <div class="form-value">
                <form method="post" action= "<c:url value ='/registDo' />">
                    <h2>회원 등록</h2> <!-- 페이지 제목을 변경합니다. -->
                    <div class="inputbox">
                        <ion-icon name="mail-outline"></ion-icon>
                        <input type="text"  name="id">
                        <label for="">아이디</label> 
                    </div>
                    <div class="inputbox">
                        <ion-icon name="person-outline"></ion-icon>
                        <input type="text" name="nm">
                        <label for="">사용자 이름</label> 
                    </div>
                    <div class="inputbox">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                        <input type="password" name="pw">
                        <label for="">비밀번호</label> 
                    </div>
                    <button type="submit">회원 가입</button> 
                    <div class="login">
                        <p>이미 계정이 있으신가요? <a href="#">로그인</a></p>
                    </div>
                </form>

            </div>
        </div>
    </section>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>