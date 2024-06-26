<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<!--useBean 액션태그로 MemberMgr 객체 생성 -->
<jsp:useBean id="mgr" class="Member.MemberMgr"/>

<%-- member에서 작성한 회원 가입 내용을 bean 변수가 가르치고 있는 MemberBean 객체를 생성 --%>
<jsp:useBean id="bean" class="Member.MemberBean"/>

<%--<jsp:setProperty>액션 태그를 통해서 setXXX메소드를 호출하여 MemberBean 객체가 가지고 있는
private 변수에 입력한 값들을 저장함 --%>
<jsp:setProperty property="*" name="bean"/>

<%
		boolean result = mgr.insertMember(bean);
		String msg = "회원가입에 실패 하였습니다.";
		String location = "member.jsp";
		if(result){
			msg = "회원가입을 하였습니다.";
			location = "login.jsp";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>