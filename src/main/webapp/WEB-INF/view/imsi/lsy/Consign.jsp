<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel='stylesheet' type='text/css' href='./css/final_lsy.css'>
<title>위탁내역</title>
</head>
<body>
<div id='auction'>
	<h1>위탁내역</h1>
	<input type='button' id='consignBtn' value='위탁신청'>

	<div id='items'>
		<div id='title'>
			<span class='number'>번호</span>
			<span class='name'>작품</span>
			<span class='artist'>작가명</span>
			<span class='artName'>작품명</span>
			<span class='consignDate'>신청일자</span>
		</div>
		
		<div id='rows'>
			
			<div id='item' onclick = >
				<span class='number'  >23490</span>
				<span class='name'   >도자기</span>
				<span class='artist'    >홍길동</span>
				<span class='artName'>백자</span>
				<span class='consignDate'   >2022-01-03</span>
				
			</div>
				
			<div id='item' onclick = >
				<span class='number'  >23490</span>
				<span class='name'   >도자기</span>
				<span class='artist'    >홍길동</span>
				<span class='artName'>백자</span>
				<span class='consignDate'   >2022-01-03</span>
				
			</div>
			<div id='item' onclick = >
				<span class='number'  >23490</span>
				<span class='name'   >도자기</span>
				<span class='artist'    >홍길동</span>
				<span class='artName'>백자</span>
				<span class='consignDate'   >2022-01-03</span>
				
			</div>
			<div id='item' onclick = >
				<span class='number'  >23490</span>
				<span class='name'   >도자기</span>
				<span class='artist'    >홍길동</span>
				<span class='artName'>백자</span>
				<span class='consignDate'   >2022-01-03</span>
				
			</div>
			<div id='item' onclick = >
				<span class='number'  >23490</span>
				<span class='name'   >도자기</span>
				<span class='artist'    >홍길동</span>
				<span class='artName'>백자</span>
				<span class='consignDate'   >2022-01-03</span>
				
			</div>
			<div id='item' onclick = >
				<span class='number'  >23490</span>
				<span class='name'   >도자기</span>
				<span class='artist'    >홍길동</span>
				<span class='artName'>백자</span>
				<span class='consignDate'   >2022-01-03</span>
				
			</div>
			<div id='item' onclick = >
				<span class='number'  >23490</span>
				<span class='name'   >도자기</span>
				<span class='artist'    >홍길동</span>
				<span class='artName'>백자</span>
				<span class='consignDate'   >2022-01-03</span>
				
			</div>
			<div id='item' onclick = >
				<span class='number'  >23490</span>
				<span class='name'   >도자기</span>
				<span class='artist'    >홍길동</span>
				<span class='artName'>백자</span>
				<span class='consignDate'   >2022-01-03</span>
				
			</div>
			<div id='item' onclick = >
				<span class='number'  >23490</span>
				<span class='name'   >도자기</span>
				<span class='artist'    >홍길동</span>
				<span class='artName'>백자</span>
				<span class='consignDate'   >2022-01-03</span>
				
			</div>
		</div>
	</div>
	<div id='btnZone'>		
				<input type='button' value='맨첨' id='btnFirst'/>
				<input type='button' value='&lt' id='btnPrev'  onclick=''/>
						
			<c:forEach var='i' begin='1' end='10'>
				<input type='button' value='${i }' class=""  onclick=''/>
			</c:forEach>
			
				<input type='button' value='다음' id='btnNext'  onclick=''/>
				<input type='button' value='맨끝' id='btnLast'  onclick=''/>			 			
	</div>
	<div class='findZone'>
		<input type='text' name='nowPage' value='${nowPage }'/>
	</div>

</div>
<script src='./js/final_lsy.js'></script>
</body>
</html>