/**
 * 
 */

$(function(){
	
	//탈퇴 모달창
	$('#btnOut').click(function(){
		$('#out_chk').fadeIn();
	})
	//탈퇴 모달창 취소
	$('#btnOutCancel').click(function(){
		$('#out_chk').fadeOut();
	})
	
	//결과창 팝업
	//회원가입 버튼 이벤트
	$("#btnJoin").click(function(){
		$param = $('#frm_join').serialize();
		$.post('insertMemberSave', $param, function(){
			window.open('mypageMemberResult', 'result', 'width=750, height=445, top=200, left=300');
		});
	})
	$('#btnModify').click(function(){
		window.open('mypageMemberResult', 'result', 'width=750, height=445, top=200, left=300');
	})
	$('#btnOutChk').click(function(){
		window.open('mypageMemberResult', 'result', 'width=750, height=445, top=200, left=300');
	})
	
	//이메일인증 모달
	$('#btnCertification').click(function(){
		$('#certificationNum').val(541398); //랜덤으로 바꿀것
		$(".emailCheck").fadeIn();
		//$param = $('#frm_join').serialize();
		//$.post('emailCertification', $param);
	})
	$('.btnEmailCheckCancel').click(function(){
		$(".emailCheck").fadeOut();
	})

		//로그인 모달창
	$('#btnLogin').click(function(){
		alert("d");
		$(".modal-content").load("mypageMemberLogin").fadeIn();
	})
	$('#btnCancelLogin').click(function(){
		$(".modal-content").load("mypageMemberLogin").fadeOut();
	})
	
	
	
	
	
	
})