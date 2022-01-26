<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' type='text/css' href='./css/final_lsy.css'>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel='stylesheet' type='text/css' href="./css/basic.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/index.css">
<meta charset="UTF-8">
<title>경매결과</title>

</head>
<body>
<div class = "applyform">
	<h1>경매결과</h1>
	<div class="bgImgAuction"></div>
</div>

<div id='auction'>
<h1>Online Auction 경매 결과</h1>	
	<form name='frm_auction' id='frm_auction' method='post'>
		<div id='findZone'>
			<input type='hidden' name='nowPage' value='${page.nowPage }'>
			<input type='search'  placeholder='검색어를 입력해 주세요' name='findStr' value='${page.findStr }'>
			<input type='button' id='btnWinFind' value='검색'>
			
			<select class='rSort_order' name='rSort' style="width:90px;height:30px;" onchange="selectOrder(this)">
				<option value='none'>경매 정렬</option>
				<option value='asc'>경매일▲</option>
				<option value='desc'>경매일▼</option>
			</select>`
		</div>
	
	<div id='list'>
		<c:forEach var='vo' items='${list }'>
			<div id='item'>
				<span class='weekly_value'>${vo.due_date}</span>
				<span class='weekly_title'>  온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>2021-12-12</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >2021-12-22</span>	<br/>
				<img src = 'http://placehold.it/120x160'/>
				<input type='button' class='detail' name='btnDetail' value='상세보기' onclick="viewDetail('${vo.due_date}')">
			</div>
		</c:forEach>	
		<input type='hidden' name='r_date' >
	</div>
	
		<div id='btnZone'>
			<c:if test="${page.startPage>1 }">
				<input type='button' value='맨첨' id='btnFirst' onclick='rBid.page(1)'/>
				<input type='button' value='이전' id='btnPrev'  onclick='rBid.page(${page.startPage-1})'/>
			</c:if>
			
			<c:forEach var='i' begin="${page.startPage }" end='${page.endPage }'>
				<input type='button' value='${i }' class="${(i==page.nowPage)? 'here' :'' }"  onclick='rBid.page(${i})'/>
			</c:forEach>

			<c:if test="${page.endPage<page.totPage }">
				<input type='button' value='다음' id='btnNext'  onclick='rBid.page(${page.endPage+1})'/>
				<input type='button' value='맨끝' id='btnLast'  onclick='rBid.page(${page.totPage})'/>
			</c:if> 			
		
		</div>
	</form>
</div>
</body>
<script src='./js/final_lsy.js'></script>
</html>