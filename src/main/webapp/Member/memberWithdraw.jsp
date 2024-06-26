<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Member.MemberMgr"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 탈퇴</title>
    <script>
        function confirmWithdraw() {
        	console.log("confirmWithdraw in !!! ")
            // confirm 함수를 사용하여 경고창 표시
            var result = confirm("정말로 회원 탈퇴하시겠습니까?");
            if (result) {
                // 확인을 선택한 경우, 서버로 탈퇴 요청
                document.getElementById("withdrawForm").submit();
            } else {
                // 취소를 선택한 경우
                // 필요하다면 다른 처리를 추가할 수 있습니다.
            }
        }
    </script>
</head>
<body>
<%
String mem_id = (String) session.getAttribute("mem_id");
%>

    <h1>회원 탈퇴</h1>
    <p>회원 탈퇴하시려면 아래 버튼을 클릭하세요.</p>
    
    <!-- onClick 이벤트에 confirmWithdraw 함수 호출 추가 -->
    <button type="button" onclick="confirmWithdraw()">회원 탈퇴</button>

    <!-- 회원 탈퇴 폼 -->
    <form id="withdrawForm" action="memberWithdrawProc.jsp" method="post">
    
    
        <input type="hidden" name="mem_id" value="<%= mem_id %>">
    </form>
</body>
</html>
