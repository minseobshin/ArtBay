<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>경매결과</title>
<style>
#auction{
	margin:10px auto;
	width:820px;
}
#auction #btnZone input{
	border-radius:10px;
	border:1px solid #000;
	text-align:center;
}
#auction #items #item{
	border:1px solid #000;
	width:300px;
	display:inline-block;
}
#auction #items .weekly_value, .weekly_title{
	width:200px;
	display:inline-block;
	line-height:1.5em;
}}
#auction #items .startDate_title, .startDate_value, .endDate_title, .endDate_value{
	width:100px;
	display:inline-block;
	line-height:1.5em;
}

</style>
</head>
<body>
<h4>Online Action 경매 결과</h4>	
<div id='auction'>
	<form id='frm_auction' method='post'>
		<input type='text' name='page' value='${nowPage }'>
		<input type='search' placeholder='검색어를 입력해 주세요' name='findStr' value='${findStr }'>
		<input type='button' value='검색'>
		<select name='sort' style="width:90px;height:30px;" >
			<option value='none'>==정렬==</option>
			<option value='up'>경매일▲</option>
			<option value='down'>경매일▼</option>
		</select>
	</form>
	<div id='items'>
		<c:foreach>
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>$startDate</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >$endDate</span>	<br/>
				<img src='' alt='예술품 사진'>	<br/>
			</div>
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>$startDate</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >$endDate</span>	<br/>
				<img src='' alt='예술품 사진'>	<br/>
			</div>
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>$startDate</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >$endDate</span>	<br/>
				<img src='' alt='예술품 사진'>	<br/>
			</div>
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>$startDate</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >$endDate</span>	<br/>
				<img src='' alt='예술품 사진'>	<br/>
			</div>
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>$startDate</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >$endDate</span>	<br/>
				<img src='' alt='예술품 사진'>	<br/>
			</div>
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>$startDate</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >$endDate</span>	<br/>
				<img src='' alt='예술품 사진'>	<br/>
			</div>
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>$startDate</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >$endDate</span>	<br/>
				<img src='' alt='예술품 사진'>	<br/>
			</div>
			<div id='item' onclick = >
				<span class='weekly_value'  >2021년 12월 27일</span>
				<span class='weekly_title'>위클리 온라인 경매</span><br/>
				<span class='startDate_title'>경매시작일</span>
				<span class='startDate_value'>$startDate</span><br/>
				<span class='endDate_title' >경매종료일</span>	
				<span class='endDate_value' >$endDate</span>	<br/>
				<img src='' alt='예술품 사진'>	<br/>
			</div>
		</c:foreach>
	</div>
			<div id='btnZone'>
		
				<input type='button' value='처음' onclick=''/>
				<input type='button' value='이전' onclick=''/>
				<input type='button' value='' class='' onclick=''/>
				<input type='button' value='다음' onclick=''/>
				<input type='button' value='맨끝' onclick=''/>
				
			
		</div>
</div>
</body>
</html>