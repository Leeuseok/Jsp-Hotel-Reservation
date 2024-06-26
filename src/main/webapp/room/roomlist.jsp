<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*, room.*"%>
<jsp:useBean id="RoomMgr" class="room.RoomMgr" scope="page" />

<jsp:useBean id="RoomMgrP" class="room.RoomMgr" scope="page"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<html>
<head> 
<title>객실 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%
	String startDate = request.getParameter("start-date");
	String endDate = request.getParameter("end-date");
	String people = request.getParameter("people");
%>
<link rel="stylesheet" href="../css/room_list.css">
<script src="animation.js"></script>
<script>
window.addEventListener('DOMContentLoaded', function() {
    // 'peopleSelect' 초기 값을 설정
    var peopleSelect = document.getElementById('peopleSelect');
    peopleSelect.value = "<%= people == null ? "0" : people %>";
    peopleSelect.addEventListener('change', function() {
        // 'people' hidden input 요소의 값을 변경
        document.getElementById('people').value = this.value;
    });

    // 날짜 선택기 설정
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
            }
        },
        // 기본 날짜 설정
        defaultDate: [<%= startDate == null ? "null" : "\"" + startDate + "\"" %>, <%= endDate == null ? "null" : "\"" + endDate + "\"" %>]
    });

    document.getElementById('datePickerBtn').addEventListener('click', function() {
        fp.open();
    });
});

</script>
</head>
<body class="bg-light">
<jsp:include page="/header.jsp"/>
	<div class="container">
	    		<%
    		String mem_id = (String)session.getAttribute("mem_id");
		try {
		    if (mem_id != null) {
		        if (RoomMgr.adminchk(mem_id)) { %>
		        <p>관리자 Func
		            <form action="RoomDelete.jsp" method="get">
		                <button type="submit" class="btn btn-primary">삭제하기</button>
		            </form>
		        <% } 
		    }
		} catch (NullPointerException e) {
		    out.println("비로그인 회원");
		}
		%>
	</div>
<div class="d-flex justify-content-center mb-4">
<p class="calc_people_txt">날짜/인원</p>
    <button id="datePickerBtn" type="button" class="btn btn-outline-secondary mr-3">
        <%= startDate != null && endDate != null ? startDate + " - " + endDate : "입실/퇴실 날짜 선택" %>
    </button>
    <select id="peopleSelect" class="btn btn-outline-secondary mr-3" required>
        <option value="0" selected>인원 선택</option>
        <option value="1">1명</option>
        <option value="2">2명</option>
        <option value="3">3명</option>
        <option value="4">4명</option>
    </select>
    </div>
    <div class="container mb-2">
	<img src="../img/room_head.jpg" alt="헤더" style="width:100%;">
	<h2>Room List</h2>
	</div>
            <section class="rooms-section spad">
        <div class="container">
            <div class="row">
        <%
            Vector<RoomBean> vlist = RoomMgrP.getRoomList();
            int counter = vlist.size();
            for(int i=0; i<vlist.size(); i++){
                RoomBean RoomList = vlist.get(i);
        %>
                <div class="col-lg-4 col-md-6">
                    <div class="room-item">
                        <img src="/MaNolja/img/<%=RoomList.getRoom_title()%>2.jpg" alt="사진">
                        <div class="ri-text">
                            <h4><%=RoomList.getRoom_title()%></h4>
                            <h3><%=RoomList.getRoom_price()%>₩<span></span></h3>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o">평수</td>
                                        <td><%=RoomList.getRoom_area()%>㎡</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">인원</td>
                                        <td><%=RoomList.getRoom_people() %>명</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">구조</td>
                                        <td><%=RoomList.getRoom_map()%></td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">방 개수</td>
                                        <td><%=RoomList.getRoom_num()%></td>
                                    </tr>
                                </tbody>
                            </table>
                         <button type="button" class="btn btn-danger" onclick="submitForm('<%=RoomList.getRoom_idx()%>')">자세히보기</button>
                        </div>
                    </div>
                </div>
                <%} %>
                 <div class="col-lg-12">
                    <div class="room-pagination">
                        <a href="#">1</a>
                        <a href="#">Next <i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
                  </div>
                    </div>
    </section>

    <form id="roomForm" method="POST" style="display:none;">
    <input type="hidden" id="startDate" name="startDate" value="<%= startDate %>">
    <input type="hidden" id="endDate" name="endDate" value="<%= endDate %>">
    <input type="hidden" id="people" name="people" value="<%= people %>">
</form>
    <script>
    function submitForm(roomId) {
        var startDate = document.getElementById('startDate').value;
        var endDate = document.getElementById('endDate').value;
        var people = document.getElementById('peopleSelect').value;

        // 날짜와 인원이 선택되지 않았을 경우, 알림창을 띄우고 함수를 종료
        if (startDate == "" || endDate == "" || people == "0") {
            alert("날짜와 인원을 선택해주세요.");
            return;
        }

        var form = document.getElementById('roomForm');
        // 방 ID를 form 액션에 추가
        form.action = "roomdetail.jsp?room_id=" + roomId;
        form.submit();
    }
    </script>
    <div id="fade-overlay"></div>
<jsp:include page="/footer.jsp"/>
</body>

</html>
