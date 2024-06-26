<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, room.*"%>

<jsp:useBean id="RoomMgr" class="room.RoomMgr" scope="page" />
<!DOCTYPE html>
<html>
<head>
	<%
	request.setCharacterEncoding("utf-8");
	String start_date = request.getParameter("startDate");
	String end_date = request.getParameter("endDate");
	String people = request.getParameter("people");
	%>
<meta charset="UTF-8">
<title>방 자세히 보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="animation.js"></script>
<link rel="stylesheet" href="../css/room_detail.css">
<script>
window.addEventListener('DOMContentLoaded', function() {
	var items = document.querySelectorAll('.carousel__item');
	var prevBtn = document.querySelector('.prev');
	var nextBtn = document.querySelector('.next');
	var index = 0;

	function updateCarousel() {
		items.forEach(function(item, i) {
			item.classList.toggle('carousel__item--visible', i === index);
		});
	}

	prevBtn.addEventListener('click', function() {
		index = (index - 1 + items.length) % items.length;
		updateCarousel();
	});

	nextBtn.addEventListener('click', function() {
		index = (index + 1) % items.length;
		updateCarousel();
	});

	updateCarousel();
	setInterval(function() {
		index = (index + 1) % items.length;
		updateCarousel();
	}, 3000);

	// Flatpickr 설정
	var fp = flatpickr("#datePickerBtn", {
		mode: "range",
		dateFormat: "Y-m-d",
		onChange: function(selectedDates, dateStr, instance) {
			if (selectedDates.length === 2) {
				var start = instance.formatDate(selectedDates[0], "Y-m-d");
				var end = instance.formatDate(selectedDates[1], "Y-m-d");

				// 날짜를 hidden input 요소에 설정
				document.getElementById('startDate').value = start;
				document.getElementById('endDate').value = end;

				// 날짜를 버튼의 텍스트로 설정
				document.getElementById('datePickerBtn').textContent = start + ' - ' + end;

				instance.close();
			}
		},
		defaultDate: [<%= start_date == null ? "" : "\"" + start_date + "\"" %>, <%= end_date == null ? "null" : "\"" + end_date + "\"" %>]
	});

	document.getElementById('datePickerBtn').addEventListener('click', function() {
		fp.open();
	});
	
	// 인원 선택 드롭다운 메뉴 설정
	var peopleSelect = document.getElementById('peopleSelect');
	peopleSelect.value = "<%= people == null ? "0" : people %>";
	peopleSelect.addEventListener('change', function() {
		document.getElementById('people').value = this.value;
	});
	
	<%
	String isLogin = (String) session.getAttribute("mem_id");
	String mem_id = (String) session.getAttribute("mem_id");
	%>
	// 예약 버튼 클릭 시 로그인 여부 확인
	document.getElementById('reservationBtn').addEventListener('click', function() {
		<% if (isLogin != null) { %>
			// 로그인한 경우, 예약 페이지로 이동
			document.getElementById('checkform').submit();
		<% } else {
			%>
			// 로그인하지 않은 경우, 알림창 표시
			alert("로그인을 해주세요.");
		<% } %>
		
	});
});
</script>
</head>
<body class="bg-light">
	<jsp:include page="/header.jsp" />
	<%
	int room_id = Integer.parseInt(request.getParameter("room_id"));
	Vector<RoomBean> vinfo = RoomMgr.getRoominfo(room_id);
	RoomBean RoomList = vinfo.get(0);
	String[] details = RoomList.getRoom_detail().split("\\|");
	%>
<div id="fullpage">
    <div class="section">
        <div class="slide carousel mt-2 border-2 border-gray-200 rounded-lg" style="position: relative;">
            <img class="carousel__item carousel__item--visible"
                src="/MaNolja/img/<%=RoomList.getRoom_title()%>1.jpg" alt="객실 사진">
            <img class="carousel__item"
                src="/MaNolja/img/<%=RoomList.getRoom_title()%>2.jpg" alt="객실사진2">
            <img class="carousel__item"
                src="/MaNolja/img/<%=RoomList.getRoom_title()%>3.jpg" alt="객실사진3">
            <button class="prev" style="position: absolute; top: 48%; right: 10px; background: transparent; padding: 10px; border: none;">
                <img src="https://cdn-icons-png.flaticon.com/512/271/271228.png" alt="Previous" style="width: 24px; height: 24px;">
            </button>
            <button class="next" style="position: absolute; top: 48%; left: 10px; background: transparent; padding: 10px; border: none;">
                <img src="https://cdn-icons-png.flaticon.com/512/271/271228.png" alt="Next" style="width: 24px; height: 24px; transform: rotate(180deg);">
            </button>
        </div>
    </div>
