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
<title>낙찰내역</title>
</head>
<body>
<div class = "applyform">
	<h1>낙찰내역</h1>
	<div class="bgImgAuction"></div>
</div>
<div id='auction'>
	
	<form name='frm_auction' method='post'>
	<div id='items'>
		<div id='title'>
			<span class='num'>번호</span>
			<span class='name'>작품</span>
			<span class='artist'>작가명</span>
			<span class='artName'>작품명</span>
			<span class='successDate'>낙찰일자</span>
			<span class='successPrice'>낙찰가격</span>
		</div>
		
		<div id='rows'>
			<c:forEach var='vo' items='${list }'>
				<div id='item' onclick ='mBid.view(${vo.lot})'>
					<span class='num'>${vo.lot }</span>
					<span class='name'>${vo.artwork_ctgr }</span>
					<span class='artist'>${vo.artist }</span>
					<span class='artName'>${vo.artwork_name }</span>
					<span class='successDate'>${vo.winbid_date }</span>
					<span class='successPrice'>${vo.winbid_price }</span>
				</div>
			</c:forEach>
		</div>	
	</div>
	
		<div id='btnZone'>
			<c:if test="${page.startPage>1 }">
				<input type='button' value='맨첨' id='btnFirst' onclick='bid.page(1)'/>
				<input type='button' value='이전' id='btnPrev'  onclick='bid.page(${page.startPage-1})'/>
			</c:if>
			
			<c:forEach var='i' begin="${page.startPage }" end='${page.endPage }'>
				<input type='button' value='${i }' class="${(i==page.nowPage)? 'here' :'' }"  onclick='bid.page(${i})'/>
			</c:forEach>
	
			<c:if test="${page.endPage<page.totPage }">
				<input type='button' value='다음' id='btnNext'  onclick='bid.page(${page.endPage+1})'/>
				<input type='button' value='맨끝' id='btnLast'  onclick='bid.page(${page.totPage})'/>
			</c:if> 					
		</div>
	</form>
		
		<form name='frm_page' id='frm_page' method='post'>
			<input type='hidden' name='nowPage' value='${page.nowPage }'>
			<input type='hidden' name='lot' >
		</form>
</div>
</body>
<script src='./js/final_lsy.js'></script>
</html>