<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel='stylesheet' type='text/css' href='./css/artbay_minseob.css'>
<script src = '/js/artbay_minseob.js'></script>
<title>회원 가입, 회원정보 수정, 회원 탈퇴 결과 페이지</title>
</head>
<body>
<!-- 결과 페이지는 팝업창으로 띄웁니다. 그리고 메인 화면은 홈페이지로 로그아웃 된 상태로 나가집니다. -->
<div id='memberResult'>
<div id='joLoMo' class='h1'>회원정보 수정이 완료되었습니다.</div> <!-- js에서 메시지 뿌려줄것 -->
	<div id='joLoMo2' class='join4'>ArtBay 가입을 축하드립니다!</div>
	<div class='join3'><input type='button' value='확인' id='btnOk' onclick='self.close()'></div>
	<input type='hidden' id='abcd' name='abcd'>
</div>
</body>
</html>