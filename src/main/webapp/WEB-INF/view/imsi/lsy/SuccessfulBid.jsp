<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel='stylesheet' type='text/css' href='./css/final_lsy.css'>
<meta charset="UTF-8">
<title>낙찰내역</title>
</head>
<body>
<div id='auction'>
	<h1>낙찰내역</h1>

	<div id='items'>
		<div id='title'>
			<span class='number'>번호</span>
			<span class='name'>작품</span>
			<span class='artist'>작가명</span>
			<span class='artName'>작품명</span>
			<span class='successDate'>낙찰일자</span>
			<span class='successPrice'>낙찰가격</span>
		</div>
		
		<div id='rows'>
			<div id='item' onclick=bid.view()>
				<span class='number'>436546</span>
				<span class='name'>공갈작품</span>
				<span class='artist'>공갈작가명</span>
				<span class='artName'>공갈작품명</span>
				<span class='successDate'>낙찰일자</span>
				<span class='successPrice'>낙찰가격</span>
			</div>
			<div id='item' onclick=bid.view()>
				<span class='number'>436546</span>
				<span class='name'>공갈작품</span>
				<span class='artist'>공갈작가명</span>
				<span class='artName'>공갈작품명</span>
				<span class='successDate'>낙찰일자</span>
				<span class='successPrice'>낙찰가격</span>
			</div>
			<div id='item' onclick=bid.view()>
				<span class='number'>436546</span>
				<span class='name'>공갈작품</span>
				<span class='artist'>공갈작가명</span>
				<span class='artName'>공갈작품명</span>
				<span class='successDate'>낙찰일자</span>
				<span class='successPrice'>낙찰가격</span>
			</div>
			<div id='item' onclick=bid.view()>
				<span class='number'>436546</span>
				<span class='name'>공갈작품</span>
				<span class='artist'>공갈작가명</span>
				<span class='artName'>공갈작품명</span>
				<span class='successDate'>낙찰일자</span>
				<span class='successPrice'>낙찰가격</span>
			</div>
			<div id='item' onclick=bid.view()>
				<span class='number'>436546</span>
				<span class='name'>공갈작품</span>
				<span class='artist'>공갈작가명</span>
				<span class='artName'>공갈작품명</span>
				<span class='successDate'>낙찰일자</span>
				<span class='successPrice'>낙찰가격</span>
			</div>
			<div id='item' onclick=bid.view()>
				<span class='number'>436546</span>
				<span class='name'>공갈작품</span>
				<span class='artist'>공갈작가명</span>
				<span class='artName'>공갈작품명</span>
				<span class='successDate'>낙찰일자</span>
				<span class='successPrice'>낙찰가격</span>
			</div>
			<div id='item' onclick=bid.view()>
				<span class='number'>436546</span>
				<span class='name'>공갈작품</span>
				<span class='artist'>공갈작가명</span>
				<span class='artName'>공갈작품명</span>
				<span class='successDate'>낙찰일자</span>
				<span class='successPrice'>낙찰가격</span>
			</div>
			<div id='item' onclick=bid.view()>
				<span class='number'>436546</span>
				<span class='name'>공갈작품</span>
				<span class='artist'>공갈작가명</span>
				<span class='artName'>공갈작품명</span>
				<span class='successDate'>낙찰일자</span>
				<span class='successPrice'>낙찰가격</span>
			</div>
		</div>	
	</div>
	<div id='btnZone'>
			
				<input type='button' value='맨첨' id='btnFirst'/>
				<input type='button' value='이전' id='btnPrev'  onclick=''/>
						
			<c:forEach var='i' begin='1' end='10'>
				<input type='button' value='${i }' class=""  onclick=''/>
			</c:forEach>
			
				<input type='button' value='다음' id='btnNext'  onclick=''/>
				<input type='button' value='맨끝' id='btnLast'  onclick=''/>			 			
	</div>
		<div class='findZone'>
			<input type='hidden' name='nowPage' value='${nowPage }'/>
		</div>

</div>
<script src='./js/final_lsy.js'></script>
</body>
</html>