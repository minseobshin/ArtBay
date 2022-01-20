/**
 *  헤더 충돌로 인해 로그인 js 별도 분리. 로그인 전용.
 *  헤더에 artbay_minseob.js 연결 => login_only.js 변경
 */

$(function(){
	var c = 1; //mypage 토글용
	var d = 0;
	
	//헤더 로그인/마이페이지/로그아웃 시작===============================
	//로그인 모달창
	$('#btnLogin').click(function(){
		if(d>0){
			$(".modal-content").show();
		}else{
			$(".modal-content").load("mypageMemberLogin");
			d+=1;
		}
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
	
	//로그아웃
	$("#btnGoLogout").click(function() { 
		$.ajax({
			type: "post",
			url: "/memberLogout",
			data: {},
			success: function() {
				location.href = "main";
		  	}
		});
	});
	
	//헤더 로그인/로그아웃/마이페이지 끝===============================
	
	//로그인
	$("#btnGoLogin").click(function() {
		$param = $("#frm_memberLogin").serialize();		
		$.post("memberLogin", $param, function(data) {
			if(data === "failMid"){
				alert("아이디를 확인해주세요.");
				console.log("failMid");
			}else if(data === "failPwd"){
				alert("비밀번호를 확인해주세요.");
				console.log("failPwd");
			}else{
				location.reload();
				console.log("login");
			}
		});	
	});
	//엔터키
	$("#midLogin").keyup(function(e){if(e.keyCode==13){$("#btnGoLogin").click();}})
	$("#pwdLogin").keyup(function(e){if(e.keyCode==13){$("#btnGoLogin").click();}})
	
	$('#btnCancelLogin').click(function(){
		$(".modal-content").load("mypageMemberLogin").hide();
	})
	
	
	
	
})