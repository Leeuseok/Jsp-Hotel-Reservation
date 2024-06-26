<%@ page contentType="application/json; charset=utf-8"%>
<jsp:useBean id="mMgr" class="Member.MemberMgr" />
<%
    request.setCharacterEncoding("utf-8");
    String mem_id = request.getParameter("mem_id");
    boolean result = mMgr.checkId(mem_id);
    String msg;
    if (result) {
        msg = "이미 존재하는 ID입니다.";
    } else {
        msg = "사용 가능한 ID입니다.";
    }

    // JSON 형식으로 결과 전송
    response.setContentType("application/json");
    response.setCharacterEncoding("utf-8");
    out.print("{\"message\": \"" + msg + "\"}");
%>
