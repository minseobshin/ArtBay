<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' type='text/css' href='../css/noticeList.css'>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel='stylesheet' type='text/css' href="./css/basic.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800">


<title>공지사항</title>
</head>
<body>
<div id='noticeList'>
	<h1>공지사항</h1>
	<form name='frm_notice' method='post'>
		<div id='noticeSearch'>
			<output>공지사항 300건</output>
			<div id='findZone'>
				<input type='search' size='28' placeholder="검색어">
				<input type='button' name='btnSearch' value='검색'> 
			</div>
		
		</div>
	<div id='notice'>
		<div id='title'>
			<div id='title_sub'>
				<span class='title'>제목</span>
				<span class='noticeDate'>등록일</span>
				<span class='hit'>조회수</span>
			</div>
			<span class='chkDeleteNotice'>공지삭제</span>
			<br/>				
	
		</div>
		
		<div id='rows'>
		
			<div id='row'>
				<div class='item_sub' onclick ="location.href='/customerNoticeView';">
					<span class='title'>국내   경매 구매수수료율 인상 및 약관 개정 안내</span>
					<span class='noticeDate'>2022-01-05</span>
					<span class='hit'>1</span>
				</div>
				<input type='checkbox' class='chkDeleteNotice'>				
				
			</div> 
			<div id='row'>
				<div class='item_sub' onclick ="location.href='/customerNoticeView';">
					<span class='title'>국내   경매 구매수수료율 인상 및 약관 개정 안내</span>
					<span class='noticeDate'>2022-01-05</span>
					<span class='hit'>1</span>
				</div>
				<input type='checkbox' class='chkDeleteNotice'>					
			</div>
			<div id='row'>
				<div class='item_sub' onclick ="location.href='/customerNoticeView';">
					<span class='title'>국내   경매 구매수수료율 인상 및 약관 개정 안내</span>
					<span class='noticeDate'>2022-01-05</span>
					<span class='hit'>1</span>
				</div>
				<input type='checkbox' class='chkDeleteNotice'>							
			</div>
			<div id='row'>
				<div class='item_sub' onclick ="location.href='/customerNoticeView';">
					<span class='title'>국내   경매 구매수수료율 인상 및 약관 개정 안내</span>
					<span class='noticeDate'>2022-01-05</span>
					<span class='hit'>1</span>
				</div>
				<input type='checkbox' class='chkDeleteNotice'>							
			</div>
			<div id='row'>
				<div class='item_sub' onclick ="location.href='/customerNoticeView';">
					<span class='title'>국내   경매 구매수수료율 인상 및 약관 개정 안내</span>
					<span class='noticeDate'>2022-01-05</span>
					<span class='hit'>1</span>
				</div>
				<input type='checkbox' class='chkDeleteNotice'>								
			</div>
			<div id='row'>
				<div class='item_sub' onclick ="location.href='/customerNoticeView';">
					<span class='title'>국내   경매 구매수수료율 인상 및 약관 개정 안내</span>
					<span class='noticeDate'>2022-01-05</span>
					<span class='hit'>1</span>
				</div>
				<input type='checkbox' class='chkDeleteNotice'>							
			</div>
			<div id='row'>
				<div class='item_sub' onclick ="location.href='/customerNoticeView';">
					<span class='title'>국내   경매 구매수수료율 인상 및 약관 개정 안내</span>
					<span class='noticeDate'>2022-01-05</span>
					<span class='hit'>1</span>
				</div>
				<input type='checkbox' class='chkDeleteNotice'>							
			</div>
			<div id='row'>
				<div class='item_sub' onclick ="location.href='/customerNoticeView';">
					<span class='title'>국내   경매 구매수수료율 인상 및 약관 개정 안내</span>
					<span class='noticeDate'>2022-01-05</span>
					<span class='hit'>1</span>
				</div>
				<input type='checkbox' class='chkDeleteNotice'>								
			</div>
		</div>
	<div id='btnZone'>
			
				<input type='button' value='&lt&lt' id='btnFirst' onclick='bid.move(1)'/>
				<input type='button' value='&lt' id='btnPrev'  onclick='bid.move(1)'/>
			
			
			<c:forEach var='i' begin='1' end='3'>
				<input type='button' value='${i }' class=""  onclick='bid.move(1)'/>
			</c:forEach>

			
				<input type='button' value='&gt' id='btnNext'  onclick='bid.move(1)'/>
				<input type='button' value='&gt&gt' id='btnLast'  onclick='bid.move(1)'/>
				<br/>
				<input type='button' id='btnWriteNotice' value='공지 작성' onclick='customerWriteNotice'>
				<input type='button' id='btnDeleteNotice' value='선택공지 삭제'>
			 			
	</div>
		
	</form>
		<form name='frm_page' id='frm_page' method='post'>
			<input type='hidden' name='nowPage' value=''>
			<input type='hidden' name='num' value=''>
		</form>
</div>
</body>
<script src='./js/final_lsy.js'></script>
</body>
</html>