<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="container">
	
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
	<div class="tab_container">	
		<input id="tab1" type="radio" name="tabs" checked>
		<label for="tab1">전체</label>
		<input id="tab2" type="radio" name="tabs">
		<label for="tab2">미술품</label>
		<input id="tab3" type="radio" name="tabs">
		<label for="tab3">도자기</label>		
		<section id="content1">
			<c:forEach var="i" begin="1" end="15">
				<div class="item">
					<img alt="" src="https://via.placeholder.com/250x250">
					<div class="info">
						<div class="author">콰야 ${i}</div>
						<div class="title">적막한 춤</div>
						<div>현재가</div>
						<div class="price">KRW<span>7,000,000</span></div>
					</div>				
				</div>			
			</c:forEach>			
		</section>
		<section id="content2">
			<c:forEach var="i" begin="1" end="8">
				<div class="item">
					<img alt="" src="https://via.placeholder.com/250x250">
					<div class="info">
						<div class="author">로비 드위 안토노 ${i}</div>
						<div class="title">Epic Fight</div>
						<div>현재가</div>
						<div class="price">KRW<span>2,000,000</span></div>
					</div>				
				</div>			
			</c:forEach>
		</section>
		<section id="content3">
			<c:forEach var="i" begin="1" end="10">
				<div class="item">
					<img alt="" src="https://via.placeholder.com/250x250">
					<div class="info">
						<div class="author">목불 장운상 ${i}</div>
						<div class="title">널뛰기</div>
						<div>현재가</div>
						<div class="price">KRW<span>500,000</span></div>
					</div>				
				</div>			
			</c:forEach>
		</section>
	</div>
	
	<!-- How to 및 경매일정 start -->
	<div class="howto_schedule_zone">		
		<div class="howto_zone">
			<div>
				<div class="title">Aucton Guide</div>
				<div class="info">아트베이 경매에대해 알려드립니다.</div>
				<div class="btn" id="btnOnlineAuction">온라인 경매</div>
			</div>
			<div>
				<div class="title">How to Buy</div>
				<div class="info">응찰에 필요한 정보를 모았습니다.</div>
				<div class="btn" id="btnMemberJoin">회원가입</div>
				<div class="btn" id="btnBidIntro">응찰방법</div>
			</div> 
			<div>
				<div class="title">How to Sell</div>
				<div class="info">소장품의 가치. 아트베이에 문의하세요.</div>
				<div class="btn" id="btnWhyArtbay">Why Artbay?</div>
				<div class="btn" id="btnConsign">위탁방법</div>
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
	<div class="banner_container">
		<div class="moving">
			<div class="banner0"><span>아트베이 위탁문의</span>근현대 미술품, 고서화, 목기, 민예품 그외의 각종 예술관련 물품 등</div>
			<div class="banner1"><span>Private Sales</span>국내 최고 미술품 유통망 기반의 경매 외 미술품 거래 서비스</div>
			<div class="banner2"><span>Art Space</span>대한민국 대표 미술품 경매회사 아트베이의 전문 수장고 서비스</div>
		</div>
		<div id="control">
			<ul>
				<li><a href="#none" id="control0"></a></li>
				<li><a href="#none" id="control1"></a></li>
				<li><a href="#none" id="control2"></a></li>
			</ul>
		</div>
	</div>
	<!-- 배너 슬라이드 end -->	
	
	<!-- 맨위 / 맨아래 이동 -->
	<div class="scrollBtn" id="topBtn">△</div>
	<div class="scrollBtn" id="bottomBtn">▽</div>
	
</div>