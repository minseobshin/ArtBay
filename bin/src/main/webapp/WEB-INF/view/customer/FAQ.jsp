<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800">
<link rel="stylesheet" href="css/reset.css">

<link rel='stylesheet' type='text/css' href='./css/final_lsy.css'>

<link rel="stylesheet" href="css/index.css">
</head>
<body>
<div class = "applyform">
	<h1>자주 하시는 질문</h1>
</div>
		
<div id='auction_faq'>
	<form name='frm_faq' id='frm_faq' method='post'>
		<input type='hidden' name='ctgr' value='general'>
	</form>
			<div class='container_faq'>
				<ul class='faq'>
					<li class='active' onclick="bid.category('general')">
						<strong>전체</strong>
					</li>
					<li class='active' onclick="bid.category('buy')">
						<strong>구매</strong>
					</li>
					<li class='active' onclick="bid.category('sell')">
						<strong>판매</strong>
					</li>
					<li class='active' onclick="bid.category('delivery')">
						<strong>배송</strong>
					</li>
					<li class='active' onclick="bid.category('m_info')">
						<strong>회원정보</strong>
					</li>
					<li class='active' onclick="bid.category('process')">
						<strong>경매진행</strong>
					</li>
					<li class='active' onclick="bid.category('pay_delivery')">
						<strong>입금/배송</strong>
					</li>
					<li class='active' onclick="bid.category('return_refund')">
						<strong>반송/환불</strong>
					</li>
					<li class='active' onclick="bid.category('credit_rate')">
						<strong>신용도</strong>
					</li>
					<li class='active' onclick="bid.category('etc')">
						<strong>기타</strong>
					</li>
					
				</ul>
			</div>
			<div class="faq_descList">
				<div class='faq_desc'>
			<c:forEach var='vo' items='${list }'>
					<ul class='faq_desc01_list'>
						<li>
							<input type="checkbox" id='${vo.serial }'>
							<label for='${vo.serial }'>${vo.title }</label>
							<div>
								<p>${vo.doc }</p>
							</div>
						</li>
					</ul>
			</c:forEach>
				</div>	
			</div>	
			
	
</div>
</body>
<script src='./js/final_lsy.js'></script>
</html>