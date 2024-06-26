<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="reply.*" %>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!-- 댓글 객체를 사용하기 위해 빈(bean)을 선언하고 설정 -->
<jsp:useBean id="comment" class="reply.ReplyBean" scope="page" />
<jsp:setProperty name="comment" property="reply_cmt" /> <!-- 수정: commentText를 reply_cmt로 변경 -->

<%
// 현재 세션에 저장된 사용자 이름을 가져옴
    String mem_id = null; // 수정: userID를 mem_id으로 변경
    if(session.getAttribute("mem_id") != null){
        mem_id = (String) session.getAttribute("mem_id");
    }

    // 로그인 여부 확인
    if(mem_id == null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 해주세요.')");
        script.println("location.href = '../member/login.jsp'");
        script.println("</script>");
    } else {
        int room_id = 0; // 수정: bbsID를 room_id로 변경
        if (request.getParameter("room_id") != null){
            room_id = Integer.parseInt(request.getParameter("room_id"));
        }

        // room_id가 0이면 유효하지 않은 글로 판단
        if (room_id == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글입니다.')");
            script.println("location.href = '../member/login.jsp'");
            script.println("</script>");
        }

        // 댓글 내용이 비어있는지 확인
        String reply_cmt = comment.getReply_cmt();
        if (reply_cmt == null || reply_cmt.trim().isEmpty()){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else {
            // 댓글 작성 DAO 호출
            ReplyMgr replyDAO = new ReplyMgr();
            int reply_idx = replyDAO.write(room_id, reply_cmt, mem_id);

            if (reply_idx == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('댓글 쓰기에 실패했습니다.')");
                script.println("history.back()");
                script.println("</script>");
            } else {
                PrintWriter script = response.getWriter();
                // 댓글 작성 성공 시 이전 페이지로 이동
                script.println("<script>");
                script.println("location.href=document.referrer;");
                script.println("</script>");
            }
        }
    }
%>
</body>
</html>
