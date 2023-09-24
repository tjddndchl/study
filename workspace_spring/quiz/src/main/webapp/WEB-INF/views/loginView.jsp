<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="css/login.css">
  <title>HASH TECHIE OFFICIAL</title>
</head>
<body>
    <section>
        <div class="form-box">
            <div class="form-value">
                <form method="post" action= "<c:url value ='/loginDo' />">
                    <h2>Login</h2>
                    <div class="inputbox">
                        <ion-icon name="mail-outline"></ion-icon>
                        <input type="text" name="memId" value="${cookie.rememberId.value}" placeholder="아이디를 입력해주세요" />
                                                		
                        <label>아이디</label>
                    </div>
                    <div class="inputbox">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                        <input type="password" name="memPw" value="${cookie.rememberPw.value}" placeholder="비번를 입력해주세요" />
                        <label for="">비번</label>
                    </div>
                    <div class="forget">
                        <label for=""><input type="checkbox"  name="remember" ${cookie.rememberId.value==null ? "":"checked" }>
                        기억하기  <a href="#">아이디 기억안날시</a></label>
                        <input name="fromUrl" type="hidden" value="${fromUrl }"/>
                        
                      
                    </div>
                    <button type="submit">로그인</button>
                    <div class="register">
                        <p>아이디가 없으면 <a href="#">등록</a></p>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>