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
			<input type='text' name='mid' id='midLogin' class='midLogin' placeholder="아이디">
			<input type='password' name='pwd' id='pwdLogin' class='midLogin' placeholder="비밀번호">
			 
			<input type='button' name='btnFindPwd' id='btnFindPwd' class='btnFindPwd' value='비밀번호찾기'>
			<input type='button' name='btnFindId' id='btnFindId' class='btnFindId' value='아이디찾기   |'>
			
			<input type='button' name='btnGoLogin' id='btnGoLogin' class='btnGoLogin' value='로그인'>
			<input type='button' name='btnCancelLogin' id='btnCancelLogin' value='취소'>
			<h5>아직 ArtBay 회원이 아니세요?</h5>
			<a href='mypageMemberJoin'>회원가입</a>
		</form>
		<form name='frm_findId' id='frm_findId' method='post'>
			<h1>아이디 찾기</h1>
			<input type='text' name='irum' id='irumFind' class='midLogin' placeholder="이름">
			<input type='text' name='memberJoinEmail' id='emailFind' class='midLogin' placeholder="이메일주소">
			
			<input type='button' name='btnFindPwd2' id='btnFindPwd2' class='btnFindPwd' value='비밀번호찾기'>
			<input type='button' name='btnLoginPage' id='btnLoginPage' class='btnFindId' value='로그인   |'>
			
			<input type='button' name='btnGoIdFind' id='btnGoIdFind' class='btnGoLogin' value='아이디찾기'>
			<input type='button' name='btnCancelLogin2' id='btnCancelLogin2' value='취소'>
			<input type='hidden' name='findedMid' id='findedMid'>
			
			<h5>아직 ArtBay 회원이 아니세요?</h5>
			<a href='mypageMemberJoin'>회원가입</a>
		</form>
		<form name='frm_findPwd' id='frm_findPwd' method='post'>
			<h1>비밀번호 찾기</h1>
			<input type='text' name='irum' id='irumFind2' class='midLogin' placeholder="이름">
			<input type='text' name='mid' id='idFind' class='midLogin' placeholder="아이디">
			
			<input type='button' name='btnFindPwd2' id='btnFindId2' class='btnFindPwd' value='아이디찾기'>
			<input type='button' name='btnLoginPage2' id='btnLoginPage2' class='btnFindId' value='로그인   |'>
			
			<input type='button' name='btnGoPwdFind' id='btnGoPwdFind' class='btnGoLogin' value='임시비밀번호발급(Email을 확인해주세요.)'>
			<input type='button' name='btnCancelLogin3' id='btnCancelLogin3' value='취소'>
			<input type='hidden' name='findedPwd' id='findedPwd'>
			<h5>아직 ArtBay 회원이 아니세요?</h5>
			<a href='mypageMemberJoin'>회원가입</a>
		</form>
	</div>
</div>
</body>
</html>