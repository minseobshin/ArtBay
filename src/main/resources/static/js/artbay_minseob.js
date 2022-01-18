/**
 * 
 */
//검증 정규식
function isMid(asValue) { //ID 영문/숫자 조합 5~12자리
	var regExp = /^(?=.*[a-zA-z])(?=.*[0-9]).{5,12}$/;
	return regExp.test(asValue);
}
function isIrum(asValue) { //한글/영어
	var regExp = /^[a-zA-Zㄱ-힣][a-zA-Zㄱ-힣 ]*$/;
	return regExp.test(asValue);
}
function isBirth(asValue) { //생년월일
	var regExp = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
	return regExp.test(asValue);
}
function isPhone(asValue) { //휴대전화
	var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
	return regExp.test(asValue);
}
function isPwd(asValue) { //비밀번호 영문/숫자/특수문자 최소 한가지 조합 8~16자
	var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
	return regExp.test(asValue);
}
function isEmail(asValue) { //이메일
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	return regExp.test(asValue);
}

$(function(){
	
	//초록불체크
	var mid, irum, birth, gender, phone, pwd, pwdChk;
	var now = new Date();

	//나이계산
	//$("#age").val(now.getFullYear()-$("#bitrh").val().split("-")[0]+1);
	
	//회원가입 화면 시작 =======================================================================
	
	//이메일인증 모달
	$('#btnCertification').click(function(){
		var ran = Math.floor(Math.random()*1000000);
		$('#certificationNum').val(ran);
		$('#certificationNum2').val(ran);
		$(".emailCheck").fadeIn();
	})
	//모달창 확인버튼 클릭
	$("#btnEmailCheck").click(function(){
		$("#memberJoinEmail").val($("#to_name").val());
		$("#memberJoinEmail").css({
			"border" : "1px solid green",
			"border-radius" : "3px",
			"background-color" : "#3f3"
		})
		$("#btnCertification").val('이메일 인증 번호가 전송되었으니 확인 후 입력해주세요.');
		$("#btnCertification").attr("disabled", true);
		$("#certificationChk").val(true);
		$("#certificationNumChk").removeAttr("disabled");
	})
	//취소
	$('.btnEmailCheckCancel').click(function(){
		$(".emailCheck").fadeOut();
	})
	
	//이메일 인증번호 체크
	$('#certificationNumChk').focusout(function(){
		if($('#certificationNum2').val() === $('#certificationNumChk').val()){
			$('#certificationNumChk').css({
				"border" : "1px solid green",
				"border-radius" : "3px",
				"background-color" : "#3f3"
			})
			$("#certificationNumChk").attr("readonly", true);
			$("#btnCertification").val('기본정보 및 주소를 입력해주세요.');
			$("#mid").removeAttr("disabled");
			$("#irum").removeAttr("disabled");
			$("#birth").removeAttr("disabled");
			$("#gender").removeAttr("disabled");
			$("#phone").removeAttr("disabled");
			$("#pwd").removeAttr("disabled");
			$("#pwdChk").removeAttr("disabled");
			$("#zip").removeAttr("disabled");
			$("#btnZip").removeAttr("disabled");
			$("#address").removeAttr("disabled");
			$("#address2").removeAttr("disabled");
			$("#btnJoin").removeAttr("disabled");
			$("#memberJoinEmail").removeAttr("disabled");
			$("#memberJoinEmail").attr("readonly", true);
			$("#injung").val("true");
			/*
			$("#birth").datepicker({
			  dateFormat: 'yy-mm-dd',
				maxDate: 0
			});*/
		}else{
			$("#btnCertification").val('이메일 인증 번호를 다시 확인해주세요.');
			$('#certificationNumChk').css({
				"border" : "2px solid red",
				"border-radius" : "3px",
				"background-color" : "white"
			})
		}
	})
	
	//아이디 중복체크 & 정규식
	$("#mid").focusout(function(){
		$param = $('#frm_join').serialize();
		$.post('checkId', $param, function(data){
			if(data == false){
				$("#mid").css({
					"border" : "2px solid red",
					"border-radius" : "3px",
					"background-color" : "white"
				})
				mid = 0;
				$("#btnCertification").val('중복 아이디입니다. 다른 아이디를 입력해주세요.');
			}else if(isMid($("#mid").val()) == false){
				$("#mid").css({
					"border" : "2px solid red",
					"border-radius" : "3px",
					"background-color" : "white"
				})
				mid = 0;
				$("#btnCertification").val('아이디를 정확히 입력해주세요. 영문/숫자 조합 5~12자리');
			}else{
				$("#mid").css({
					"border" : "1px solid green",
					"border-radius" : "3px",
					"background-color" : "#3f3"
				})
				mid = 1;
				$("#btnCertification").val('- ArtBay -');
			}
		})
	})
	
	//이름 정규식
	$("#irum").focusout(function(){
		if(isIrum($("#irum").val()) == false){
			$("#irum").css({
				"border" : "2px solid red",
				"border-radius" : "3px",
				"background-color" : "white"
			})
			irum = 0;
			$("#btnCertification").val('이름을 정확히 입력해주세요.');
		}else{
			$("#irum").css({
				"border" : "1px solid green",
				"border-radius" : "3px",
				"background-color" : "#3f3"
			})
			irum = 1;
			$("#btnCertification").val('- ArtBay -');
		}
	})
	
	//생년월일
	//api_only에 나이 계산하는 로직 focusout사용 artbay_minseob으로 옮기기
	//생년월일 정규식
	$("#birth").focusout(function(){
		if(isBirth($("#birth").val()) == false){
			$("#birth").css({
				"border" : "2px solid red",
				"border-radius" : "3px",
				"background-color" : "white"
			})
			birth = 0;
			$("#btnCertification").val('생년월일을 정확히 입력해주세요.');
		}else{
			$("#birth").css({
				"border" : "1px solid green",
				"border-radius" : "3px",
				"background-color" : "#3f3"
			})	
			birth = 1;
			$("#btnCertification").val('- ArtBay -');
		}
	})
	
	//성별
	$("#gender").focusout(function(){
		if($("#gender").val() == 'M' || $("#gender").val() == "W"){
			$("#gender").css({
				"border" : "1px solid green",
				"border-radius" : "3px",
				"background-color" : "#3f3"
			})
			gender = 1;
			$("#btnCertification").val('- ArtBay -');
		}else{
			$("#gender").css({
				"border" : "2px solid red",
				"border-radius" : "3px",
				"background-color" : "white"
			})
			gender = 0;
			$("#btnCertification").val('성별을 입력해주세요.');
		}
	})
	
	//휴대전화 정규식
	$("#phone").focusout(function(){
		if(isPhone($("#phone").val()) == false){
			$("#phone").css({
				"border" : "2px solid red",
				"border-radius" : "3px",
				"background-color" : "white"
			})
			phone = 0;
			$("#btnCertification").val('휴대전화 번호를 정확히 입력해주세요. 010-0000-0000');
		}else{
			$("#phone").css({
				"border" : "1px solid green",
				"border-radius" : "3px",
				"background-color" : "#3f3"
			})	
			phone = 1;
			$("#btnCertification").val('- ArtBay -');
		}
	})
	
	//이메일 정규식
	/*
	$(".email").focusout(function(){
		if($(".email").val().trim() == ""){
			$(".email").css({
				"border" : "2px solid red",
				"border-radius" : "3px",
				"background-color" : "white"
			})
			email = 0;
			$("#btnCertification").val('이메일 주소를 정확히 입력해주세요.');
		}else if(isEmail($(".email").val()) == false){
			$(".email").css({
				"border" : "2px solid red",
				"border-radius" : "3px",
				"background-color" : "white"
			})
			email = 0;
			$("#btnCertification").val('이메일 주소를 정확히 입력해주세요.');
		}else{
				$(".email").css({
					"border" : "1px solid green",
					"border-radius" : "3px",
					"background-color" : "#3f3"
				})
				email = 1;
				$("#btnCertification").val('- ArtBay -');
			}
		})
		*/
	
	//비밀번호 정규식
	$("#pwd").focusout(function(){
		$("#pwdChk").val("");
		$("#pwdChk").css({
				"border" : "1px solid gray",
				"border-radius" : "3px",
				"background-color" : "white"
			})
		if(isPwd($("#pwd").val()) == false){
			$("#pwd").css({
				"border" : "2px solid red",
				"border-radius" : "3px",
				"background-color" : "white"
			})
			pwd = 0;
			$("#btnCertification").val('비밀번호를 정확히 입력해주세요. 영문/숫자/특수문자 최소 한가지 조합 8~16자');
		}else{
			$("#pwd").css({
				"border" : "1px solid green",
				"border-radius" : "3px",
				"background-color" : "#3f3"
			})	
			pwd = 1;
			$("#btnCertification").val('- ArtBay -');
		}
	})
	
	//비밀번호 확인
	$("#pwdChk").focusout(function(){
		if($("#pwd").val() === $("#pwdChk").val() && pwd === 1){
			$("#pwdChk").css({
				"border" : "1px solid green",
				"border-radius" : "3px",
				"background-color" : "#3f3"
			})
			pwdChk = 1;
			$("#btnCertification").val('- ArtBay -');
		}else if(pwd === 0){
			$("#pwdChk").css({
				"border" : "2px solid red",
				"border-radius" : "3px",
				"background-color" : "white"
			})
			pwdChk = 0;
			$("#btnCertification").val('비밀번호를 정확히 입력해주세요. 영문/숫자/특수문자 최소 한가지 조합 8~16자');
		}else{
			$("#pwdChk").css({
				"border" : "2px solid red",
				"border-radius" : "3px",
				"background-color" : "white"
			})
			pwdChk = 0;
			$("#btnCertification").val('비밀번호가 다릅니다. 정확히 입력해주세요.');
		}
	})
	
			/*if($("#address2").val().trim() == ""){
				$("#address2").css({
					"border" : "2px solid red",
					"border-radius" : "3px",
					"background-color" : "white"
				})
			}*/
	
	//결과창 팝업
	//회원가입 버튼 이벤트
	$("#btnJoin").click(function(){
		if(mid&&irum&&birth&&gender&&phone&&pwd&&pwdChk === 1 && $("#zip").val() !== "" && $("#address2").val() !== ""){
			$param = $('#frm_join').serialize();
			$.post('insertMemberSave', $param, function(){
				window.open('mypageMemberResult', 'result', 'width=750, height=445, top=200, left=300');
			});
		}else{
			$("#btnCertification").val('모든 정보를 입력해주세요.');
		}
	})
	
	//회원가입 화면 끝 =======================================================================
	
	//회원정보수정 화면 시작 =======================================================================
	
	$("#oldPwd").focusout(function(){
		$param = $("#frm_join").serialize();
		$.post('')
	})
	
	$('#btnModify').click(function(){
		window.open('mypageMemberResult', 'result', 'width=750, height=445, top=200, left=300');
	})
	
	//회원정보수정 화면 끝 =======================================================================
	
	//회원탈퇴 화면 시작 =======================================================================
	
	$('#btnOutChk').click(function(){
		window.open('mypageMemberResult', 'result', 'width=750, height=445, top=200, left=300');
	})
	
	//탈퇴 모달창
	$('#btnOut').click(function(){
		$('#out_chk').fadeIn();
	})
	//탈퇴 모달창 취소
	$('#btnOutCancel').click(function(){
		$('#out_chk').fadeOut();
	})
	
	//회원탈퇴 화면 끝 =======================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
})