<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Member.MemberMgr"%>

<jsp:useBean id="MemberMgr" class="Member.MemberMgr" scope="page" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String memId = (String) request.getParameter("memId");
	MemberMgr.deleteMember(memId);
	response.setStatus(200); // 성공 응답
	%>
</body>
</html>
