/**
 * 
 */

$(function(){
	
	var now = new Date(); //현재시간
	var c = 1; //mypage 토글용
	
	//우편번호 팝업
	$('#btnZip').click(function(){
		//우편번호 버튼 누르면 (생년월일 칸 공백이면)"기본정보를 모두 입력해주세요." 출력. (생년월일 썼으면)나이 계산한뒤 히든박스에 넣기.
		if($('#birth').val() == ""){
			alert("기본정보를 모두 입력해주세요.");
		}else{
			$('#age').val(now.getFullYear()-$('#birth').val().split("-")[0]+1);
			//우편번호
			new daum.Postcode({
				oncomplete : function(data){
					$('#zip').val(data.zonecode);
					$('#address').val(data.address);
				}
			}).open().close();
		}
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
	
	//로그인 모달창
	$('#btnLogin').click(function(){
		$(".modal-content").load("mypageMemberLogin").fadeIn();
	})
	$('#btnCancelLogin').click(function(){
		$(".modal-content").load("mypageMemberLogin").fadeOut();
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
		if(c%2 != 0){
			$("#mypage").show();
		}else if(c%2 == 0){
			$("#mypage").hide();
		}
		c+=1;
	});
	
	
	
	
	
	
	
	
	
	
	
})