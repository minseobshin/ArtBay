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
<div class = "applyform">
	<h1>공지사항</h1>
	<div class="bgImgCustomer"></div>
</div>

<div id='noticeList'>

	<form name='frm_notice' id='frm_notice' method='post'>
		<div id='noticeSearch'>
			<output>공지사항 ${page.totSize }건</output>
			<div id='findZone'>
				<input type='search' name='findStr' value='${page.findStr }' size='28' placeholder="검색어">
				<input type='button' id='btnNoticeSearch' value='검색'> 
				<input type='hidden' name='nowPage' value='${page.nowPage }'>
				<input type='hidden' name='serial' value='${vo.serial}'>
				<input type='hidden' name='hiddenChk' id='hiddenChk'>
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
			<c:if test="${ sessionScope.sv.mid eq 'chicken' }">
			<span class='chkDeleteNotice'>공지삭제</span>
			</c:if>	
			<br/>				
	
		</div>
		
		<div id='rows'>
		
			<c:forEach var='vo' items="${list }">
				<div id='row'>
					<div class='item_sub' onclick='ntc.noticeView(${vo.serial})'>
						<span class='title'>${vo.title }</span>
						<span class='noticeDate'>${vo.not_date }</span>
						<span class='hit'>${vo.hit }</span>
					</div>
					<c:if test="${ sessionScope.sv.mid eq 'chicken' }">
					<input type='checkbox' class='chkDeleteNotice' name='delNotice' value='${vo.serial }'>	
					</c:if>			
				</div> 
			</c:forEach>
			
		</div>
		<div id='btnZone'>
			<c:if test="${page.startPage>1 }">
				<input type='button' value='맨첨' id='btnFirst' onclick='ntc.noticePage(1)'/>
				<input type='button' value='이전' id='btnPrev'  onclick='ntc.noticePage(${page.startPage-1})'/>
			</c:if>
			
			<c:forEach var='i' begin="${page.startPage }" end='${page.endPage }'>
				<input type='button' value='${i }' class="${(i==page.nowPage)? 'here' :'' }"  onclick='ntc.noticePage(${i})'/>
			</c:forEach>

			<c:if test="${page.endPage<page.totPage }">
				<input type='button' value='다음' id='btnNext'  onclick='ntc.noticePage(${page.endPage+1})'/>
				<input type='button' value='맨끝' id='btnLast'  onclick='ntc.noticePage(${page.totPage})'/>
			</c:if> 			
		<br/>
		
		</div>

			<c:if test="${ sessionScope.sv.mid eq 'chicken' }">
				<input type='button' id='btnDeleteNotice' value='선택공지 삭제' >
				<input type='button' id='btnWriteNotice' value='공지 작성'>
			</c:if>
			
	<!--  선택 삭제 모달창 -->
		<div id='deleteNotice_alert'>
			<form name='frm_deleteNotice' id='frm_deleteNotice' method='post'>
				<div id='close-area'>X</div>
				
				<div>선택한 공지 <input type="text" id='countChk' size='1' readOnly>개를 삭제하시겠습니까?</div>
				<input type='button' id='btnConfirmDelete' value='확인'>
				<input type='button' id='btnConfirmCancel' value='취소'>
			</form>	
		</div>
	</div>	
	
</div>

<script src='./js/final_lsy.js'></script>
</body>
</html>