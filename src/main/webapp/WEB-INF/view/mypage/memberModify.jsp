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
<title>회원정보 수정</title>
</head>
<body>
<div class='h1'>ArtBay 회원정보 수정</div>
<div id='join'>
<form name='frm_join' id='frm_join' method='post'>
	<div class='h5'>회원정보 수정을 위해 먼저 현재 비밀번호를 입력한 후 진행해주세요.</div>
	<div class='h5'>➢ 현재 비밀번호 입력</div>
	<input type='button' name='btnCertification' id='btnCertification' value='계속 진행하시려면 현재 비밀번호를 입력해주세요.' disabled>
	<input type='password' name='oldPwd' id='oldPwd' placeholder="현재 비밀번호">
	<input type='hidden' name='injung' id='injung' placeholder="현재 비밀번호가 말을 안들어서 얘로 대체함">
	<div class='h5'>➢ 개인정보 변경</div>
	<input type='text' name='mid' id='mid' readonly="readonly" disabled>
	<input type='text' name='irum' id='irum' readonly="readonly" disabled>
	<input type='date' name='birth' id='birth' readonly="readonly" disabled>
	<input type='text' name='phone' id='phone' placeholder="전화번호" disabled>
	<input type='text' name='memberJoinEmail' id='memberJoinEmail' class='email' placeholder="이메일" disabled>
	<input type='text' name='certificationNumChk2' id='certificationNumChk2' placeholder='이메일 인증번호' disabled>
	<br>
	<div class='h5'>➢ 비밀번호 변경</div>
	<div class='h5'>비밀번호 변경을 원하신다면, 현재 비밀번호를 입력 후, '새 비밀번호'란에 변경할 비밀번호를 입력하세요.</div>
	<input type='password' name='newPwd' id='newPwd' placeholder="새 비밀번호" disabled>
	<br>
	<input type='password' name='newPwdChk' id='newPwdChk' placeholder="새 비밀번호 확인" disabled>
	<br>
	<div class='h5'>➢ 주소 변경</div>
	<input type='text' name='zip' id='zip' readonly="readonly" disabled>
	<input type='button' value='우편번호' name='btnZip' id='btnZip' disabled>
	<br>
	<input type='text' name='address' id='address' readonly="readonly" disabled>
	<input type='text' name='address2' id='address2' disabled>
	<br>
	<div class='join3'>
		<input type='button' name='btnModify' id='btnModify' value='수정' disabled>
	</div>
	<input type='hidden' name='certificationNum2' id='certificationNum2'> <!-- 이메일 인증번호 -->
</form>
<form name='frm_out' method='post'>
	<!-- 탈퇴 버튼 누르면 배경 어두워지며 팝업생성 -->
	<div class='h5'>➢ 회원 탈퇴</div>
	<input type='button' name='btnOut' id='btnOut' value='탈퇴' disabled>
</form>

	<!-- 탈퇴시 확인 화면(모달창) -->
	<div id='out_chk'>
		<form name='frm_outChk' id='frm_outChk' method='post'>
			<div class='h5'>➢ 탈퇴사유</div>
				<label><input type='checkbox' name='outEu1'> 이용 빈도 낮음</label>
				<label><input type='checkbox' name='outEu2'> 회원 혜택 부족</label>
				<label><input type='checkbox' name='outEu3'> 과한 광고 메시지</label>
			<br>
				<label><input type='checkbox' name='outEu4'> 이용하고자 하는 정보 없음</label>
				<label><input type='checkbox' name='outEu5'> 서비스 불만</label>
				<label><input type='checkbox' name='outEu6'> 개인정보 유출 우려</label>
			<br/>
			<textarea name='outEu7' placeholder="탈퇴 사유를 입력해 주시면 사이트 개선에 적극 반영하겠습니다."></textarea>
			<div class='h5'>➢ 탈퇴신청</div>
			<div class='h5'>아이디와 비밀번호를 한번 더 입력한 후 탈퇴신청을 해 주시기 바랍니다.</div>
			<input type='text' name='midOut' id='midOut' placeholder='ID' required="required">
			<input type='password' name='pwdOut' id='pwdOut' placeholder="비밀번호" required="required">
			<br/><br>
			<label><input type='checkbox' name='outChk' id='outChk'> 회원 탈퇴에 동의합니다.</label>
			<br>
			<div class='join3'>
				<input type='button' name='btnOutChk' id='btnOutChk' value='회원탈퇴'>
				<input type='button' name='btnOutCancel' id='btnOutCancel' value='취소'>
			</div>
		</form>
	</div>
	<!-- 이메일인증 모달창 -->
	<div class='emailCheck'>
	<div class='emailCheck2'>
		<form name='frm_emailCheck' id='frm_emailCheck' method='post'>
			<h3 class='h3'>이메일 본인인증</h3>
			<input type='text' name='irum' class='irumc' placeholder='이름' required="required">
			<input type='text' name='to_name' id='to_name' class='emailc' placeholder="이메일" required="required">
			<input type='submit' name='btnEmailCheck2' id='btnEmailCheck2' class='btnEmailCheck' value='보내기'>
			<input type='hidden' name='btnEmailCheck' id='btnEmailCheck' class='btnEmailCheck' value='보내기'>
			<input type='button' name='btnEmailCheckCancel' class='btnEmailCheckCancel' value='취소'>
			<script type="text/javascript">emailjs.init('user_ufZewS7yUXgBnIZvq9AT3')</script>
			<input type='hidden' name='certificationNum' id='certificationNum'>
			<br/>
			<br/>
		</form>
	</div>
</div>
</div>
</body>
</html>