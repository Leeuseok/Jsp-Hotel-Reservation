<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="reply.ReplyBean" %>
<%@ page import="reply.ReplyMgr" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/custom.css">

    <title>맛집 게시판</title>
</head>
<body>
    <%
    int room_id = 0; // 수정: bbsID를 room_id로 변경
                if (request.getParameter("room_id") != null){
                    room_id = Integer.parseInt(request.getParameter("room_id"));
                }
                int reply_idx = 0;
                if (request.getParameter("reply_idx") != null){
                    reply_idx = Integer.parseInt(request.getParameter("reply_idx"));
                }
                ReplyMgr replyDAO = new ReplyMgr();
                ReplyBean reply = replyDAO.getReply(reply_idx);
                String reply_cmt = reply.getReply_cmt(); // 수정: getUpdateComment 메서드 대신 reply 객체에서 직접 댓글 내용을 가져옴
    %>
    <div class="container" align="center">
        <div class="col-lg-10">
            <div class="jumbotron" style="padding-top: 1px;">               
                <h3><br>댓글수정창</h3>
                <form name="c_commentUpdate" action="replyUpdateAction.jsp">
                    <!-- 수정된 부분: 댓글 내용을 텍스트 박스에 표시 -->
                    <input type="hidden" value="<%=reply_idx%>" id="reply_idx" name="reply_idx">
                    <input type="text" id="reply_cmt" name="reply_cmt" style="width:400px;height:50px;" maxlength="1024" value="<%= reply_cmt %>">
                    <button>전송</button>
                    <br><br>
                    <!-- 파일 업로드를 처리하기 위한 input 추가 -->      
                </form>
            </div>
        </div>
        <div class="col-lg-10"></div>
    </div>
</body>
<script>
</script>
</html>
