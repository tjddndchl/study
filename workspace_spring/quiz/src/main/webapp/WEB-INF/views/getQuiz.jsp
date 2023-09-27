<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Website HTML CSS JS</title>
    <link rel="stylesheet" href="css/style.css">
    <script>
    	let a = "${sessionScope}";
    	console.log(a); 	
   </script>

</head>

<body>
    <main class="main">
        <header class="header">
            <a href="" class="logo">문제섞기</a>
            <nav class="navbar">
            
                <a href="${pageContext.request.contextPath}/form" class="active">파일업로드</a>
                <a href="${pageContext.request.contextPath}/chatbot1">검색</a>
            <c:if test="${sessionScope.login == null}">    
                <a href="${pageContext.request.contextPath}/loginView">로그인</a>
            </c:if>
            <c:if test="${sessionScope.login != null}">
                <a href="#" >${sessionScope.login.memId}님</a>
                <a href="${pageContext.request.contextPath}/logoutDo">로그아웃</a>
            </c:if>
			
            </nav>
        </header>

        <div class="container">
            <section class="quiz-section">
                <div class="quiz-box">
                    <h1>빅분기 퀴즈</h1>
                    <div class="quiz-header">
                        <span>퀴즈 토튜리얼</span>
                        <span class="header-score">점수:0 / 5</span>
                    </div>

                    <h2 class="question-text">없다</h2>
                    <div class="option-list">
                        <div class="option">
                            <span>없다</span>
                        </div>
                        <div class="option">
                            <span>없다</span>
                        </div>
                        <div class="option">
                            <span>없다</span>
                        </div>
                        <div class="option">
                            <span>없다</span>
                        </div>
                    </div>
                    <div class="quiz-footer">
                        <span class="question-total">1 of 5 퀴즈</span>
                        <button class="next-btn">다음</button>
                    </div>
                </div>

                <div class="result-box">
                    <h2>퀴즈 결과</h2>
                    <div class="percentage-container">
                        <div class="circular-progress">
                            <span class="progress-value">0%</span>
                        </div>

                        <span class="score-text">너의 점수는 5개중 0개</span>
                    </div>

                    <div class="buttons">
                        <button class="tryAgain-btn">다시시도</button>  
                         <button class="goHome-btn">홈으로</button>
                    </div>
                </div>
            </section>
            <section class="home">
                <div class="home-content">
                    <h1>Quiz Website</h1>
                    <p>퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈</p>
                    <button class="start-btn">퀴즈시작</button>
                </div>
            </section>
        </div>
    </main>
    <div class="popup-info">
        <h2>Quiz Guide</h2>
        <span class="info">1. 재미로만들어봄</span>
        <span class="info">2. 버그나면 나도몰름</span>
        <span class="info">3. 이미지 넣을때 png로만 넣어야함</span>
        <span class="info">4. 개 어렵네;;</span>
        <span class="info">5. 개수맞춤용</span>

        <div class="btn-group">
            <button class="info-btn exit-btn">나가기</button>
            <a href="#" class="info-btn continue-btn">진짜 시작</a>
        </div>
    </div>
    <!-- <script> console.log("${quizList[1]}");</script> -->
    

    <!--<script src="js/questions.js"></script>-->
    <script>
  		<%= request.getAttribute("javascriptCode") %>

	</script>
    <script src="js/script.js"></script>
</body>

</html>
