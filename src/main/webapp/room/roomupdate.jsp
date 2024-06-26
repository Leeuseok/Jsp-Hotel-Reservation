<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, room.*"%>

<jsp:useBean id="RoomMgr" class="room.RoomMgr" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 정보 수정</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style>
.carousel {
	margin-top: 2vh;
	margin: 0 auto;
	overflow: hidden;
	justify-content: center;
	display: flex;
}

.carousel__item {
	width: 80%;
	height: auto;
	display: none;
	border-radius: 10px;
	border: 1px solid #ccc;
	transition: opacity 0.5s ease-in-out;
}

.carousel__item--visible {
	display: block;
	opacity: 1;
}

.carousel__item:not(.carousel__item--visible) {
	opacity: 0;
}

.grid-details {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
	gap: 1rem;
}

.grid-details img {
	height: 57px;
}

.grid-info {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 2rem;
}

.icon_div {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.grid-info p {
	font-size: 20px;
	margin-bottom: 10px;
}

.guide_txt {
	margin-top: 30px;
	padding: 25px 28px;
	background: #f8f8f8;
	flex-basis: 100%;
}

.guide_txt ul li {
	display: flex;
	align-items: center;
	margin-bottom: 4px;
	font-size: 15px;
}

.flatpickr-calendar {
	z-index: 99 !important;
}

.img-fluid {
	width: 35px;
	height: 35px;
}
.grid-details {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 1rem;
}

/* Styles for screens with a maximum width of 767px (mobile) */
@media (max-width: 767px) {
    .grid-details {
        grid-template-columns: repeat(3, 1fr); /* 3 columns on mobile */
    }
}

/* Styles for screens with a minimum width of 768px (tablet and above) */
@media (min-width: 768px) {
    .grid-details {
        grid-template-columns: repeat(6, 1fr); /* 6 columns on tablet and above */
    }
}
</style>
<%
int room_id = Integer.parseInt(request.getParameter("room_id"));
Vector<RoomBean> vinfo = RoomMgr.getRoominfo(room_id);
RoomBean RoomList = vinfo.get(0);
String[] details = RoomList.getRoom_detail().split("\\|");
%>
</head>
<body class="bg-light">
	<jsp:include page="/header.jsp" />

	<div class="container my-5">
		<form action="/MaNolja/room/updateroom_process" method="post">
			<input type="hidden" name="room_id" value="<%=RoomList.getRoom_idx()%>">
			<div class="form-group">
				<label for="room_title">방 제목</label>
				<input type="text" id="room_title" name="room_title" class="form-control" value="<%=RoomList.getRoom_title()%>">
			</div>
			<div class="form-group">
				<label for="room_people">객실 인원</label>
				<input type="number" id="room_people" name="room_people" class="form-control" value="<%=RoomList.getRoom_people()%>">
			</div>
			<div class="form-group">
				<label for="room_area">객실면적</label>
				<input type="text" id="room_area" name="room_area" class="form-control" value="<%=RoomList.getRoom_area()%>">
			</div>
			<div class="form-group">
				<label for="room_map">배치도</label>
				<input type="text" id="room_map" name="room_map" class="form-control" value="<%=RoomList.getRoom_map()%>">
			</div>
			<div class="form-group">
				<label for="room_num">객실 수</label>
				<input type="number" id="room_num" name="room_num" class="form-control" value="<%=RoomList.getRoom_kind()%>">
			</div>
			<div class="form-group">
				<label for="room_num">가격</label>
				<input type="number" id="room_price" name="room_price" class="form-control" value="<%=RoomList.getRoom_price()%>">
			</div>
			<div class="form-group">
				<label for="room_num">이용 안내</label>
				<input type="text" id="room_guide" name="room_guide" class="form-control" value="<%=RoomList.getRoom_guide()%>">
			</div>
			<div class="form-group">
				<label for="room_num">객실 상세정보</label>
				<input type="text" id="room_detail" name="room_detail" class="form-control" value="<%=RoomList.getRoom_detail()%>">
			</div>
			<button type="submit" class="btn btn-primary">수정하기</button>
		</form>
	</div>

	<jsp:include page="/footer.jsp" />
</body>
</html>