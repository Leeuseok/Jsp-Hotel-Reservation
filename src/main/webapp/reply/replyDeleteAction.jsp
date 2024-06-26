<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reply.ReplyBean"%>
<%@ page import="reply.ReplyMgr"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>맛집 게시판</title>
</head>
<body>
    <%
    // 현재 세션에 저장된 사용자 이름을 가져옴
                String mem_id = null;
                if (session.getAttribute("mem_id") != null) {
                    mem_id = (String) session.getAttribute("mem_id");
                }
                
                
                // 로그인 여부 확인
                if (mem_id == null) {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('로그인을 하세요.')");
                    script.println("location.href = 'login.jsp'");
                    script.println("</script>");
                } 

                // 삭제할 댓글의 review_idx와 reply_idx 가져오기
                int review_idx = 0; // 수정: bbsID를 review_idx로 변경
                if (request.getParameter("review_idx") != null) {
                    review_idx = Integer.parseInt(request.getParameter("review_idx"));
                }

                int reply_idx = 0;
                if (request.getParameter("reply_idx") != null) {
                    reply_idx = Integer.parseInt(request.getParameter("reply_idx"));
                }

                // reply_idx가 0이면 유효하지 않은 댓글로 판단
                if (reply_idx == 0) {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('유효하지 않은 댓글 입니다.')");
                    script.println("history.back()");
                    script.println("</script>");
                }

                // 댓글 DAO를 통해 해당 댓글 정보 가져오기
                ReplyMgr replyDAO = new ReplyMgr();
                ReplyBean reply = replyDAO.getReply(reply_idx);

                // 현재 로그인한 사용자와 댓글 작성자가 일치하는지 확인
                if (!mem_id.equals(reply.getMem_id())) {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('권한이 없습니다.')");
                    script.println("history.back()");
                    script.println("</script>");
                } else {
                    // 댓글 삭제 수행
                    int result = replyDAO.delete(reply_idx);
                    if (result == -1) {
                        // 댓글 삭제 실패 시
                        PrintWriter script = response.getWriter();
                        script.println("<script>");
                        script.println("alert('댓글 삭제에 실패했습니다')");
                        script.println("history.back()");
                        script.println("</script>");
                    } else {
                        // 댓글 삭제 성공 시 해당 댓글에 첨부된 이미지도 삭제
                        PrintWriter script = response.getWriter();
                        // 이전 페이지로 이동
                        script.println("<script>");
                        script.println("location.href=document.referrer;");
                        script.println("</script>");
                    }
                }
    %>
</body>
</html>
