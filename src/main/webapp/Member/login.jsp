<%@ page contentType="text/html; charset=utf-8" %>
<%
    request.setCharacterEncoding("utf-8");
    String mem_id = (String) session.getAttribute("mem_id");
%>
<html>
<head>
    <jsp:include page="/header.jsp" />
    <title>로그인</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/login.css">
    <script type="text/javascript">
        function loginCheck() {
            if (document.loginFrm.mem_id.value == "") {
                alert("아이디를 입력해 주세요.");
                document.loginFrm.mem_id.focus();
                return;
            }
            if (document.loginFrm.mem_pw.value == "") {
                alert("비밀번호를 입력해 주세요.");
                document.loginFrm.mem_pw.focus();
                return;
            }
            document.loginFrm.submit();
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto login-container">
                    <div class="login-title">
                        <h4>로그인</h4>
                    </div>
                    <form name="loginFrm" method="post" action="loginProc.jsp">
                        <div class="form-group">
                            <input type="text" class="form-control" name="mem_id" placeholder="아이디">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="mem_pw" placeholder="비밀번호">
                        </div>
                        <button type="button" class="btn btn-black text-dark login-btn" onclick="loginCheck()">로그인</button>
                        <button type="button" class="btn btn-black text-dark login-btn" onclick="location.href='member.jsp'">회원가입</button>
                    </form>
            </div>
        </div>
    </div>
    <jsp:include page="/footer.jsp" />
</body>
</html>
