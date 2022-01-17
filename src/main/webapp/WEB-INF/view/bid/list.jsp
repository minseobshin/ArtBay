<%@ page import="kr.artbay.common.ArtBayVo"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script src="js/artbay.js" charset="UTF-8"></script>
</head>
<body>

<form name="frm_list" id="frm_list" method="post">
	<div class="div_list">
		<!-- 섹션/정렬 영역 -->
		<div class="nav">
			<ul>
				<li onclick="category('')" id="navAll">전체</li>
				<li onclick="category('paint')" id="navPaint">paint</li>
				<li onclick="category('pottery')" id="navPottery">pottery</li>
			</ul>
		</div>
		<br/>
		<!-- 검색 영역 -->
		<div class="search">
			<div class="search_box">
				<input type="text" name="findStr" id="findStr" placeholder="작가 또는 작품명" value="${page.findStr }"/>
				<input type="button" id="btnSearch" value="🔎" />
			</div>
			<div class="search_option_boxes">
				<!-- sort -->
				<select class="page_combo1">
					<option>정렬</option>
					<option value="estimate_price_asec">낮은 추정가 순</option>
					<option value="estimate_price_desc">높은 추정가 순</option>
					<option value="init_price_asec">낮은 시작가 순</option>
					<option value="init_price_desc">높은 시작가 순</option>
					<option value="bid_history_cnt_asec">응찰 낮은 순</option>
					<option value="bid_history_cnt_desc">응찰 많은 순</option>
				</select>
				<select class="page_combo2" name="page_combo2" id="page_combo2" onchange="search()">
					<option value="10">개수</option>
					<option value="10">10건씩</option>
					<option value="20">20건씩</option>
					<option value="30">30건씩</option>
					<option value="40">40건씩</option>
					<option value="50">50건씩</option>
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
		<c:choose>
			<c:when test="${fn:length(page.findStr) gt 0 }">
				<div class="selected_option_area">
					<div class="selected_option_title"><p>선택된 검색 옵션</p></div>
					<div class="selected_option">
						<div class="selected_findStr" id="selected_findStr" >
							${page.findStr }
							<input type="button" value="X" style="border: none; background-color: transparent;" />
						</div>
					</div>
				</div>
				<div class="idle_selected_option_area" style="display:none;"></div>
			</c:when>
			<c:otherwise>
				<div class="idle_selected_option_area"></div>
			</c:otherwise>
		</c:choose>
		<div class="listBox">
			<c:forEach var="vo" items="${list }">
			<div class="listInner" onclick="artbay.view(${vo.lot })">
				<p class="img"><img src="../img/spongebob.png" /></p>
				<div class="listInnerText">
					<p class="painter">${vo.artist }작가명</p>
					<p class="art_name">${vo.artwork_name }</p>
					<p class="material">${vo.material }</p>
					<p class="paintSize">${vo.artwork_size }</p>
					<div class="listInnerTextTitle">
						<p>추정가</p>
						<p>　</p>
						<p>시작가</p>
						<p class="currentPriceTitle">현재가</p>
					</div>
					<div class="listInnerTextPrice">
						<p class="approximateStart">KRW 4,000,000</p>
						<p> ~ 9,000,000</p>
						<p class="minimumPrice">${vo.start_price }</p>
						<p class="currentPrice">${vo.current_price }</p>
					</div>
					<div class="listInnerTextTail">
						<p class="endDate">${vo.due_date }</p>
						<p class="bidCnt">${vo.bid_cnt }</p>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		<div id="pageZone">
			<c:if test="${page.startPage gt 1 }">
				<input type="button" value="처음으로" onclick="artbay.page(1)"/>
				<input type="button" value="&lt" onclick="artbay.page(${page.startPage - 1})"/>			
			</c:if>
			<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
				<input type="button" value="${i }" onclick="artbay.page(${i})" />			
			</c:forEach>
			<c:if test="${page.endPage lt page.totPage }">
				<input type="button" value="&gt" onclick = "artbay.page(${page.endPage + 1})" />
				<input type="button" value="끝으로" onclick="artbay.page(${page.totPage})" />
			</c:if>
		</div>
		<div id="hiddenZone">
			<input type="text" name="nowPage" value="${page.nowPage }"/>
			<input type="text" name="lot" id="lot" value="${vo.lot }"/>
		</div>
	</div>
</form>
</body>
</html>