<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Member.MemberBean"%>
<%@ page import="Member.MemberMgr"%>
<%@ page import="Member.DBConnectionMgr"%>


<jsp:useBean id="MemberMgr" class="Member.MemberMgr" scope="page" />

<%
// MemberMgr 객체 생성
MemberMgr memberMgr = new MemberMgr();

// 모든 회원 정보 가져오기
List<MemberBean> allMembers = memberMgr.getAllMembers();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전체 회원 정보</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>
<jsp:include page="../header.jsp" />
	<div class="container mt-5">
	
		<h2 class="mb-4">전체 회원 정보</h2>
		<%
		if (allMembers != null && !allMembers.isEmpty()) {
		%>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>ID</th>
					<th>PW</th>
					<th>이름</th>
					<th>휴대폰번호</th>
					<th>주소</th>
					<th>생년월일</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
				for (MemberBean member : allMembers) {
					String memberId = member.getMem_id();
				%>
				<tr>
					<td><%=memberId%></td>
					<td><%=member.getMem_pw()%></td>
					<td><%=member.getMem_name()%></td>
					<td><%=member.getMem_phone()%></td>
					<td><%=member.getMem_addr()%></td>
					<td><%=member.getMem_birth()%></td>
					<td>
						<button class="btn btn-danger"
							onclick="deleteMember('<%=memberId%>')">삭제</button>

					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<%
	} else {
	%>
	<p>등록된 회원이 없습니다.</p>
	<%
	}
	%>

	<br>

	<script>
		function deleteMember(memId) {

			console.log('deleteMember 호출됨');
			// AJAX 요청 생성
			var xhr = new XMLHttpRequest();

			// 취소에 성공했을 때의 처리
			xhr.onload = function() {
				if (xhr.status === 200) {
					// 취소에 성공했을 때 추가적인 처리 가능
					alert('회원 삭제 완료.');
					location.reload(); // 페이지 새로고침
				}
			};

			// 취소에 실패했을 때의 처리
			xhr.onerror = function() {
				alert('삭제 실패했습니다.');
			};

			// 서버에 보낼 데이터 설정
			var params = 'memId=' + memId;

			// 현재 페이지 URL을 기준으로 POST 요청 설정
			xhr.open('POST', 'memberMgrDelete.jsp', true);
			xhr.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');

			// 서버로 데이터 전송
			xhr.send(params);
		}
	</script>
</body>
</html>
