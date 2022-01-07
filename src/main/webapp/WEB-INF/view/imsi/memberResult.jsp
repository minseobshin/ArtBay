<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel='stylesheet' type='text/css' href='./css/artbay_minseob.css'>
<script src = '/js/artbay_minseob.js'></script>
<title>회원 가입, 회원정보 수정, 회원 탈퇴 결과 페이지</title>
</head>
<body>
<!-- 결과 페이지는 팝업창으로 띄웁니다. 그리고 메인 화면은 홈페이지로 로그아웃 된 상태로 나가집니다. -->
<div id='memberResult'>
<h1 id='h'>가입/수정/탈퇴 결과 메시지 임시</h1>
	<div class='join4'>
		ArtBay 가입을 환영합니다.
		회원정보 수정이 완료되었습니다.
		회원 탈퇴가 완료되었습니다.
		중 하나 표시 예정.
	</div>
	<div class='join3'><input type='button' value='확인' id='btnOk' onclick='self.close()'></div>
</div>
</body>
</html>