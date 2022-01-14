<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src = '/js/artbay_minseob.js'></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/index.css">
<link rel='stylesheet' type='text/css' href='./css/artbay_minseob.css'>
<title>회원가입</title>
</head>
<body>
<div class='h1'>ArtBay 회원가입</div>
<div id='join'>
<div class='h5'>본인 인증 후 기본 정보 및 주소를 입력해주세요.</div>
<div id='join2'>
<form name='frm_join' id='frm_join' method='post'>
	<div class='h5'>➢ 본인인증</div>
	<input type='button' name='btnCertification' id='btnCertification' value='✉ 이메일 본인 인증'>
	<br>
	<div class='h5'>➢ 기본정보</div>
	<input type='text' name='mid' id='mid' placeholder='ID 영문/숫자 조합 5~12자리' required="required">
	<input type='text' name='irum' id='irum' placeholder='이름' required="required">
	<input type='text' name='birth' id='birth' placeholder='생년월일 2000-12-30' required="required">
	<input type='text' name='gender' id='gender' placeholder='성별' required="required">
	<input type='text' name='phone' id='phone' placeholder='휴대전화 숫자만 입력' required="required">
	<input type='text' name='email' class='email' placeholder="이메일" required="required">
	<input type='password' name='pwd' id='pwd' placeholder="비밀번호" required="required">
	<input type='password' name='pwdChk' id='pwdChk' placeholder="비밀번호 확인" required="required">
	<div class='h5'>➢ 주소</div>
	<input type='text' name='zip' id='zip' readonly placeholder="우편번호" required="required">
	<input type='button' value='우편번호' name='btnZip' id='btnZip'>
	<br/>
	<input type='text' name='address' id='address' readonly required="required" placeholder="주소">
	<input type='text' name='address2' id='address2' required="required" placeholder="상세주소">
	<div class='join3'>
		<input type='button' name='btnJoin' id='btnJoin' value='가입 하기'>
	</div>
	<div class='h6'>* 추후 My Page에서 수정 가능합니다.</div>
	<input type='text' name='m_status' id='m_status' value='Y'>
	<input type='text' name='age' id='age'>
</form>
</div>
</div>
</body>
</html>