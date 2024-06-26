
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="mMgr" class="Member.MemberMgr"/>
<%
    request.setCharacterEncoding("utf-8");

    String mem_id = request.getParameter("mem_id");
    String mem_pw = request.getParameter("mem_pw");
    String url = "login.jsp";
    String msg = "로그인에 실패 하였습니다.";

    // 변경된 isAdmin 메서드 사용
    boolean isAdmin = mMgr.isAdmin(mem_id, mem_pw);
    int idx = mMgr.loginMember(mem_id, mem_pw);
    if (isAdmin) {
       session.setAttribute("mem_id", mem_id);
       session.setAttribute("mem_idx", 1);
        url = "../index.jsp";
        msg = "관리자로 로그인하였습니다.";
    } else {
       if (idx != -1) {
            // 로그인 성공 시 idx 값을 세션에 저장
            session.setAttribute("mem_id", mem_id);
            session.setAttribute("mem_idx", idx);
            url = "../index.jsp";
            msg = "로그인에 성공 하였습니다.";
        }
    }
%>
<script>
    alert("<%=msg%>");
    location.href="<%=url%>";
</script>
 