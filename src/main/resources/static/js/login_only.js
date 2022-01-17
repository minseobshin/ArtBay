/**
 *  헤더 충돌로 인해 로그인 js 별도 분리. 로그인 전용.
 *  헤더에 artbay_minseob.js 연결 => login_only.js 변경
 */

$(function(){
	var c = 1; //mypage 토글용
	var d = 0;
	
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
	
	//로그인 모달창
	$('#btnLogin').click(function(){
		if(d>0){
			$(".modal-content").show();
		}else{
			$(".modal-content").load("mypageMemberLogin");
			d+=1;
		}
	})
	$('#btnCancelLogin').click(function(){
		$(".modal-content").load("mypageMemberLogin").hide();
	})
		
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