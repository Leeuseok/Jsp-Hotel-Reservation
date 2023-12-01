<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="reply.ReplyMgr"%> 
<%@ page import="reply.ReplyBean"%>
<%@ page import="review.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>댓글</title>
    <!-- Bootstrap CSS link -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<%
    String mem_id = null;
    if (session.getAttribute("mem_id") != null) {
        mem_id = (String) session.getAttribute("mem_id");
    }
    int room_id = 0;
    if (request.getParameter("room_id") != null){
        room_id = Integer.parseInt(request.getParameter("room_id"));
    }
    if (room_id == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다.')");
        script.println("location.href = '../member/login.jsp'");
        script.println("</script>");
    }
    ReplyBean reply = new ReplyMgr().getReply(room_id);
%>
    <div class="container mt-4">
        <h4 class="mb-4">후기</h4>
        <%
        ReplyMgr replyDAO = new ReplyMgr();
        ArrayList<ReplyBean> list = replyDAO.getList(room_id);
        for (int i = 0; i < list.size(); i++) {
        %>
        <div class="card mb-4">
            <div class="card-header">
                <%=list.get(i).getMem_id()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=list.get(i).getCreated_at()%>
                <% if (list.get(i).getMem_id() != null && list.get(i).getMem_id().equals(mem_id)) { %>
                <div class="float-right">
                    <a onclick="nwindow(<%=room_id%>, <%=list.get(i).getReply_idx()%>)" class="btn  btn-sm">수정</a>
                    <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="../reply/replyDeleteAction.jsp?room_id=<%=room_id%>&reply_idx=<%=list.get(i).getReply_idx()%>" class="btn  btn-sm">삭제</a>
                </div>
                <% } %>
            </div>
            <div class="card-body">
                <%=list.get(i).getReply_cmt()%>
            </div>
        </div>
        <% } %>
        <h5 class="mb-3">후기 작성</h5>
        <form method="post" action="../reply/replyAction.jsp?room_id=<%=room_id%>">
            <div class="form-group">
                <label for="reply_cmt"><%=mem_id%></label>
                <textarea class="form-control" id="reply_cmt" rows="3" name="reply_cmt" placeholder="고객님의 후기를 남겨주세요."></textarea>
            </div>
            <input type="submit" class="btn btn-dark float-right"" value="후기 작성">
        </form>
    </div>
    <script type="text/javascript">
        function nwindow(room_id, reply_idx) {
            window.name = "commentParant";
            var url = "../reply/replyUpdate.jsp?room_id=" + room_id + "&reply_idx=" + reply_idx;
            window.open(url, "댓글 수정", "width=500, height=300");
        }
    </script>
</body>
</html>