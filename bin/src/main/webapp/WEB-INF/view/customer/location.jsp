<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/location.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cebcadccdc842f3512fa85dc3499bd5c"></script>
<script src="js/location.js"></script>
</head>
<body>
<!-- 지도 -->
<div id="map" style="width:100%;height:350px;"></div>

<div class="loc_container">
	
	<div class="loc_title">오시는길</div>
	
	<div class="loc_addr">
		<label>주소</label>
		<span>서울특별시 관악구 남부순환로 1822 서울대입구역, 아트타워 1층 아트베이</span>
	</div>
	
	<div class="loc_contact">
		<label>연락처</label>
		<span>대표전화 : 02-1234-1111, 팩스 : 02-1234-2222</span>
	</div>
	
	<div class="loc_car">
		<label>자동차</label>
		<span>전시장 방문객을 위한 발렛 서비스 제공 (이용요금 3,000원 주차가능대수 20-30대)</span>
	</div>
	
	<div class="loc_subway">
		<label>지하철</label>
		<span class="icon">2</span><span class="text">서울대입구역 3번 출구</span>
	</div>
	
	<div class="loc_bus">
		<label>버스</label>
		<ul>
			<li><span class="icon blue">B</span><span class="text">461 506 643 651 N15 N61</span></li>
			<li><span class="icon green">G</span><span class="text">5413 5511 5513 5515 5530 6515</span></li>
			<li><span class="icon red">R</span><span class="text">3500 8507 6 9</span></li>
			<li><span class="text">※ 서울대입구역 3번출구에서 15m</span></li>
		</ul>
	</div>
</div>
</body>
</html>