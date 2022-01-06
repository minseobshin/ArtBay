<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<h1>회원가입</h1>
<div id='join'>
<form name='frm_join' method='post'>
	<h5>본인인증</h5>
	<input type='button' name='btnCertification' value='핸드폰 본인 인증'>
	<br>
	<h5>기본정보</h5>
	<input type='text' name='id' placeholder='ID 영문/숫자 조합 5~12자리' required="required">
	<input type='text' name='irum' placeholder='이름' required="required">
	<input type='text' name='birth' placeholder='생년월일 2000-12-30' required="required">
	<input type='text' name='phone' placeholder='휴대전화 숫자만 입력' required="required">
	<input type='text' name='email' placeholder="이메일" required="required">
	<input type='password' name='pwd' placeholder="비밀번호" required="required">
	<input type='password' name='pwdChk' placeholder="비밀번호 확인" required="required">
	<h5>주소</h5>
	<input type='text' name='zip' readonly placeholder="우편번호" required="required">
	<input type='button' value='우편번호' name='btnZip'>
	<br/>
	<input type='text' name='address' required="required">
	<br/>
	<input type='text' name='address2' required="required">
	<br/>
	<input type='submit' name='btnJoin' value='가입 하기'>
	
	<h6>* 추후 My Page에서 수정 가능합니다.</h6>
</form>
</div>
</body>
</html>