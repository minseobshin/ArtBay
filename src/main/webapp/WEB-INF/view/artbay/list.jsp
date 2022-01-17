<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>artbay-list</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" type="text/css" href="../css/artbay.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800">
<script src="js/index.js"></script>
</head>
<body>
<%-- <%@include file="../header.jsp" %> --%>
<form name="frm_list" method="post">
	<div class="div_list">
		<!-- 섹션/정렬 영역 -->
		<div class="nav">
			<ul>
				<li>전체</li>
				<li>paint</li>
				<li>pottery</li>
			</ul>
		</div>
		<br/>
		<!-- 검색 영역 -->
		<div class="search">
			<div class="search_box">
				<input type="text" id="findStr" placeholder="작가 또는 작품명" />
				<input type="button" id="btnSearch" value="🔎" />
			</div>
			<div class="search_option_boxes">
				<!-- sort -->
				<select class="page_combo1">
					<option value="estimate_price_asec">낮은 추정가 순</option>
					<option value="estimate_price_desc">높은 추정가 순</option>
					<option value="init_price_asec">낮은 시작가 순</option>
					<option value="init_price_desc">높은 시작가 순</option>
					<option value="bid_history_cnt_asec">응찰 낮은 순</option>
					<option value="bid_history_cnt_desc">응찰 많은 순</option>
				</select>
				<select class="page_combo2">
					<option value="10cnt">10건씩</option>
					<option value="20cnt">20건씩</option>
					<option value="30cnt">30건씩</option>
					<option value="40cnt">40건씩</option>
					<option value="50cnt">50건씩</option>
				</select>

				<!-- 케이옥션 페이지 형식. 추후에 필요하면 아래로 바꿔쓸 것.			
				<div class="dropdown_01">
					<a id="sort_price_desc">높은 시작가 순</a>
					<a id="sort_price_asec">낮은 시작가 순</a>
					<a id="sort_bid_cnt_desc">응찰 많은 순</a>
					<a id="sort_bid_cnt_asec">응찰 낮은 순</a>
				</div>
				<!-- page size -->
				<!--
				<div class="dropdown_02">
					<a id="page_size_10" class="dropdown_item"></a>
					<a id="page_size_20" class="dropdown_item"></a>
					<a id="page_size_30" class="dropdown_item"></a>
					<a id="page_size_40" class="dropdown_item"></a>
					<a id="page_size_50" class="dropdown_item"></a>
				</div>
				 -->
			</div>
		</div>
		<br/>
		<!-- 선택된 검색 옵션 -->
		<div class="selected_option_area">
			<div class="selected_option_title"><p>선택된 검색 옵션</p></div>
			<div class="selected_option">
				<div class="selected_findStr">
				</div>
			</div>
		</div>
		<div class="listBox">
			<c:forEach begin="0" end="4">
			<div class="listInner" onclick="location.href='/view';">
			<!-- onclick = 필요 -->
				<p class="img"><img src="../img/spongebob.png" /></p>
				<div class="listInnerText">
					<p class="painter">작가명</p>
					<p class="art_name">그림 제목</p>
					<p class="material">재료 좋은 재료를 썼습니다 굉장히 좋은 재료입니다 오버플로우 테스트</p>
					<p class="paintSize">사이즈</p>
					<div class="listInnerTextTitle">
						<p>추정가</p>
						<p>　</p>
						<p>시작가</p>
						<p class="currentPriceTitle">현재가</p>
					</div>
					<div class="listInnerTextPrice">
						<p class="approximateStart">KRW 4,000,000</p>
						<p> ~ 9,000,000</p>
						<p class="minimumPrice">KRW 2,500,000</p>
						<p class="currentPrice">KRW 9,000,000</p>
					</div>
					<div class="listInnerTextTail">
						<p class="endDate">마감 01-04 오후 4:00</p>
						<p class="bidCnt">25회</p>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		<div id="pageZone">
			<input type="button" value="&lt&lt" />
			<input type="button" value="&lt" />
			<input type="button" value="1" />
			<input type="button" value="&gt" />
			<input type="button" value="&gt&gt" />
		</div>
	</div>
</form>
<%-- <%@include file="../footer.jsp" %> --%>
<script src="../js/artbay.js"></script>
</body>
</html>