<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
</head>
<title>낙찰내역</title>
<div id='auction'>
	<h4>낙찰내역</h4>
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
			<span class='requestDate'>낙찰일자</span>
			<span class='requestPrice'>낙찰가격</span>
		</div>
		
		<div id='rows'>
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
			
		</div>
	</div>
	<div class='btnZone'>
			<input type='button' value='처음' onclick=''/>
			<input type='button' value='이전' onclick=''/>
		
			<input type='button' value='다음' onclick=''/>
			<input type='button' value='맨끝' onclick=''/>		
			
	</div>
</div>
</body>
</html>