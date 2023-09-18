<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Website HTML CSS JS | Codehal</title>
    <link rel="stylesheet" href="style.css">

</head>

<body>
    <main class="main">
        <header class="header">
            <a href="#" class="logo">퀴즈.</a>
            <nav class="navbar">
                <a href="#" class="active">Home</a>
                <a href="#">검색</a>
                <a href="login.html" id="login-link">로그인</a>
                <a href="#">접촉</a>
            </nav>
        </header>

        <div class="container">
            <section class="quiz-section">
                <div class="quiz-box">
                    <h1>Codehal Quiz</h1>
                    <div class="quiz-header">
                        <span>Quiz website Tutorials</span>
                        <span class="header-score">score:0 / 5</span>
                    </div>

                    <h2 class="question-text">What does HTML stand for?</h2>
                    <div class="option-list">
                        <div class="option">
                            <span>A. Hyper Type Multi LAnguage</span>
                        </div>
                        <div class="option">
                            <span>B.Hyper Text Multiple Language</span>
                        </div>
                        <div class="option">
                            <span>C. Hyper Type Multi LAnguage</span>
                        </div>
                        <div class="option">
                            <span>D. Hyper Type Multi LAnguage</span>
                        </div>
                    </div>
                    <div class="quiz-footer">
                        <span class="question-total">1 of 5 Questions</span>
                        <button class="next-btn">Next</button>
                    </div>
                </div>

                <div class="result-box">
                    <h2>QUiz Result</h2>
                    <div class="percentage-container">
                        <div class="circular-progress">
                            <span class="progress-value">0%</span>
                        </div>

                        <span class="score-text">Your Score 0 out of 5</span>
                    </div>

                    <div class="buttons">
                        <button class="tryAgain-btn">Try Again</button>
                        <button class="goHome-btn">Go To Home</button>
                    </div>
                </div>
            </section>
            <section class="home">
                <div class="home-content">
                    <h1>Quiz Website</h1>
                    <p>퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈퀴즈</p>
                    <button class="start-btn">Start QUiz</button>
                </div>
            </section>
        </div>
    </main>
    <div class="popup-info">
        <h2>Quiz Guide</h2>
        <span class="info">1. asfsfasfasfsafsfdfdss</span>
        <span class="info">2. asdfasfasfasf12321312</span>
        <span class="info">3. asfdasfasfsads1231232</span>
        <span class="info">4. sadfsdfsd123132321321</span>
        <span class="info">5. asfsdfsfsd12312313211</span>

        <div class="btn-group">
            <button class="info-btn exit-btn">Exit Quiz</button>
            <a href="#" class="info-btn continue-btn">Continue</a>
        </div>
    </div>
    <script src="questions.js"></script>
    <script src="script.js"></script>
</body>

</html>
