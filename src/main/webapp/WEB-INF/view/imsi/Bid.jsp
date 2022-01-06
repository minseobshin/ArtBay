<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
#auction{
	margin:10px auto;
	width:700px;
}
#auction #btnZone input{
	border-radius:10px;
	border:1px solid #000;
	
}
#auction #items #title{
	background-color:#eea;
	
}
#auction #items .number, .name, .author, .artName, .requestDate, .requestPrice{
	width:100px;
	display:inline-block;
	line-height:1.5em;
}
</style>
<title>응찰내역</title>
</head>
<body>
<div id='auction'>
	<h4>응찰내역</h4>
	<form name='frm_page' method='post'>
		<div class='findZone'>
			<input type='text' name='nowPage' value='${nowPage }'/>
		</div>
	</form>
	<div id='items'>
		<div id='title'>
			<span class='number'>번호</span>
			<span class='name'>작품</span>
			<span class='author'>작가명</span>
			<span class='artName'>작품명</span>
			<span class='requestDate'>응찰일자</span>
			<span class='requestPrice'>응찰가격</span>
		</div>
		
		<div id='rows'>
			<c:foreach>
				<div id='item' onclick = >
					<span class='number'>124234</span>
					<span class='name'>공갈도자기</span>
					<span class='author'>홍길동</span>
					<span class='artName'>홍길동전</span>
					<span class='requestDate'>2022-01-30</span>
					<span class='requestPrice'>1000만원</span>					
				</div>
				<div id='item' onclick = >
					<span class='number'>124234</span>
					<span class='name'>공갈도자기</span>
					<span class='author'>홍길동</span>
					<span class='artName'>홍길동전</span>
					<span class='requestDate'>2022-01-30</span>
					<span class='requestPrice'>1000만원</span>					
				</div>
				<div id='item' onclick = >
					<span class='number'>124234</span>
					<span class='name'>공갈도자기</span>
					<span class='author'>홍길동</span>
					<span class='artName'>홍길동전</span>
					<span class='requestDate'>2022-01-30</span>
					<span class='requestPrice'>1000만원</span>					
				</div>
				<div id='item' onclick = >
					<span class='number'>124234</span>
					<span class='name'>공갈도자기</span>
					<span class='author'>홍길동</span>
					<span class='artName'>홍길동전</span>
					<span class='requestDate'>2022-01-30</span>
					<span class='requestPrice'>1000만원</span>					
				</div>
				<div id='item' onclick = >
					<span class='number'>124234</span>
					<span class='name'>공갈도자기</span>
					<span class='author'>홍길동</span>
					<span class='artName'>홍길동전</span>
					<span class='requestDate'>2022-01-30</span>
					<span class='requestPrice'>1000만원</span>					
				</div>
			</c:foreach>
		</div>
		
	<div class='btnZone'>
	
		<input type='button' value='처음' onclick=''/>
		<input type='button' value='이전' onclick=''/>
		
		<input type='button' value='다음' onclick=''/>
		<input type='button' value='맨끝' onclick=''/>		
			
	</div>
</div>
</div>
</body>
</html>