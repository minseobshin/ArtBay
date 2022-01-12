<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<header>	
<script src = '/js/artbay_minseob.js'></script><!-- 로그인 페이지 모달창 제어용 -->
	<!-- 메인 로고 -->	
	<ul class="logo clearfix">
		<li><a href="main">ARTBAY</a></li>
	</ul>
	
	<!-- 메인 메뉴 -->
	<ul class="navi clearfix">
		<li><a href="#">Online Auction</a>
			<ul>
				<li><a href="bidList">진행중인 경매</a></li>
				<li><a href="bidResult">경매결과</a></li>
				<li><a href="bidApplication">경매신청</a></li>
			</ul>
		</li>			
		<li><a href="#">How To</a>
			<ul>
				<li><a href="howtoHowto">경매소개</a></li>
				<li><a href="howtoBidIntro">응찰안내</a></li>
				<li><a href="howtoConsignGuide">위탁안내</a></li>
				<li><a href="howtoHowtotest">안내 테스트</a></li>
			</ul>
		</li>
		<li><a href="#">Customer Service</a>
			<ul>
				<li><a href="customerFAQ">자주묻는질문(FAQ)</a></li>
				<li><a href="customerConsultationList">1:1상담문의</a></li>
				<li><a href="customerNoticeList">공지사항</a></li>
			</ul>
		</li>
	</ul>
	
	<!-- 로그인/회원가입/마이페이지/위시리스트 -->
	<ul class="mainLogin clearfix">
		<c:choose>
			<c:when test="${ empty sessionScope.mid }">
				<li><a href="#" id='btnLogin' data-toggle='modal' data-target='#madal' role='botton'>LOGIN</a></li>
				<li><a href="mypageMemberJoin">JOIN</a></li>			
			</c:when>
			<c:otherwise>
				<li>
					<a href="#" id="btnMyPage">MY PAGE</a>
					<div id="mypage">
						<ul>
							<li><a href="mypageBid">응찰내역</a></li>
							<li><a href="mypageSuccessfulBid">낙찰내역</a></li>
							<li><a href="mypageConsign">위탁내역</a></li>
							<li><a href="bidApplication">위탁신청</a></li>
							<li><a href="customerConsultationList">작품문의내역</a></li>
							<li><a href="mypageMemberModify">정보수정</a></li>
							<li><a id="btnGoLogout">로그아웃</a></li> 
						</ul>
					</div>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
	
	<!-- 로그인 페이지 모달창 호출용 -->
	<div id="modal" class="modal fade" tabindex="-1"><!--  role="dialog" -->
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	
</header>