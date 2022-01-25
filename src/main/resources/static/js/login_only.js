/**
 *  헤더 충돌로 인해 로그인 js 별도 분리. 로그인 전용.
 *  헤더에 artbay_minseob.js 연결 => login_only.js 변경
 */

$(function(){
	var c = 1; //mypage 토글용
	var d = 0;
	
	//헤더 로그인/마이페이지/로그아웃 시작===============================
	//BidView 로그인 모달창
	$("#needLogin").click(function(){
		if(d>0){
			$(".modal-content").show();
		}else{
			$(".modal-content").load("mypageMemberLogin");
			d = 1;
		}
	})
	//로그인 모달창
	$('#btnLogin').click(function(){
		if(d>0){
			console.log("d>0 : " + d);
			$(".modal-content").show();
		}else{
			$(".modal-content").load("mypageMemberLogin");
			console.log("else : " + d);
			d = 1;
		}
	})
	//로그인창 취소버튼
	$('#btnCancelLogin').click(function(){
		$(".modal-content").load("mypageMemberLogin").hide();
		console.log(d);
		d = 1;
		console.log(d);
	})
	//엔터키 로그인
	$("#midLogin").keyup(function(e){if(e.keyCode==13){$("#btnGoLogin").click();}})
	$("#pwdLogin").keyup(function(e){if(e.keyCode==13){$("#btnGoLogin").click();}})
	
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
				console.log(data);
			}else if(data === "failPwd"){
				alert("비밀번호를 확인해주세요.");
				console.log(data);
			}else{
				console.log(data);
				location.reload();
				d = 0;
			}
		});	
	});
	
	//아이디 찾기===================================================
	//아이디 찾기 클릭
	$("#btnFindId").click(function(){
		$("#frm_memberLogin").css({"display" : "none"});
		$("#frm_findId").css({"display" : "inline"});
		$("#frm_findPwd").css({"display" : "none"});
	})
	$("#btnFindId2").click(function(){
		$("#frm_memberLogin").css({"display" : "none"});
		$("#frm_findId").css({"display" : "inline"});
		$("#frm_findPwd").css({"display" : "none"});
	})
	
	//비밀번호 찾기 클릭
	$("#btnFindPwd").click(function(){
		$("#frm_memberLogin").css({"display" : "none"});
		$("#frm_findId").css({"display" : "none"});
		$("#frm_findPwd").css({"display" : "inline"});
	})
	$("#btnFindPwd2").click(function(){
		$("#frm_memberLogin").css({"display" : "none"});
		$("#frm_findId").css({"display" : "none"});
		$("#frm_findPwd").css({"display" : "inline"});
	})
	
	//로그인 클릭
	$("#btnLoginPage").click(function(){
		$("#frm_memberLogin").css({"display" : "inline"});
		$("#frm_findId").css({"display" : "none"});
		$("#frm_findPwd").css({"display" : "none"});
	})
	$("#btnLoginPage2").click(function(){
		$("#frm_memberLogin").css({"display" : "inline"});
		$("#frm_findId").css({"display" : "none"});
		$("#frm_findPwd").css({"display" : "none"});
	})
	
	//취소버튼
	$('#btnCancelLogin2').click(function(){
		$(".modal-content").load("mypageMemberLogin").hide();
		console.log(d);
		d = 1;
		console.log(d);
	})
	$('#btnCancelLogin3').click(function(){
		$(".modal-content").load("mypageMemberLogin").hide();
		console.log(d);
		d = 1;
		console.log(d);
	})
	
	//비밀번호 찾기==================================================
	
	
	
})