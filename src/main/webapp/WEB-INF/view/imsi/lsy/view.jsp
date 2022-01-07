<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel='stylesheet' type='text/css' href='./css/final_lsy.css'>

<title>응찰내역 view</title>
</head>
<body>
<div id='auction_view'>
<h1>상세보기</h1>

<h4>응찰 내역 상세</h4>
	
	<label>번호</label>
	<input type='text' name='num' value='${num }' >
	<br/>
	<label>작품</label>
	<input type='text' size='30' name='' value='${name }' >
	<br/>
	<label>작가명</label>
	<input type='text' name='author' value='${author }' >
	<hr/>
	<label>작품명</label>
	<input type='date' name='artName' value='${artName }'  >
	<br/>
	
		<label>위탁신청 일자</label>
		<input type='text' name='consignDate' value=${consignDate }>
		<br/>
	
		<label>응찰일자</label>
		<input type='text' name='requestDate' value='${requestDate }' >
		<br/>
		<label>응찰가격</label>
		<input type='text' name='requestPrice' value='${requestPrice }'>
		<br/>
	
		<label>낙찰일자</label>
		<input type='text' name='successDate' size='5' value='${successPrice }' >
		<br/>
		<label>낙찰가격</label>
		<input type='text' name='successPrice' value='${successPrice }'>
	<br/>
	
	<c:choose>
 		<c:when test="${empty file }">
			 <img src='http://placehold.it/200x250'/>
		 </c:when>
		 <c:otherwise>
		 	<img src ='./upload/${vo.photo }' width='200' height='250'/>
 		</c:otherwise>
		</c:choose>
<form name='frm_view' id='frm_view' method='post'>		
	<input type='text' name='nowPage' value='${nowPage }'>
	<input type='text' name='num' value='${num }'>	
</form>
</div>
<script src='./js/final_lsy.js'></script>
</body>
</html>