</div>
	<div class="container my-5">
<div class="d-flex align-items-center justify-content-end">
<button id="datePickerBtn" class="btn btn-outline-secondary mr-3">
	<%=start_date == null || end_date == null ? "입실/퇴실 날짜 선택" : start_date + " - " + end_date %>
	</button>
	<form action="/MaNolja/check/check.jsp" method="POST" id="checkform">	
<select id="peopleSelect" class="btn btn-outline-secondary mr-3" id="people" name="people">
	<option selected value="0">인원 선택</option>
	<option value="1" <%= people != null && people.equals("1") ? "selected" : "" %>>1명</option>
	<option value="2" <%= people != null && people.equals("2") ? "selected" : "" %>>2명</option>
	<option value="3" <%= people != null && people.equals("3") ? "selected" : "" %>>3명</option>
	<option value="4" <%= people != null && people.equals("4") ? "selected" : "" %>>4명</option>
</select>
		<input type="hidden" name="room_id" value="<%=RoomList.getRoom_idx()%>">
		<input type="hidden" id="startDate" name="start_date" value="<%=start_date%>">
		<input type="hidden" id="endDate" name="end_date" value="<%=end_date%>">
		<input type="hidden" id="room_price" name="room_price" value="<%=RoomList.getRoom_price() %>">
		<button type="button" id="reservationBtn" class="btn btn-danger">예약하기</button>
	</form>
</div>
		<p class="text-danger h4 mb-4">
			₩ <%=RoomList.getRoom_price() %>
		</p>
		<div class="row">
			<div class="col-md-6">
				<p>
					<strong>객실 인원:</strong> <%=RoomList.getRoom_people()%>명
				</p>
				<p>
					<strong>객실 면적:</strong> <%=RoomList.getRoom_area()%>
				</p>
			</div>
			<div class="col-md-6">
				<p>
					<strong>배치:</strong> <%=RoomList.getRoom_map()%>
				</p>
				<p>
					<strong>객실 수:</strong> <%=RoomList.getRoom_num()%>개
				</p>
			</div>
		</div>
		<div class="row">
		    <%
		    int counter = 1;
		    for (String detail : details) {
		    %>
		    <div class="col-4 col-md-2 text-center">
		        <img src="/MaNolja/img/icon_service0<%=counter%>.svg" class="img-fluid mx-auto d-block" alt="<%=detail.trim()%>">
		        <p><%=detail.trim()%></p>
		    </div>
		    <%
		    counter++;
		    }
		    %>
		</div>
		<div class="bg-light p-4 mt-3">
			<h3>
				<strong>이용안내:</strong>
			</h3>
			<ul class="list-unstyled room_guide">
                <li><%=RoomList.getRoom_guide()%></li>
                <li>예약 및 문의는 053)602-7173으로 문의 바랍니다.</li>
                <li>반려동물 동반투숙이 불가합니다.(장애인 안내견 제외)</li>
                <li>전 객실 금연입니다.</li>
            </ul>
        </div>
        
        <div class="row mt-3 text-right">
            <p class="col-md-9">
                <strong>등록일:</strong> <%=RoomList.getCreated_at()%>
            </p>
        </div>
		<% 
		try {
		    if (mem_id != null) {
		        if (RoomMgr.adminchk(mem_id)) { %>
		            <form action="roomupdate.jsp" method="get">
		                <input type="hidden" name="room_id" value="<%=RoomList.getRoom_idx()%>">
		                <button type="submit" class="btn btn-primary">수정하기</button>
		            </form>
		        <% } 
		    }
		} catch (NullPointerException e) {
		    out.println("비로그인 회원");
		}
		%>
		<div id="fade-overlay"></div>
		<jsp:include page="../reply/reply.jsp"></jsp:include>	
        <jsp:include page="/footer.jsp" />
    </div>
</body>
</html>
