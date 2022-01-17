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
	<form name='frm_notice' id='frm_notice' method='post'>
		<div id='noticeSearch'>
			<output>공지사항 300건</output>
			<div id='findZone'>
				<input type='search' name='findStr' value='${page.findStr }' size='28' placeholder="검색어">
				<input type='button' id='btnNoticeSearch' value='검색'> 
				<input type='text' name='nowPage' value='${page.nowPage }'>
				<input type='text' name='serial' value='${vo.serial}'>
			</div>
		
		</div>
	</form>
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
		
			<c:forEach var='vo' items="${list }">
				<div id='row'>
					<div class='item_sub' onclick='bid.noticeView(${vo.serial})'>
						<span class='title'>${vo.title }</span>
						<span class='noticeDate'>${vo.not_date }</span>
						<span class='hit'>${vo.hit }</span>
					</div>
					<input type='checkbox' class='chkDeleteNotice'>				
				</div> 
			</c:forEach>
			
		</div>
		<div id='btnZone'>
			<c:if test="${page.startPage>1 }">
				<input type='button' value='맨첨' id='btnFirst' onclick='bid.noticePage(1)'/>
				<input type='button' value='이전' id='btnPrev'  onclick='bid.noticePage(${page.startPage-1})'/>
			</c:if>
			
			<c:forEach var='i' begin="${page.startPage }" end='${page.endPage }'>
				<input type='button' value='${i }' class="${(i==page.nowPage)? 'here' :'' }"  onclick='bid.noticePage(${i})'/>
			</c:forEach>

			<c:if test="${page.endPage<page.totPage }">
				<input type='button' value='다음' id='btnNext'  onclick='bid.noticePage(${page.endPage+1})'/>
				<input type='button' value='맨끝' id='btnLast'  onclick='bid.noticePage(${page.totPage})'/>
			</c:if> 			
		<br/>
		<input type='button' id='btnDeleteNotice' value='선택공지 삭제'>
		</div>

	</div>		
</div>

<script src='./js/final_lsy.js'></script>
</body>
</html>