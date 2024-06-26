<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*, room.*"%>

<jsp:useBean id="RoomMgrP" class="room.RoomMgr" scope="page"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<html>
<head> 
<title>객실 리스트 - 삭제</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%
	String mem_id = (String)session.getAttribute("mem_id"); // 관리자만 접속 할 수 있도록
	if(!RoomMgrP.adminchk(mem_id)) {
		response.sendRedirect("roomlist.jsp");
	}
%>
<link rel="stylesheet" href="../css/room_list.css">
<script src="animation.js"></script>
</head>
<body class="bg-light">
<jsp:include page="/header.jsp"/>
    <div class="container mb-2">
	<img src="../img/room_head.jpg" alt="헤더" style="width:100%;">
	<h2>Room List - Delete(관리자)</h2>
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
                            <form action="/MaNolja/room/deleteroom_process" method="POST">
                            <input type="hidden" name="room_idx" id="room_idx" value="<%=RoomList.getRoom_idx()%>">
                         <button class="btn btn-danger" onclick="submit">삭제</button>
                      		</form>
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
    <div id="fade-overlay"></div>
<jsp:include page="/footer.jsp"/>
</body>

</html>
