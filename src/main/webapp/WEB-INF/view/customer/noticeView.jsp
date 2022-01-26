<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' type='text/css' href='./css/final_lsy.css'>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel='stylesheet' type='text/css' href="./css/basic.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800">

<title>공지사항 상세</title>
</head>
<body>
<div class = "applyform">
	<h1>공지사항</h1>
</div>
<div id='noticeView'>

	<div id='noticeView_sub'>
		<div id='title'>${vo.title } <span>${vo.not_date }</span></div>
	
			<p>
				${vo.doc }
			</p>
	</div>
	<input type='button' id='btnNoticeList' value='목록'>
</div>
<form name='frm_notice' id='frm_notice' method='post'>
		<div id='noticeSearch'>
			<div id='findZone'>
				<input type='hidden' name='findStr' value='${page.findStr }' >
				<input type='hidden' name='nowPage' value='${page.nowPage }'>
				<input type='text' name='serial' value='${vo.serial}'>
				<input type='text' name='msg' value='${msg }'>
				<input type='hidden' name='hiddenChk' id='hiddenChk'>
			</div>
		
		</div>
		
		<div id='attList'>
		<c:if test="${not empty vo.attList }">
			<label>파일 첨부</label>
			<div class='attZone'>
				<ul>
				<c:forEach var='att' items="${vo.attList }">
					<li><a href='./upload/${att.attFile }' download='${att.attFile }'>${att.attFile }</a></li>
				</c:forEach>
				</ul>
			</div>
		</c:if>
		</div>
	</form>
</body>
<script src='./js/final_lsy.js'></script>
</html>