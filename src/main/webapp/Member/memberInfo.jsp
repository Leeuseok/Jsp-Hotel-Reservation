<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Member.MemberBean"%>
<%@ page import="Member.MemberMgr"%>
<%@ page import="check.checkMgr"%>

<%
String mem_id = (String) session.getAttribute("mem_id");

if (mem_id == null) {
	response.sendRedirect("login.jsp");
} else {
	MemberMgr memberMgr = new MemberMgr();
	MemberBean memberInfo = memberMgr.getMemberInfo(mem_id);
	String mem_name = memberInfo.getMem_name();
%>
<jsp:useBean id="checkMgr" class="check.checkMgr" scope="page" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
}

#main {
	display: flex;
	margin: 8%;
}

#sidebar {
	background-color: white;
	padding: 40px;
	width: 250px;
	height: 600px;
}

#content1, #content2, #content3, #content4, #content5 {
	display: none;
	padding: 20px;
	padding: 3px 20px; /* 40px은 위쪽 여백, 20px은 좌우 여백 */
	background-color: white;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	flex: 1;
	height: max-content;
}

#sidebar h2 {
	color: #333;
	padding-bottom: 10px;
}

#sidebar a {
	display: block;
	margin-bottom: 10px;
	color: #333;
	text-decoration: none;
	transition: color 0.3s;
	cursor: pointer;
}

#sidebar a:hover {
	color: #007bff;
}

#content h1, #content1 h4, #content2 h4, #content3 h1, #content4 h4,
	#content5 h4 {
	color: #333;
	align-items: center;
}
#content3, #content4 {
    text-align: left;
}

#content5 {
    text-align: center;
}
#content3 p {
    color: #555;
}

#content5 h4 {
    text-align: center;
}

#content a {
	color: #007bff;
	text-decoration: none;
	transition: color 0.3s;
}

#content a:hover {
	color: #0056b3;
}

#sub div {
	position: relative;
}

#sub div img {
	display: block;
	margin: 0 auto; /* 이미지를 가로 중앙에 위치시킴 */
}

#sub div p {
	position: absolute;
	top: 50%; /* 상단 위치를 부모 요소의 50%로 설정 */
	left: 50%; /* 좌측 위치를 부모 요소의 50%로 설정 */
	transform: translate(-50%, -50%); /* 텍스트를 수평 및 수직으로 중앙에 위치시킴 */
	color: #FFFFFF;
	font-size: 50px;
}
</style>
</head>
<body>
	<div id="header">
		<jsp:include page="../header.jsp" />
	</div>
	<div id="sub">
		<div>
			<img src="../img/info.jpg" alt="이미지 설명">
			<p>MyPage</p>
		</div>
	</div>


	<div id="main">

		<div id="sidebar">
			<h2><%=mem_name%>님
			</h2>
			<hr>
			<h4>예약 확인</h4>
			<a href="#" onclick="showContent1()">예약 내역</a> <br>
			<h4>개인 정보 관리</h4>
			<a href="#" onclick="showContent3()">회원 정보</a> <a href="#"
				onclick="showContent4()">회원 정보 수정</a> <a href="#"
				onclick="showContent5()">회원 탈퇴</a>
		</div>
		<div id="content1">
			<h4>예약 내역</h4>
		</div>
		<div id="content2">
			<h4>예약 취소</h4>
		</div>
		<div id="content3">
			<h1>회원 정보</h1>
			<p>
				아이디
				<%=memberInfo.getMem_id()%></p>
			<p>
				비밀번호
				<%=memberInfo.getMem_pw()%></p>
			<p>
				이름
				<%=memberInfo.getMem_name()%></p>
			<p>
				휴대폰
				<%=memberInfo.getMem_phone()%></p>
			<p>
				주소
				<%=memberInfo.getMem_addr()%></p>
			<p>
				생년월일
				<%=memberInfo.getMem_birth()%></p>

		</div>

		<div id="content4">
			<h4>회원 정보 수정</h4>
		</div>
		<div id="content5">
			<h4>회원 탈퇴</h4>
		</div>

	</div>
	<div id="footer">
		<jsp:include page="../footer.jsp" />
	</div>

	<script>
		showContent1();
		function showContent1() {
			// AJAX를 사용하여 memberUpdate.jsp의 내용을 불러옴
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					// content1에 내용 표시
					document.getElementById("content1").innerHTML = this.responseText;
				}
			};
			xhttp.open("GET", "../check/checkList.jsp", true);
			xhttp.send();

			hideAllContent();

			// content1
			document.getElementById("content1").style.display = "block";
		}

		function showContent2() {
			hideAllContent();
			document.getElementById("content2").style.display = "block";
		}

		function showContent3() {
			hideAllContent();
			document.getElementById("content3").style.display = "block";
		}

		function showContent4() {
			// AJAX를 사용하여 memberUpdate.jsp의 내용을 불러옴
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					// content4에 내용 표시
					document.getElementById("content4").innerHTML = this.responseText;
				}
			};
			xhttp.open("GET", "memberUpdate.jsp", true);
			xhttp.send();

			// 모든 content 숨기기
			hideAllContent();

			// content4 표시
			document.getElementById("content4").style.display = "block";
		}

		function showContent5() {
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					// content4에 내용 표시
					document.getElementById("content5").innerHTML = this.responseText;
				}
			};
			xhttp.open("GET", "memberWithdraw.jsp", true);
			xhttp.send();

			// 모든 content 숨기기
			hideAllContent();

			// content4 표시
			document.getElementById("content5").style.display = "block";
		}

		function hideAllContent() {
			document.getElementById("content1").style.display = "none";
			document.getElementById("content2").style.display = "none";
			document.getElementById("content3").style.display = "none";
			document.getElementById("content4").style.display = "none";
			document.getElementById("content5").style.display = "none";
		}
		
		
	    function cancelReservation(resevIdx) {
	        // AJAX 요청 생성
	        var xhr = new XMLHttpRequest();

	        // 취소에 성공했을 때의 처리
	        xhr.onload = function () {
	            if (xhr.status === 200) {
	                // 취소에 성공했을 때 추가적인 처리 가능
	                alert('예약이 취소되었습니다.');
	                location.reload(); // 페이지 새로고침
	            }
	        };

	        // 취소에 실패했을 때의 처리
	        xhr.onerror = function () {
	            alert('취소에 실패했습니다.');
	        };

	        // 서버에 보낼 데이터 설정
	        var params = 'resevIdx=' + resevIdx;

	        // 현재 페이지 URL을 기준으로 POST 요청 설정
	        xhr.open('POST', '../check/checkMgrCancelReservation.jsp', true);
	        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

	        // 서버로 데이터 전송
	        xhr.send(params);
	    }
	</script>
	
	<script>
        function confirmWithdraw() {
        	console.log("confirmWithdraw in !!! ")
            // confirm 함수를 사용하여 경고창 표시
            var result = confirm("정말로 회원 탈퇴하시겠습니까?");
            if (result) {
            	console.log("result is true");
                // 확인을 선택한 경우, 서버로 탈퇴 요청
                document.getElementById("withdrawForm").submit();
            } else {
                // 취소를 선택한 경우
                // 필요하다면 다른 처리를 추가할 수 있습니다.
            	console.log("result is false");
            }
        }
    </script>
    
</body>
</html>

<%
}
%>
