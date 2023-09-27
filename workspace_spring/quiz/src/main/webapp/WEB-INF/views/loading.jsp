<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/loading.css">
 <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>로딩중로딩중</title>
</head>
<body>
	<h1>로오딩중</h1>
    <div class="kinetic"></div>
        <script>

        // 로딩이 완료된 후 실행되는 함수
        $(document).ready(function() {
     
            $.ajax({
                url: '<%= request.getContextPath() %>/getQuiz', // 퀴즈 페이지로의 URL
                method: 'GET',
                success: function(data) {
       
                    window.location.href = '<%= request.getContextPath() %>/getQuiz';
                },
                error: function() {
                    console.log('Failed to load quiz data.');
                }
            });
        });

    </script>
</body>
</html>