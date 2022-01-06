<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
<h1>회원정보 수정</h1>
<div id='join'>
<form name='frm_join' method='post'>
	<h5>본인인증</h5>
	<input type='button' name='btnCertification' value='핸드폰 본인 인증'>
	<br>
	<!-- readonly 부분은 핸드폰 본인인증 후 DB에서 읽어와서 뿌려줌 -->
	<h5>개인정보 변경</h5>
	<input type='text' name='id' readonly="readonly">
	<input type='text' name='irum' readonly="readonly">
	<input type='text' name='birth' readonly="readonly">
	<input type='text' name='phone' readonly="readonly">
	<input type='text' name='email' placeholder="이메일">
	<br>
	<h5>비밀번호 변경</h5>
	<span>비밀번호 변경을 원하신다면, 현재 비밀번호를 기입 후, '새 비밀번호'란에 변경할 비밀번호를 입력하세요.</span>
	<br>
	<span>현재 비밀번호</span>
	<input type='password' name='pwd' required="required">
	<br>
	<span>새 비밀번호</span>
	<input type='password' name='newPwd' required="required">
	<br>
	<span>새 비밀번호 확인</span>
	<input type='password' name='newPwdChk' required="required">
	<br>
	<h5>주소 변경</h5>
	<input type='text' name='zip' required="required">
	<input type='button' value='우편번호' name='btnZip'>
	<br>
	<input type='text' name='address'>
	<input type='text' name='address2'>
	<br>
	<input type='submit' name='btnModify' value='수정'>
</form>
<form name='frm_out' method='post'>
	<!-- 탈퇴 버튼 누르면 배경 어두워지며 팝업생성 -->
	<h5>회원 탈퇴</h5>
	<input type='button' name='btnOut' value='탈퇴'>
</form>
</div>
</body>
</html>