<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel='stylesheet' type='text/css' href='./css/final_lsy.css'>
<meta charset="UTF-8">
<title>경매결과</title>
</head>
<body>
<div id='auction'>
<h1>Online Action 경매 결과</h1>	
	<form name='frm_auction' method='post'>
		<div id='findZone'>
			<input type='text' name='nowPage' ><br/>
			<input type='search'  placeholder='검색어를 입력해 주세요' name='findStr' value='${findStr }'>
			<input type='button' name='btnFind' value='검색'>
			<select name='sort' style="width:90px;height:30px;" >
				<option value='none'>경매 정렬</option>
				<option value='up'>경매일▲</option>
				<option value='down'>경매일▼</option>
			</select>
		</div>
	
	<div id='list'>
		
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>2021-12-12</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >2021-12-22</span>	<br/>
				<img src = 'http://placehold.it/120x160'/>
				<input type='button' class='detail' name='btnDetail' value='상세보기' >
			</div>
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>2021-12-12</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >2021-12-22</span>	<br/>
				<img src = 'http://placehold.it/120x160'/>
				<input type='button' class='detail'  name='btnDetail' value='상세보기' >
			</div>
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>2021-12-12</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >2021-12-22</span>	<br/>
				<img src = 'http://placehold.it/120x160'/>
				<input type='button' class='detail'  name='btnDetail' value='상세보기' >
			</div>
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>2021-12-12</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >2021-12-22</span>	<br/>
				<img src = 'http://placehold.it/120x160'/>
				<input type='button' class='detail'  name='btnDetail' value='상세보기' >
			</div>
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>2021-12-12</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >2021-12-22</span>	<br/>
				<img src = 'http://placehold.it/120x160'/>
				<input type='button' class='detail'  name='btnDetail' value='상세보기' >
			</div>
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>2021-12-12</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >2021-12-22</span>	<br/>
				<img src = 'http://placehold.it/120x160'/>
				<input type='button' class='detail'  name='btnDetail' value='상세보기' >
			</div>
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>2021-12-12</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >2021-12-22</span>	<br/>
				<img src = 'http://placehold.it/120x160'/>
				<input type='button' class='detail' name='btnDetail' value='상세보기' >
			</div>
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>2021-12-12</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >2021-12-22</span>	<br/>
				<img src = 'http://placehold.it/120x160'/>
				<input type='button' class='detail'  name='btnDetail' value='상세보기' >
			</div>
	</div>

		<div id='btnZone'>
			
				<input type='button' value='&lt&lt' id='btnFirst' onclick='bid.page(1)'/>
				<input type='button' value='&lt' id='btnPrev'  onclick=''/>
			
			
			<c:forEach var='i' begin='1' end='3'>
				<input type='button' value='${i }' class=""  onclick=''/>
			</c:forEach>

			
				<input type='button' value='&gt' id='btnNext'  onclick=''/>
				<input type='button' value='&gt&gt' id='btnLast'  onclick=''/>
			 			
	</div>
	</form>
</div>
<script src='./js/final_lsy.js'></script>
</body>
</html>