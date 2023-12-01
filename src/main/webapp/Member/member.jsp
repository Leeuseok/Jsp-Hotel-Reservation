<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>회원가입</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="mem_script.js"></script>
<link rel="stylesheet" href="../css/member.css">
</head>
<body onLoad="regFrm.mem_id.focus()">
	<jsp:include page="../header.jsp" />
	<form name="regFrm" method="post" action="memberProc.jsp" class="mt-4">
		<div class="centered-group">
			<div class="member-title">
				<h4>회원가입</h4>
			</div>
			<div class="form-group reg">
				<input type="text" name="mem_id" class="form-control"
					placeholder="아이디" required>
				<button type="button" class="btn btn-light btn-custom"
					onclick="idCheck(this.form.mem_id.value)">ID 중복확인</button>

			</div>
			<div class="form-group reg">
				<input type="password" name="mem_pw" class="form-control"
					placeholder="비밀번호" required>
			</div>
			<div class="form-group reg">
				<input type="password" name="repw" class="form-control"
					placeholder="비밀번호 확인" required>
			</div>
			<div class="form-group reg">
				<input type="text" name="mem_name" class="form-control"
					placeholder="이름" required>
			</div>
			<div class="form-group reg">
				<input type="text" name="mem_phone" class="form-control"
					placeholder="휴대폰 번호 (숫자만)" required>
			</div>
			<div class="form-group reg">
				<input type="text" name="mem_addr" class="form-control"
					placeholder="주소" required>
			</div>
			<div class="form-group reg">
				<input type="text" name="mem_birth" class="form-control"
					placeholder="생년월일 ex.19990123" required>
			</div>
		</div>

		<div class="button-container">
			<button type="button" class="btn " onclick="inputCheck()">회원가입</button>

		</div>

	</form>
	<jsp:include page="../footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>