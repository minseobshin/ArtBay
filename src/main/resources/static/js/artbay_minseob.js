/**
 * 
 */

$(function(){
	
	//우편번호 팝업
	$('#btnZip').click(function(){
		new daum.Postcode({
			oncomplete : function(data){
				$('#zip').val(data.zonecode);
				$('#address').val(data.address);
			}
		}).open();
	})
	
	//탈퇴 모달창
	$('#btnOut').click(function(){
		$('#out_chk').fadeIn();
	})
	//탈퇴 모달창 취소
	$('#btnOutCancel').click(function(){
		$('#out_chk').fadeOut();
	})
	
	//결과창 팝업
	$('#btnJoin').click(function(){
		window.open('memberResult', 'result', 'width=750, height=445, top=200, left=300');
	})
	$('#btnModify').click(function(){
		window.open('memberResult', 'result', 'width=750, height=445, top=200, left=300');
	})
	$('#btnOutChk').click(function(){
		window.open('memberResult', 'result', 'width=750, height=445, top=200, left=300');
	})
	
	//로그인 모달창
	$('#btnLogin').click(function(){
		$(".modal-content").load("memberLoginModal").fadeIn();
	})
	$('#btnCancelLogin').click(function(){
		$(".modal-content").load("memberLoginModal").fadeOut();
	})
	
	//로그인
	$("#btnGoLogin").click(function() {
		$param = $("#frm_memberLogin").serialize();		
		$.post("login", $param, function() {
			console.log("login OK!");
		});	
	});
	
	//로그아웃
	$("#btnGoLogout").click(function() { 
		$.ajax({
			type: "post",
			url: "/logout",
			data: {},
			success: function() {
				location.href = "main";
		  	}
		});
	});
	
	//마이 페이지
	$("#btnMyPage").click(function() {
		$("#mypage").toggle();		
	});
})




