<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Member.MemberBean"%>
<%@ page import="Member.MemberMgr"%>

<%
String mem_id = (String) session.getAttribute("mem_id");

if (mem_id == null) {
	response.sendRedirect("login.jsp");
} else {
	MemberMgr memberMgr = new MemberMgr();
	MemberBean memberInfo = memberMgr.getMemberInfo(mem_id);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보 수정</title>
<style>
</style>
</head>
<body>
	<form action="memberUpdateProc.jsp" method="post">
		<h1>회원 정보 수정</h1>

		<!-- 기존 회원 정보 표시 -->
		<p>
			아이디
			<input type="hidden" id="newId" name="newId"
				value="<%=memberInfo.getMem_id()%>">
			<%=memberInfo.getMem_id()%></p>
		<p>
			비밀번호   <input type="password" id="newPw" name="newPw"
				value="<%=memberInfo.getMem_pw()%>">
		</p>
		<p>
			이름
			<input type="hidden" id="newName" name="newName"
				value="<%=memberInfo.getMem_name()%>">
			<%=memberInfo.getMem_name()%></p>
		<p>
			휴대폰  <input type="text" id="newPhone" name="newPhone"
				value="<%=memberInfo.getMem_phone()%>">
		</p>

		<p>
			주소  <input type="text" id="newAddr" name="newAddr"
				value="<%=memberInfo.getMem_addr()%>">
		</p>
		<p>
			생년월일
			<input type="hidden" id="newBirth" name="newBirth"
				value="<%=memberInfo.getMem_birth()%>">
			<%=memberInfo.getMem_birth()%></p>
		<input type="submit" value="수정">
	</form>
</body>
</html>

<%
}
%>
