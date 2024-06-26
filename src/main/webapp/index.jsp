<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/index.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c19f3c19b34a91d13fb44587165bb0a"></script>
</head>
<style>
.info_list {
    display: flex;
    justify-content: flex-start;\
    border-bottom: 2px solid #ddd;
    flex-wrap: wrap;
        text-align: center;
}

.info_list li {
	list-style: none;
	    text-align: center;
}

.info_list li a {
    display: flex;
    align-content: center;
    align-items: center;
    justify-content: flex-start;
    text-decoration: none;
    color: #555
    }
    
.info_list li {
    padding: 23px 0;
    flex-basis: 47%;
    
    }
    
.info_list li img {
    display: block;
    width: 19%;
        margin: 0 auto;
    }
    
.info_list li span p {
    font-family: Noto Sans KR , '맑은 고딕', '돋움', Dotum, '굴림', Gulim, Sans-serif;
    font-weight: 300;
    font-size: 13px;
    color: #555
    }
    
.info_list li span {
	    margin: 0;
    padding: 0;
}
</style>
<body>
	<jsp:include page="header.jsp" />
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100"
					src="http://www.hotel-interburgo-daegu.com/images/main/main_room01_img01.jpg"
					alt="First slide">
				<div class="carousel-caption">
					<h3>Meet Our Hotel</h3>
					<p>어디서나 한결같이 품격있는 서비스와 시설로 고객에게 깊은 감동을 주는 호텔</p>
					<p>균형있는 라이프스타일을 추구하며 품격의 가치를 아는 고객을 위해</p>
					<p>세련되고 모던한 감각을 지닌 안락한 객실과 세심한 배려가 묻어나는 서비스를 준비합니다.
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="http://www.hotel-interburgo-daegu.com/images/main/main_dinning01_img01.jpg"
					alt="Second slide">
				<div class="carousel-caption">
					<h3>Exclusively Yours</h3>
					<p>인생의 가장 빛나는 시간을 선사하는 럭셔리 호텔입니다.</p>
					<p>가장 특별한 당신에게 영원히 빛나는 시간을 선사하기 위해 호텔을 넘어</p>
					<p>팰리스 같은 시설과 서비스로 당신을 맞이합니다.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="http://www.hotel-interburgo-daegu.com/images/main/main_dinning01_img04.jpg"
					alt="Third slide">
				<div class="carousel-caption">
					<h3>The Best of DAEGU</h3>
					<p>대구에서의 경험을 특별하게 만들어줄 이곳에서 당신의 여정을 시작하세요.</p>
					<p>세련되고 모던한 감각을 지닌 안락한 객실과 세심한 배려가 묻어나는 서비스를 준비합니다.</p>
					<p>호텔앤리조트에서 품격 있는 휴식을 즐기실 수 있습니다.</p>

				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<br>
	<br>
	<form id="step0Form" name="step0Form" method="POST"
		action="room/roomlist.jsp" class="search-form">
		<input type="hidden" name="resIn" id="resIn" value="0">
		<div class="form-group">
			<label for="start-date">check in</label> <input type="date"
				id="start-date" name="start-date" class="date-input" required>
		</div>
		<div class="form-group">
			<label for="end-date">check out</label> <input type="date"
				id="end-date" name="end-date" class="date-input" required>
		</div>
		<div class="form-group">
			<label for="people">people</label> <select id="people" name="people">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
			</select>
		</div>
		<button type="submit" class="btn btn-dark">SEARCH</button>
	</form>
	<br>
	<br>
	<br>
	<br>
	<div class="card-container" style="align-items: center;">
		<div class="row">
			<h2>FITNESS</h2>
			<div class="col">
				<!-- 첫 번째 카드 내용 -->
				<div class="card">
					<img src="images/main_swimmingPool.jpg" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title">SWIMMING POOL</h5>
						<p class="card-text">요트에서 영감을 받아 디자인 된 하늘이 보이는 천장과 바다 속에 있는 듯한
							기분을 느끼게 해주는 수영장은...</p>
						<a href="#" class="btn btn-dark">MORE</a>
					</div>
				</div>
			</div>
			<div class="col">
				<!-- 두 번째 카드 내용 -->
				<div class="card">
					<img src="images/main_fitness.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">HEALTH CLUB</h5>
						<p class="card-text">세계적인 디자이너 아담 티아니가 역동적이고 미래지향적으로 디자인해 활기찬
							분위기를 느끼실...</p>
						<a href="#" class="btn btn-dark">MORE</a>
					</div>
				</div>
			</div>
			<div class="col">
				<!-- 세 번째 카드 내용 -->
				<div class="card">
					<img src="images/main_sauna.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">SAUNA</h5>
						<p class="card-text">품격이 남다른 분들의 취향을 고려하여 편안함과 안정성을 살린 왕실풍의
							인테리어와 휴식과...</p>
						<a href="#" class="btn btn-dark">MORE</a>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="container">
  <div class="row">
    <!-- Contact us -->
    <div class="col-12 col-lg-6">
      <h3 class="text-center mt-2">Contact us</h3>
      <p class="text-center">대구광역시 북구 복현로 35</p>
      <p class="text-center">053-940-5175</p>
      <ul class="info_list">
									<li>
										<a href="https://be.wingsbooking.com/ko/ITB3?" target="_blank">
											<img src="img/icon_location01.svg" alt="">
											<span>
												<p>인터불고만의 럭셔리룸</p>
												<em>객실예약</em>
											</span>
										</a>
									</li>
									<li>
										<a href="/contents/08_customer/online.html?online_id=koweb_online_inquiry&amp;mode=write">
											<img src="img/icon_location02.svg" alt="">
											<span>
												<p>언제든지 문의주세요!</p>
												<em>고객문의</em>
											</span>
										</a>
									</li>
									<li>
										<a href="https://catchtable.co.kr/thebuffet" target="_blank">
											<img src="img/icon_location03.svg" alt="">
											<span>
												<p>스페셜한 인터불고 다이닝</p>
												<em>더 뷔페 예약</em>
											</span>
										</a>
									</li>
									<li>
										<a href="/contents/08_customer/sub12.html">
											<img src="img/icon_location04.svg" alt="">
											<span>
												<p>인터불고를 알고싶다면?</p>
												<em>회사소개</em>
											</span>
										</a>
									</li>
									<li>
										<a href="/contents/08_customer/sub10.html">
											<img src="img/icon_location06.svg" alt="">
											<span>
												<p>인터불고에서 특별한 추억을!</p>
												<em>포토존 안내</em>
											</span>
										</a>
									</li>
									<li>
										<a href="/contents/08_customer/sub11.html">
											<img src="img/icon_location05.svg" alt="">
											<span>
												<p>편안한 휴식의 즐거움</p>
												<em>오시는 길</em>
											</span>
										</a>
									</li>									
								</ul>
    </div>
    <!-- Map -->
    <div class="col-12 col-lg-6">
      <div id="map" style="height: 400px; width:100%"></div>
    </div>
  </div>
</div>


	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.896812, 128.620884), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		//마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(35.896812, 128.620884);

		//마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		//마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>
	<jsp:include page="footer.jsp" />

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous">
		
	</script>
</body>
</html>