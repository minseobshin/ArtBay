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
	var mid, irum, birth, gender, phone, pwd, pwdChk, newPwd, newPwdChk, certification;
	var now = new Date();

	//나이계산
	//$("#age").val(now.getFullYear()-$("#bitrh").val().split("-")[0]+1);
	
	//회원가입 화면 시작 =======================================================================
	
	//이메일인증 모달
	$('#btnCertification').click(function(){
		certification=0;
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
		$("#certificationNumChk").css({
			"visibility" : "visible"
		})
	})
	//취소
	$('.btnEmailCheckCancel').click(function(){
		$(".emailCheck").fadeOut();
	})
	
	//이메일 인증번호 체크
	$('#certificationNumChk').focusout(function(){
		if(certification==0){
			if($('#certificationNum2').val() === $('#certificationNumChk').val()){
				$('#certificationNumChk').css({
					"border" : "1px solid green",
					"border-radius" : "3px",
					"background-color" : "#3f3"
				})
				phone=0; //회원가입, 수정 id 중복사용 구분용
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
		if(phone==0 || phone==1){
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
	
	//비밀번호 입력 후 기본 정보 뿌리기
	var num;
	var rollback;
	$("#oldPwd").focusout(function(){
		$param = $("#frm_join").serialize();
		$.ajax({
			url: "/pwdChkForModi",
			data: $param,
			type: "POST",
			success: function(data){
				if(data.oldPwd === "passPwd"){
					$("#memberJoinEmail").removeAttr("disabled");
					$("#memberJoinEmail").attr("readonly", true);
					$("#phone").removeAttr("disabled");
					$("#newPwd").removeAttr("disabled");
					$("#newPwdChk").removeAttr("disabled");
					$("#zip").removeAttr("disabled");
					$("#btnZip").removeAttr("disabled");
					$("#address").removeAttr("disabled");
					$("#address2").removeAttr("disabled");
					$("#btnModify").removeAttr("disabled");
					$("#btnOut").removeAttr("disabled");
					$("#oldPwd").attr("disabled", true);
					$("#mid").val(data.mid);
					$("#irum").val(data.irum);
					$("#birth").val(data.birth);
					$("#phone").val(data.phone);
					$("#memberJoinEmail").val(data.memberJoinEmail);
					$("#zip").val(data.zip);
					$("#address").val(data.address);
					$("#address2").val(data.address2);
					$("#oldPwd").css({
						"border" : "1px solid green",
						"border-radius" : "3px",
						"background-color" : "#3f3"
					})
					$("#btnCertification").val('- ArtBay -');
					phone=2; //회원가입, 수정 id 중복사용 구분용
					newPwd=2;
					newPwdChk=2;
					num = $('#phone').val();
					rollback = $("#oldPwd").val(); //DB 전송 준비 oldPwd로 연결됨
				}else{
					$("#oldPwd").css({
					"border" : "2px solid red",
					"border-radius" : "3px",
					"background-color" : "white"
				})
				$("#btnCertification").val('비밀번호가 다릅니다. 정확히 입력해주세요.');
				}
			}
		})
	})
	
	//휴대전화 정규식
	$("#phone").focusout(function(){
		console.log(phone);
		console.log(num);
		if(phone==2 || phone==3 || phone==4){
			if(num !== $('#phone').val()){
				if(isPhone($("#phone").val()) == false){
					$("#phone").css({
						"border" : "2px solid red",
						"border-radius" : "3px",
						"background-color" : "white"
					})
					phone = 3;
					$("#btnCertification").val('휴대전화 번호를 정확히 입력해주세요. 010-0000-0000');
				}else{
					$("#phone").css({
						"border" : "1px solid green",
						"border-radius" : "3px",
						"background-color" : "#3f3"
					})	
					phone = 4;
					$("#btnCertification").val('- ArtBay -');
				}
			}else if(num === $('#phone').val()){ //같은 번호 다시 입력하면 CSS 초기화
				$("#phone").css({
					"border" : "1px solid gray",
					"border-radius" : "3px",
					"background-color" : "white"
				})
				$("#btnCertification").val('- ArtBay -');
			}
		}
	})
	
	//이메일 textbox 클릭
	$("#memberJoinEmail").click(function(){
		certification=1;
		var ran = Math.floor(Math.random()*1000000);
		$('#certificationNum').val(ran);
		$('#certificationNum2').val(ran);
		$(".emailCheck").fadeIn();
	})
	//모달창 확인버튼 클릭
	$("#btnEmailCheck2").click(function(){
		$("#memberJoinEmail").val($("#to_name").val());
		$("#memberJoinEmail").css({
			"border" : "1px solid green",
			"border-radius" : "3px",
			"background-color" : "#3f3"
		})
		$("#btnCertification").val('이메일 인증 번호가 전송되었으니 확인 후 입력해주세요.');
		$("#certificationNumChk2").removeAttr("disabled");
		$("#certificationNumChk2").css({
			"visibility" : "visible"
		})
	})
	//취소
	$('.btnEmailCheckCancel').click(function(){
		$(".emailCheck").fadeOut();
	})
	
	//이메일 인증번호 넣기
	$('#certificationNumChk2').focusout(function(){
		if(certification==1){
			if($('#certificationNum2').val() === $('#certificationNumChk2').val()){
				$('#certificationNumChk2').css({
					"border" : "1px solid green",
					"border-radius" : "3px",
					"background-color" : "#3f3"
				})
				$("#certificationNumChk2").attr("readonly", true);
				$("#btnCertification").val('- ArtBay -');
			}else{
				$('#certificationNumChk2').css({
					"border" : "2px solid red",
					"border-radius" : "3px",
					"background-color" : "white"
				})
				$("#btnCertification").val('이메일 인증 번호를 다시 확인해주세요.');
			}
		}
	})
	
	//비밀번호 정규식
	$("#newPwd").focusout(function(){
		$("#newPwdChk").val("");
		$("#newPwdChk").css({
				"border" : "1px solid gray",
				"border-radius" : "3px",
				"background-color" : "white"
			})
		if($("#newPwd").val() !== ""){
			if($("#oldPwd").val() !== $("#newPwd").val() && $("#newPwd").val() !== ""){
				if(isPwd($("#newPwd").val()) == false){
					$("#newPwd").css({
						"border" : "2px solid red",
						"border-radius" : "3px",
						"background-color" : "white"
					})
					newPwd = 3;
					$("#btnCertification").val('비밀번호를 정확히 입력해주세요. 영문/숫자/특수문자 최소 한가지 조합 8~16자');
				}else{
					//비밀번호가 새로 바뀌면 DB에 저장하기 위해서(oldPwd를 전송할것임) oldPwd 업데이트 or 다시 지우면 oldPwd 원복
					//비밀번호가 바뀌었을때 oldPwd를 전송하기 위함
					$("#oldPwd").val($("#newPwd").val());
					$("#newPwd").css({
						"border" : "1px solid green",
						"border-radius" : "3px",
						"background-color" : "#3f3"
					})	
					newPwd = 4;
					$("#btnCertification").val('- ArtBay -');
				}
			}
		}else{
			newPwd = 2;
			$("#newPwd").css({
				"border" : "1px solid gray",
				"border-radius" : "3px",
				"background-color" : "white"
			})
			$("#btnCertification").val('- ArtBay -');
			//비밀번호 바꿨다가 다시 지웠을때 oldPwd 원복
			$("#oldPwd").val(rollback);
		}
	})
	
	//비밀번호 확인
	$("#newPwdChk").focusout(function(){
		if($("#newPwd").val() === $("#newPwdChk").val() && newPwd === 4){
			$("#newPwdChk").css({
				"border" : "1px solid green",
				"border-radius" : "3px",
				"background-color" : "#3f3"
			})
			newPwdChk = 4;
			$("#btnCertification").val('- ArtBay -');
		}else if(newPwd === 3){ //새 비번이 틀리면 확인은 맞게써도 빨간불
			$("#newPwdChk").css({
				"border" : "2px solid red",
				"border-radius" : "3px",
				"background-color" : "white"
			})
			newPwdChk = 3;
			$("#btnCertification").val('비밀번호를 정확히 입력해주세요. 영문/숫자/특수문자 최소 한가지 조합 8~16자');
		}else if(newPwd === 2){
			$("#newPwdChk").val("");
		}else{
			$("#newPwdChk").css({
				"border" : "2px solid red",
				"border-radius" : "3px",
				"background-color" : "white"
			})
			newPwdChk = 3;
			$("#btnCertification").val('비밀번호가 다릅니다. 정확히 입력해주세요.');
		}
	})
	
	//수정 클릭
	$('#btnModify').click(function(){
		if(phone !== 3 && newPwd !== 3 && newPwdChk !== 3 && $("#zip").val() !== "" && $("#address2").val() !== ""){
			if(newPwd===4 && newPwdChk !== 4){
				$("#newPwdChk").css({
					"border" : "2px solid red",
					"border-radius" : "3px",
					"background-color" : "white"
				})
				$("#btnCertification").val('새 비밀번호를 확인해주세요.');
			}else{
				console.log("폰"+phone+"패" + newPwdChk + "수정성공");
				$param = $('#frm_join').serialize();
				$.post('updateMemberInfo', $param, function(data){
					//alert($param);
					console.log(data);
					window.open('mypageMemberResult', 'result', 'width=750, height=445, top=200, left=300');
				});
			}
		}else{
			console.log("폰"+phone+"패" + newPwdChk + "수정실패");
			$("#btnCertification").val('모든 정보를 입력해주세요.');
		}
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