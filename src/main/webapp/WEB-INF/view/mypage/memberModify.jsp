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
<title>회원정보 수정</title>
</head>
<body>
<div class='h1'>ArtBay 회원정보 수정</div>
<div id='join'>
<form name='frm_join' method='post'>
	<div class='h5'>➢ 본인인증</div>
	<input type='button' name='btnCertification' id='btnCertification' value='✉ 이메일 본인 인증'>
	<br>
	<!-- readonly 부분은 핸드폰 본인인증 후 DB에서 읽어와서 뿌려줌 -->
	<div class='h5'>➢ 개인정보 변경</div>
	<input type='text' name='mid' id='mid' readonly="readonly">
	<input type='text' name='irum' id='irum' readonly="readonly">
	<input type='text' name='birth' id='birth' readonly="readonly">
	<input type='text' name='phone' id='phone' readonly="readonly">
	<input type='text' name='email' class='email' placeholder="이메일">
	<br>
	<div class='h5'>➢ 비밀번호 변경</div>
	<div class='h5'>비밀번호 변경을 원하신다면, 현재 비밀번호를 기입 후, '새 비밀번호'란에 변경할 비밀번호를 입력하세요.</div>
	<input type='password' name='pwd' id='pwd' required="required" placeholder="현재 비밀번호">
	<br>
	<input type='password' name='newPwd' id='newPwd' required="required" placeholder="새 비밀번호">
	<br>
	<input type='password' name='newPwdChk' id='newPwdChk' required="required" placeholder="새 비밀번호 확인">
	<br>
	<div class='h5'>➢ 주소 변경</div>
	<input type='text' name='zip' id='zip' required="required" readonly="readonly">
	<input type='button' value='우편번호' name='btnZip' id='btnZip'>
	<br>
	<input type='text' name='address' id='address' readonly="readonly">
	<input type='text' name='address2' id='address2'>
	<br>
	<div class='join3'>
		<input type='submit' name='btnModify' id='btnModify' value='수정'>
	</div>
</form>
<form name='frm_out' method='post'>
	<!-- 탈퇴 버튼 누르면 배경 어두워지며 팝업생성 -->
	<div class='h5'>➢ 회원 탈퇴</div>
	<input type='button' name='btnOut' id='btnOut' value='탈퇴'>
</form>

	<!-- 탈퇴시 확인 화면(모달창) -->
	<div id='out_chk'>
		<form name='frm_outChk' method='post'>
			<div class='h5'>➢ 탈퇴사유</div>
				<label><input type='checkbox' name='outEu'> 이용 빈도 낮음</label>
				<label><input type='checkbox' name='outEu'> 회원 혜택 부족</label>
				<label><input type='checkbox' name='outEu'> 과한 광고 메시지</label>
			<br>
				<label><input type='checkbox' name='outEu'> 이용하고자 하는 정보 없음</label>
				<label><input type='checkbox' name='outEu'> 서비스 불만</label>
				<label><input type='checkbox' name='outEu'> 개인정보 유출 우려</label>
			<br/>
			<textarea name='outEu2' placeholder="탈퇴 사유를 입력해 주시면 사이트 개선에 적극 반영하겠습니다."></textarea>
			<div class='h5'>➢ 탈퇴신청</div>
			<div class='h5'>아이디와 비밀번호를 한번 더 입력한 후 탈퇴신청을 해 주시기 바랍니다.</div>
			<input type='text' name='mid' id='mid' placeholder='ID' required="required">
			<input type='password' name='pwd' id='pwd' placeholder="비밀번호" required="required">
			<br/><br>
			<label><input type='checkbox' name='outChk'> 회원 탈퇴에 동의합니다.</label>
			<br>
			<div class='join3'>
				<input type='button' name='btnOutChk' id='btnOutChk' value='회원탈퇴'>
				<input type='button' name='btnOutCancel' id='btnOutCancel' value='취소'>
			</div>
		</form>
	</div>
</div>
</body>
</html>