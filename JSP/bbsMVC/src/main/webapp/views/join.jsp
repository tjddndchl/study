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
		alert("�ߺ��Ⱦ��̵��Դϴ�.");
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
						padding-top:15%">ȸ������ ȭ��</h3>
					<div class="form-group">
						<input type="text" class="form-control"
						placeholder="���̵�" name="userId" maxlength="20" required>
						<div class="invalid-feedback">���̵�� �ʼ�!!!</div>
					</div>
					<div class="form-group">
						<input type="password" class="form-control"
						placeholder="��й�ȣ" name="userPw" maxlength="20" required>
						<div class="invalid-feedback">�н������ �ʼ�!!!</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control"
						placeholder="�̸�" name="userNm" maxlength="20" required>
						<div class="invalid-feedback">�̸��� �ʼ�!!!</div>
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="�����ϱ�">
				</form>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/inc/footer.jsp" />
</body>
</html>