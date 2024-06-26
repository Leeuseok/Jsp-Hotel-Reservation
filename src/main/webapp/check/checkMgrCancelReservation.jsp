<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="check.checkMgr" %>
    
    <jsp:useBean id="checkMgr" class="check.checkMgr" scope="page" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    int resevIdx = Integer.parseInt(request.getParameter("resevIdx"));
    checkMgr.cancelReservation(resevIdx);
    response.setStatus(200); // 성공 응답
%>
</body>
</html>