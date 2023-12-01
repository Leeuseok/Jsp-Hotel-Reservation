<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"%>
<%@ page import="check.ReservationBean"%>
<%@ page import="check.DBConnectionMgr"%>
<%@ page import="check.checkMgr"%>
<%@ page import="Member.MemberBean"%>
<%@ page import="Member.MemberMgr"%>


<jsp:useBean id="checkMgr" class="check.checkMgr" scope="page" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Reservation Check List</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">




</head>
<body>
	<%


	int mem_idx = (int) session.getAttribute("mem_idx");
	String mem_id = (String) session.getAttribute("mem_id");

	if (mem_id == null) {
		response.sendRedirect("/login.jsp");
	} else {
		MemberMgr memberMgr = new MemberMgr();
		MemberBean memberInfo = memberMgr.getMemberInfo(mem_id);
		String mem_name = memberInfo.getMem_name();
		
		
	Vector<ReservationBean> checkList = checkMgr.getCheckList(mem_idx);
	%>

	<div class="container mt-5">
		<h2 class="mb-4">
			
			<%=mem_name%> 님의 예약 정보
		</h2>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>예약번호</th>
					<th>방번호</th>
					<th>체크인</th>
					<th>체크아웃</th>
					<th>예약일시</th>
					<th>인원</th>
					<th>예약금액</th>
					<th>취소</th>

				</tr>
			</thead>
			<tbody>
				<%
				for (ReservationBean bean : checkList) {
				%>
				<tr>
					<td><%=bean.getResev_idx()%></td>
					<td><%=bean.getRoom_idx()%></td>
					<td><%=bean.getStart_date()%></td>
					<td><%=bean.getEnd_date()%></td>
					<td><%=bean.getResev_at()%></td>
					<td><%=bean.getPeople()%></td>
					<td><%=bean.getResev_price()%></td> 
					<!-- 삭제 버튼 부분 수정 -->
					<td>
						<button class="btn btn-danger"
							onclick="cancelReservation(<%=bean.getResev_idx()%>)">예약취소</button>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<script>
	console.log("test");
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
        xhr.open('POST', 'checkMgrCancelReservation.jsp', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

        // 서버로 데이터 전송
        xhr.send(params);
    }
</script>



</body>
</html>

<%
}
%>