<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/header.css">
</head>

<%
// 세션에서 로그인 여부 확인
String mem_id;
mem_id = (String) session.getAttribute("mem_id");
boolean loggedIn = false;
boolean isAdmin = false;

if (mem_id != null) {
   loggedIn = true;
   

} 
if ("admin".equals(mem_id)) {
    loggedIn = true;
    isAdmin = true;
}
%>

<nav class="navbar navbar-expand-lg p-4">
   <div class="container">
      <a class="navbar-brand font-weight-bold" style="color: #000;"
         href="<%=request.getContextPath()%>/index.jsp">Manolja Hotel</a>
      <div class="collapse navbar-collapse">
         <ul class="navbar-nav ml-auto">
            <%-- Check if the user is logged in --%>
            <%
            if (loggedIn) {
            %>
            <li class="nav-item"><a class="nav-link text-dark"
               id="logoutLink"
               href="<%=request.getContextPath()%>/Member/logout.jsp">Logout</a>
            </li>
            <%
            if (isAdmin) {
            %>
            <li class="nav-item"><a class="nav-link text-dark"
               id="adminLink"
               href="<%=request.getContextPath()%>/Member/admin_memberInfo.jsp">Member</a>
            </li>
            <%
            } else {
            %>
            <li class="nav-item"><a class="nav-link text-dark"
               id="mypageLink"
               href="<%=request.getContextPath()%>/Member/memberInfo.jsp">MyPage
            </a></li>
            <%
            }
            %>

            <%
            } else {
            %>
            <li class="nav-item"><a class="nav-link text-dark"
               id="loginLink"
               href="<%=request.getContextPath()%>/Member/login.jsp">Login</a></li>
            <li class="nav-item"><a class="nav-link text-dark"
               id="signinLink"
               href="<%=request.getContextPath()%>/Member/member.jsp">Sign in</a>
            </li>
            <%
            }
            %>
            <li class="nav-item"><a class="nav-link text-dark"
               id="roomLink"
               href="<%=request.getContextPath()%>/room/roomlist.jsp">Room</a></li>
            <li class="nav-item"><a class="nav-link text-dark"
               id="reviewLink" href="<%=request.getContextPath()%>/review/reviews.jsp">Review</a>
            </li>

         </ul>
      </div>
   </div>
</nav>
