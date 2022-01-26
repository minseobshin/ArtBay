<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src = '/js/artbay_minseob.js'></script>
<script src = '/js/api_only.js'></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800">
<!-- 
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
 -->
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
	<input type='text' name='certificationNumChk' id='certificationNumChk' placeholder='이메일 인증번호' disabled>
	<br>
	<div class='h5'>➢ 기본정보</div>
	<input type='text' name='mid' id='mid' placeholder='ID 영문/숫자 조합 5~12자리' disabled>
	<input type='text' name='irum' id='irum' placeholder='이름' disabled>
	<input type='date' name='birth' id='birth' placeholder='생년월일 2000-12-30' disabled>
	<select name='gender' id='gender' disabled>
		<option value=''>성별</option>
		<option value='M'>남</option>
		<option value='W'>여</option>
	</select>
	<input type='text' name='phone' id='phone' placeholder='휴대전화 010-0000-0000' disabled>
	<input type='text' name='memberJoinEmail' id='memberJoinEmail' class='email' placeholder="이메일" disabled>
	<input type='password' name='pwd' id='pwd' placeholder="비밀번호" disabled>
	<input type='password' name='pwdChk' id='pwdChk' placeholder="비밀번호 확인" disabled>
	<div class='h5'>➢ 주소</div>
	<input type='text' name='zip' id='zip' readonly placeholder="우편번호" disabled>
	<input type='button' value='우편번호' name='btnZip' id='btnZip' disabled>
	<br/>
	<input type='text' name='address' id='address' readonly required="required" placeholder="주소" disabled>
	<input type='text' name='address2' id='address2' required="required" placeholder="상세주소" disabled>
	<div class='join3'>
		<input type='button' name='btnJoin' id='btnJoin' value='가입 하기' disabled>
	</div>
	<div class='h6'>* 추후 My Page에서 수정 가능합니다.</div>
	<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!히든영역!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<input type='hidden' name='m_status' id='m_status' value='Y'> <!-- 탈퇴여부표시 Y(회원), N(탈퇴) -->
	<input type='hidden' name='age' id='age' value='0'> <!-- 나이 -->
	<input type='hidden' name='certificationNum2' id='certificationNum2'> <!-- 이메일 인증번호 -->
	<input type='hidden' name='injung' id='injung' value='false'> <!-- 이메일 인증 완료여부 -->
	<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!히든영역!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
</form>
</div>
</div>
<div class='emailCheck'>
	<div class='emailCheck2'>
		<form name='frm_emailCheck' id='frm_emailCheck' method='post'>
			<h3 class='h3'>이메일 본인인증</h3>
			<input type='text' name='irum' class='irumc' placeholder='이름' required="required">
			<input type='text' name='to_name' id='to_name' class='emailc' placeholder="이메일" required="required">
			<input type='submit' name='btnEmailCheck' id='btnEmailCheck' class='btnEmailCheck' value='보내기'>
			<input type='hidden' name='btnEmailCheck2' id='btnEmailCheck2' class='btnEmailCheck' value='보내기'>
			<input type='button' name='btnEmailCheckCancel' class='btnEmailCheckCancel' value='취소'>
			<script type="text/javascript">emailjs.init('user_ufZewS7yUXgBnIZvq9AT3')</script>
			<input type='hidden' name='certificationNum' id='certificationNum'>
			<br/>
			<br/>
		</form>
	</div>
</div>
</body>
</html>