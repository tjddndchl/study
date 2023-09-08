<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>join</title>
</head>
<script>
	let i = "${cnt}";
	if(i==0){
		alert("중복된아이디입니다.");
	}
</script>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp" />
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<form action="join" method="post" 
				class="needs-validation" novalidate>
					<h3 style="text-align: center; padding-bottom: 5%;
						padding-top:15%">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control"
						placeholder="아이디" name="userId" maxlength="20" required>
						<div class="invalid-feedback">아이디는 필수!!!</div>
					</div>
					<div class="form-group">
						<input type="password" class="form-control"
						placeholder="비밀번호" name="userPw" maxlength="20" required>
						<div class="invalid-feedback">패스워드는 필수!!!</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control"
						placeholder="이름" name="userNm" maxlength="20" required>
						<div class="invalid-feedback">이름는 필수!!!</div>
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="가입하기">
				</form>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/inc/footer.jsp" />
</body>
</html>