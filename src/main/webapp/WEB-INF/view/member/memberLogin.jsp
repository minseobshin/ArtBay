<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel='stylesheet' type='text/css' href='./css/artbay_minseob.css'>
<script src = '/js/login_only.js'></script>
<title>로그인 페이지</title>
</head>
<body>
<div id='memberLogin'>
	<div id='memberLogin2'>
		<form name='frm_memberLogin' id="frm_memberLogin" method='post'>
			<h1>LOGIN</h1>
			<input type='text' name='mid' id='midLogin' class='midLogin' placeholder="아이디" required="required">
			<input type='password' name='pwd' id='pwdLogin' class='midLogin' placeholder="비밀번호" required="required">
			<input type='button' name='btnGoLogin' id='btnGoLogin' class='btnGoLogin' value='로그인'>
			<input type='button' name='btnCancelLogin' id='btnCancelLogin' value='취소'>
			<h5>아직 ArtBay 회원이 아니세요?</h5>
			<a href='mypageMemberJoin'>회원가입</a>
		</form>
	</div>
</div>
</body>
</html>