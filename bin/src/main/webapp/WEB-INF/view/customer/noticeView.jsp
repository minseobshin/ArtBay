<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div id='noticeView'>
	<h1>공지사항</h1>
	<div id='noticeView_sub'>
		<div id='title'>${vo.title } <span>${vo.not_date }</span></div>
	
			<p>
				${vo.doc }
			</p>
	</div>
	<input type='button' id='btnNoticeList' value='목록'>
</div>
</body>
<script src='./js/final_lsy.js'></script>
</html>