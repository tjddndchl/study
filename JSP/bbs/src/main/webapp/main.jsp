<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">게시판</a>
			<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarContent"
					aria-controls="navbarContent" aria-expanded="false"
					aria-label="Toggle naviation">
					<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarContent">
				<ul class="navbar-nav me-auto mb-lg-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page"
							href="main.jsp">메인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="bbs.jsp">게시판</a>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-righ">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#"
							role="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							접속하기
						</a>
						<ul class="dropdown-menu">
							<li>
								<a class="dropdown-item" href="login.jsp">로그인</a>
							</li>
								<hr class="dropdown-divider">
							<li>
								<a class="dropdown-item" href="join.jsp">회원가입</a>
							</li>
						</ul>
					</li>
				</ul>
				
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				main 입니다.
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
</body>
</html>