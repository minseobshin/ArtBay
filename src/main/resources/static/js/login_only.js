/**
 *  헤더 충돌로 인해 로그인 js 별도 분리. 로그인 전용.
 *  헤더에 artbay_minseob.js 연결 => login_only.js 변경
 */

$(function(){
	var c = 1; //mypage 토글용
	
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
	/*
	//로그인 모달창
	$('#btnLogin').click(function(){
		alert("d");
		$(".modal-content").load("mypageMemberLogin").fadeIn();
	})
	$('#btnCancelLogin').click(function(){
		$(".modal-content").load("mypageMemberLogin").fadeOut();
	})*/
	
	//마이 페이지
	$("#btnMyPage").click(function() {
		if(c%2 != 0){
			$("#mypage").show();
		}else if(c%2 == 0){
			$("#mypage").hide();
		}
		c+=1;
	});
	
})