<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ArtBay</title>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/index.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="js/index.js"></script>
</head>
<body>
<div class="container">
	
	<!-- 메뉴 네비게이션 -->
	<%@include file="./header.jsp" %>
	
	<!-- 이미지 슬라이드 start -->
	<div class="keyvisual">
		<div class="control_btn">
			<button class="prev"><img src="img/prev.png" alt=""></button>
			<button class="next"><img src="img/next.png" alt=""></button>
		</div>
		<div class="keyvisual_inner">
			<ul>
				<li class="mainvisual1"><a href="" title=""><img src="img/mainvisual_1.jpg" alt=""></a></li>
				<li class="mainvisual2"><a href="" title=""><img src="img/mainvisual_2.jpg" alt=""></a></li>
				<li class="mainvisual3"><a href="" title=""><img src="img/mainvisual_3.jpg" alt=""></a></li>
			</ul>
		</div>
	</div>
	<div class="key_control">
		<ul>
			<li><a href="" title=""></a></li>
			<li><a href="" title=""></a></li>
			<li><a href="" title=""></a></li>
		</ul>
	</div>
	<!-- 이미지 슬라이드 end -->
	
	<!-- 주요 출품작 -->
	<!-- To Do -->
	
	<!-- How to 및 경매일정 start -->
	<div class="howto_schedule_zone">		
		<div class="howto_zone">
			<div>
				<div class="title">Aucton Guide</div>
				<div class="info">아트베이 경매에대해 알려드립니다.</div>
				<div class="btn">온라인 경매</div>
			</div>
			<div>
				<div class="title">How to Buy</div>
				<div class="info">응찰에 필요한 정보를 모았습니다.</div>
				<div class="btn">회원가입</div>
				<div class="btn">응찰방법</div>
			</div>
			<div>
				<div class="title">How to Sell</div>
				<div class="info">소장품의 가치. 아트베이에 문의하세요.</div>
				<div class="btn">Why Artbay?</div>
				<div class="btn">위탁방법</div>
			</div>
		</div>
		<div class="schedule_zone">
			<div class="title">아트베이 경매 일정</div>
			<div class="row">
				<div>2022-01-27</div>
				<div>[경매일] 2022년 1월 27일 메이저 경매</div>
			</div>
			<div class="row">
				<div>2022-01-18</div>
				<div>[경매종료] 2022년 1월 18일 프리미엄 온라인경매</div>
			</div>
			<div class="row">
				<div>2022-01-10</div>
				<div>[경매종료] 2022년 1월 10일 위클리 온라인경매</div>
			</div>
		</div>
	</div>
	<!-- How to 및 경매일정 end -->
	
	<!-- 배너 슬라이드 start -->
	<div class="popup_zone">
		<div class="popup_zone_control">
			<div id="control">
				<ul>
					<li><a href="#none" id="control0"></a></li>
					<li><a href="#none" id="control1"></a></li>
					<li><a href="#none" id="control2"></a></li>					
					<li class="play"><a href="#none"><img src="img/play_btn.gif"></a></li>
					<li class="pause"><a href="#none"><img src="img/pause_btn.gif"></a></li>
				</ul>
			</div>
		</div>
		<div class="banner">
			<div class="moving">
				<div><img src="img/image1.jpg"></div>
				<div><img src="img/image2.jpg"></div>
				<div><img src="img/image3.jpg"></div>			
			</div>
		</div>
	</div>
	<!-- 배너 슬라이드 end -->
	
	<!-- 맨위 / 맨아래 이동 -->
	<div class="scrollBtn" id="topBtn">△</div>
	<div class="scrollBtn" id="bottomBtn">▽</div>
	
	<!-- 메인 푸터 -->
	<%@include file="./footer.jsp" %>
</div>
</body>
</html>