<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<header>	
<script src = '/js/login_only.js'></script><!-- 로그인 전용 페이지(모달창 제어용) -->
<!-- ID/PW 찾기 이메일 전송 API용 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
<script src = '/js/api_only2.js'></script>

	<!-- 메인 로고 -->	
	<ul class="logo clearfix">
		<li><!-- <img src="img/greatTasty_resize.png"> --><a href="main">ARTBAY</a></li>
	</ul>
	
	<!-- 메인 메뉴 -->
	<ul class="navi clearfix">
		<li><a href="#">Online Auction</a>
			<ul>
				<li><a href="bidList">진행중인 경매</a></li>
				<li><a href="bidResult">경매결과</a></li>
			</ul>
		</li>			
		<li><a href="#">How To</a>
			<ul>
				<li><a href="howtoHowtotest">경매소개</a></li>
				<li><a href="howtoBidIntrotest">응찰안내</a></li>
				<li><a href="howtoConsignGuidetest">위탁안내</a></li>
			</ul>
		</li>
		<li><a href="#">Customer Service</a>
			<ul>
				<li><a href="faqList">자주묻는질문(FAQ)</a></li>
				<li><a href="qnaList">1:1상담문의</a></li>
				<li><a href="customerNoticeList">공지사항</a></li>
			</ul>
		</li>
	</ul>
	
	<!-- 로그인/회원가입/마이페이지/위시리스트 -->
	<ul class="mainLogin clearfix">
		<c:choose>
			<c:when test="${ empty sessionScope.sv }">
				<li><a href="#" id='btnLogin' data-toggle='modal' data-target='#madal' role='botton'>LOGIN</a></li>
				<li><a href="mypageMemberJoin">JOIN</a></li>			
			</c:when>
			<c:otherwise>
				<li>
					<a href="#" id="btnMyPage">MY PAGE</a>
					<div id="mypage">
						<ul>
							<li><a href="mypageBid">응찰내역</a></li>
							<li><a href="mypageSuccessBid">낙찰내역</a></li>
							<li><a href="bidApplication">경매신청</a></li>							
							<c:choose>
								<c:when test="${ sessionScope.injung eq 'super' }">
									<li><a href="memberManage">관리자 페이지</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="mypageMemberModify">정보수정</a></li>
								</c:otherwise>
							</c:choose>
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
	<!-- ID/PW 찾기 이메일 전송용 -->
	<!-- 아이디찾기 -->
	<form name='frm_findId9' id='frm_findId9' method='post'>
		<input type='hidden' name='irum9' id='irumFind9' class='midLogin' placeholder="이름">
		<input type='hidden' name='memberJoinEmail9' id='emailFind9' class='midLogin' placeholder="이메일주소">
		<input type='hidden' name='findedMid9' id='findedMid9'>
		<input type='submit' name='btnGoIdFind9' id='btnGoIdFind9' class='btnGoLogin9' style='display : none;'>
		<script type="text/javascript">emailjs.init('user_ufZewS7yUXgBnIZvq9AT3')</script>
	</form>
	<!-- 비밀번호찾기 -->
	<form name='frm_findPwd9' id='frm_findPwd9' method='post'>
		<input type='hidden' name='irum9' id='irumFind8' class='midLogin' placeholder="이름">
		<input type='hidden' name='mid9' id='idFind9' class='midLogin' placeholder="아이디">
		<input type='hidden' name='findedMid9' id='findedPwd9'>
		<input type='hidden' name='memberJoinEmail9' id='emailFind8' class='midLogin' placeholder="이메일주소">
		<input type='submit' name='btnGoPwdFind9' id='btnGoPwdFind9' class='btnGoLogin9' style='display : none;'>
		<script type="text/javascript">emailjs.init('user_ufZewS7yUXgBnIZvq9AT3')</script>
	</form>
</header>