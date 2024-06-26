<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="check.ReservationBean"%>
<%@ page import="check.DBConnectionMgr"%>

<jsp:useBean id="checkMgr" class="check.checkMgr" scope="page"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.table-container {
	display: flex;
	align-items: flex-start;
}

table {
	border-collapse: collapse;
	width: 50%;
	margin-top: 20px;
}

th, td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

th {
	background-color: #f2f2f2;
}

.button-container {
	margin-top: 20px;
	margin-left: 20px; /* 표와 버튼 간의 간격 조절 */
	align-self: center; /* 버튼을 세로 중앙에 정렬 */
}

.confirm-button {
	padding: 10px;
	font-size: 16px;
	cursor: pointer;
}
</style>
</head>
<body>

	<h2>BOOKING</h2>

	<%
	// 폼에서 전송된 파라미터 값을 얻어옴
	String startdate = request.getParameter("start_date");
	String enddate = request.getParameter("end_date");
	int room_idx = Integer.parseInt(request.getParameter("room_id"));
	int room_price = Integer.parseInt(request.getParameter("room_price"));
	int people = Integer.parseInt(request.getParameter("people"));
	int mem_idx;

	Object memIdxObj = session.getAttribute("mem_idx");
	mem_idx = (int) memIdxObj;
	// ReservationBean 객체 생성
	ReservationBean reservationBean = new ReservationBean();
	
	reservationBean.setEnd_date(enddate);
	reservationBean.setStart_date(startdate);
	reservationBean.setRoom_idx(room_idx);
	reservationBean.setRoom_price(room_idx);
	reservationBean.setPeople(people);
	reservationBean.setMem_idx(mem_idx);
	
	
	

	// 데이터베이스에 INSERT
	DBConnectionMgr dbManager = new DBConnectionMgr();
	boolean insertionSuccess = checkMgr.insertReservation(reservationBean);

	if (insertionSuccess) {
	%>
	<div class="table-container">
		<table>
			<tr>
				<th>Date</th>
				<th>Room Index</th>
				<th>Room Price</th>
				<th>Room People</th>

			</tr>
			<tr>
				<td><%=startdate + " - " + enddate%></td>
				<td><%=room_idx%></td>
				<td><%=room_price%></td>
				<td><%=people%></td>

			</tr>
		</table>

		<div class="button-container">
			<button class="confirm-button" onclick="location.href=NewFile.jsp">돌아가기</button>
		</div>
	</div>
	<%
	} else {
	out.println("Reservation failed. Please try again.");
	}
	%>

</body>
</html>