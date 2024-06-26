<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Member.MemberMgr"%>

<%
    String mem_id = request.getParameter("mem_id");

    // 회원 탈퇴 로직 수행
    MemberMgr memberMgr = new MemberMgr();
    boolean result = memberMgr.deleteMember(mem_id);

    if (result) {
        // 성공적으로 탈퇴한 경우
        session.invalidate(); // 세션 무효화
        response.getWriter().println("<script>alert('회원 탈퇴가 성공적으로 처리되었습니다.'); window.location.href = 'login.jsp';</script>");
    } else {
        // 탈퇴 실패한 경우
        response.getWriter().println("<script>alert('회원 탈퇴에 실패했습니다. 다시 시도해주세요.'); window.location.href = 'withdrawFail.jsp';</script>");
    }
%>
