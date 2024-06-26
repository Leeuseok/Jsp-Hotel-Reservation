<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="check.ReservationBean"%>
<%@ page import="check.DBConnectionMgr"%>
<jsp:useBean id="checkMgr" class="check.checkMgr" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/check.css">

</head>
<body>
	<div class="centered-container">

	<div class="check-container mt-5">
		<div class="row">
			<div class="col">
				<div class="check-card">
					<div class="check-card-header">
						<h3 class="mb-0">예약 정보</h3>
					</div>
					<div class="check-card-body">
						<%-- 여기에 기존 내용을 넣으세요 --%>

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
						reservationBean.setResev_price(room_price);
						reservationBean.setPeople(people);
						reservationBean.setMem_idx(mem_idx);

						// 데이터베이스에 INSERT
						DBConnectionMgr dbManager = new DBConnectionMgr();
						boolean insertionSuccess = checkMgr.insertReservation(reservationBean);
						%>

						<div class="mt-4">
							<%
							if (insertionSuccess) {
							%>
							<div class="check-table-container">
								<table class="check-table table-bordered">
									<!-- 테이블 헤더 추가 -->
									<thead>
										<tr>
											<th>체크인</th>
											<td><%=startdate + " - " + enddate%></td>
										</tr>
										<tr>
											<th>방 번호</th>
											<td><%=room_idx%></td>
										</tr>
										<tr>
											<th>예약금액</th>
											<td><%=room_price%></td>
										</tr>
										<tr>
											<th>인원</th>
											<td><%=people%></td>
										</tr>
									</thead>

								</table>
							</div>

							<div class="check-button-container">
								<button class="check-confirm-button"
									onclick="location.href='checkList.jsp'">예약내역확인</button>
								<button class="check-confirm-button"
									onclick="location.href='../index.jsp'">홈으로</button>
							</div>
							<%
							} else {
							%>
							<p class="check-text-danger">Reservation failed. Please try again.</p>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
