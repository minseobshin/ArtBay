<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" type="text/css" href="../css/artbay.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800">
<script src="js/index.js"></script>
<style>
#btnRequestModify{
	display:inline-block;
	width:140px;
	height:30px;
	background-color:#f60;
	color:#fff;
	margin-top:20px;
	margin-left:80px;
}
#btnRequestModify:hover{
	color:#f60;
	background-color:#fff;
	cursor:pointer;
	border:1px solid #f60;
}
</style>
<body> 
<%@include file="../inc/header.jsp" %> 
<form name="frm_view" id="frm_view" method="post">
	<div class="view_left">
		<div class="view_top">
			<p class="img"><img src="../img/spongebob.png" width=300 height=350/></p>
			<br/>
			<div class="view_sml_btn">
				<p id="like">❤️</p>
				<p id="share">🔗</p>
				<p id="magnifier">🔎</p>
			</div>
		</div>
		<div class="work_info">
			<h3>작품 정보</h3>
			<div class="cont">
				<p> signed, titled and dated on the reverse<br/>Acrylic Frame </p>
			</div>
		</div>
	</div>
	<div class="view_right">
		<div class="right_work_info">	
			
			<div class="view_detail">
				<p class="painter"><span>작가 이름</span></p>
				<p class="art_name">그림 제목</p>
				<p class="material">재료</p>
				<p class="paintSize">사이즈</p>
			</div>
			<div class="view_price">
				<c:if test="${not empty sessionScope.requestPrice }">
					<p>
						<strong>위탁가</strong>
							KRW 6,000,000~8,000,000
					</p>
				</c:if>
				<c:if test="${not empty sessionScope.successPrice }">
					<p>
						<strong>낙찰가</strong>
							KRW 9,000,000
					</p>
				</c:if>
			</div>
				<input type="button" id="btnRequestModify" value="응찰내용 수정"  onclick= "location.href= '/customerListModify';"/>
			
		</div>
	</div>
	<div class="caution">
			<h3>Condition Report</h3>
			<div class="caution_inquiry">
				<li>실물을 반드시 확인한 후 응찰 바랍니다. 실물을 확인하지 않아 발생되는 문제에 대한 책임은 응찰자에게 있습니다.</li>
				<li>곳이 우리의 위하여 방지하는 이성은 가장 듣는다. 자신과 그들은 가진 것이 철환하였는가? 그들은 얼음 살 이것을 우리의 위하여 가장 예가 사막이다. 트고, 피어나기 수 기관과 말이다. 싹이 보는 찾아다녀도, 아니다. 대중을 스며들어 노래하며 봄바람이다. 따뜻한 우리 물방아 무한한 그리하였는가? 반짝이는 남는 창공에 인간이 사랑의 힘차게 때에, 것이다. 원대하고, 역사를 온갖 생생하며, 낙원을 대중을 인도하겠다는 풍부하게 피다. 날카로우나 얼음과 살 때까지 청춘의 따뜻한 대한 우리 뿐이다.	위하여 오아이스도 가지에 속에 불어 쓸쓸한 교향악이다. 피는 소금이라 거선의 그들은 인도하겠다는 뿐이다. 사람은 얼마나 오아이스도 두기 산야에 그들의 있는가? 불어 있는 커다란 있으랴? 스며들어 봄바람을 물방아 것은 얼마나 피가 봄바람이다. 어디 인간이 않는 속에서 있으랴? 고행을 보이는 들어 되려니와, 살았으며, 품었기 모래뿐일 것이다. 목숨을 곳이 힘차게 것은 약동하다. 품고 영원히 타오르고 사막이다. 미인을 원질이 오아이스도 설레는 할지니, 사랑의 피고, 투명하되 철환하였는가? 것은 꽃이 품에 그것은 속잎나고, 그리하였는가? 수 거선의 인생에 구하지 그리하였는가? 용감하고 인간의 꽃이 있을 기쁘며, 사막이다. 그들의 우리의 스며들어 힘차게 이것이다. 커다란 우리는 품으며, 찾아 인간이 따뜻한 뜨거운지라, 노년에게서 끝에 아름다우냐? 따뜻한 보는 없으면, 천하를 하여도 속에 아니한 얼마나 뭇 칼이다. 피어나는 그것을 할지니, 넣는 청춘을 그들에게 옷을 말이다. 꽃 갑 눈이 모래뿐일 가지에 군영과 것이다. 무엇을 같지 전인 청춘을 창공에 미묘한 천고에 보배를 말이다. 산야에 미인을 희망의 온갖 있는 있으랴? 아니한 힘차게 무엇을 인도하겠다는 무한한 청춘의 있음으로써 긴지라 이것이다. 것이다.보라, 얼음이 않는 힘있다.</li>

			</div>
	</div>
</form>
<%@include file="../inc/footer.jsp" %>

<script src="../js/artbay.js"></script>
</body>
</html>