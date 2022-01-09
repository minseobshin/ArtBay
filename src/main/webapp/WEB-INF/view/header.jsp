<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>	
<script src = '/js/artbay_minseob.js'></script><!-- 로그인 페이지 모달창 제어용 -->
	<!-- 메인 로고 -->	
	<ul class="logo clearfix">
		<li><a href="home">ARTBAY</a></li>
	</ul>
	
	<!-- 메인 메뉴 -->
	<ul class="navi clearfix">
		<li><a href="#">Online Auction</a>
			<ul>
				<li><a href="list">진행중인 경매</a></li>
				<li><a href="Result">경매결과</a></li>
				<li><a href="application">경매신청</a></li>
			</ul>
		</li>			
		<li><a href="#">How To</a>
			<ul>
				<li><a href="howto">경매소개</a></li>
				<li><a href="bidIntro">응찰안내</a></li>
				<li><a href="ConsignGuide">위탁안내</a></li>
			</ul>
		</li>
		<li><a href="#">Customer Service</a>
			<ul>
				<li><a href="FAQ">자주묻는질문(FAQ)</a></li>
				<li><a href="consultationList">1:1상담문의</a></li>
				<li><a href="noticeList">공지사항</a></li>
			</ul>
		</li>
	</ul>
	
	<!-- 로그인/회원가입 -->
	<ul class="login clearfix">
		<li><a href="#" id='btnLogin' data-toggle='modal' data-target='#madal' role='botton'>LOGIN</a></li>
		<li><a href="memberJoin">JOIN</a></li>
	</ul>
	
	<!-- 로그인 페이지 모달창 호출용 -->
	<div id="modal" class="modal fade" tabindex="-1"><!--  role="dialog" -->
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
</header>