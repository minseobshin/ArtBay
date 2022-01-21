function qna() {};
qna.view = function(qna_num) {
	$frm = $("#frmQna")[0];
	$frm.qnaNum.value = qna_num;
	$frm.action = "qnaView";
	$frm.submit();
}
qna.page = function(nowPage) {
	$frm = $("#frmQna")[0];
	$frm.nowPage.value = nowPage;
	$frm.action = "qnaList";
	$frm.submit();
}

$(function()  {
	
	//qna 문의내역 조회
	$("#btnSearch").click(function() {
		$frm = $("#frmQna")[0];
		$frm.action = "qnaList";
		$frm.nowPage.value = 1;		
		$frm.submit();
	});
	
	//조회조건 초기화
	$("#btnSearchCancle").click(function() {
		$("#qna_type").val("");
		$("#findCol").val("QNA_TITLE");
		$("#findStr").val("");
	});
	
	//qna 문의 작성폼 이동
	$("#btnInsertForm").click(function(){
		$frm = $("#frmQna")[0];		
		$frm.action = "qnaInsertForm";
		$frm.submit();
	});
	
	//qna 문의 저장
	$("#btnQnaInsert").click(function() {
		$param = $("#frmQna").serialize();
	
		$.post("qnaInsert", $param, function(data) {			
			var json = JSON.parse(data);
			if(json.flag == "OK") {
				$frm = $("#frm_upload")[0];
				$frm.serial.value = json.serial;	//시리얼 번호
				$frm.enctype = "multipart/form-data";
				$frm.action = "fileUp";
				$frm.submit();					
			}
			else {
				alert("저장중 오류가 발생하였습니다.");
			}				
		});
	});
	
	//qna 문의 취소
	$("#btnQnaCancle").click(function() {
		
	});
		
	//qna 수정폼으로 이동
	$("#btnUpdateForm").click(function() {
		console.log("수정폼으로 ㄱㄱ");
	});
	
	//qna 삭제
	$("#btnQnaDelete").click(function() {
		//암호창 보이기
		$('#pwd_check').css('display', 'block');
		$("#enterPwd").focus();
		
		//암호 확인
		$("#btnPwdOk").click(function() {
			if($("#enterPwd").val() == "") {
				$("#pwd_check div").html("비밀번호를 입력해주세요.");
				$("#pwd_check div").css("color", "#f00");					
				$("#enterPwd").focus();
			}
			else {
				$frm = $("#frmQna")[0];
				$frm.qna_pwd.value = $("#enterPwd").val();
				$frm.action = "qnaDelete";
				$frm.submit();	
			}
		});
		
		//암호 취소
		$("#btnPwdCancel").click(function() {
			$('#pwd_check').css('display', 'none');
			$("#pwd_check div").css("color", "#000");
			$("#enterPwd").val("");
		});
	});
	
	//qna 목록으로 이동
	$("#btnQnaList").click(function() {
		$frm = $("#frmQna")[0];
		$frm.action = "qnaList";	
		$frm.submit();
	});
	
	//qna 댓글폼으로 이동
	$("#btnReplyForm").click(function() {
		console.log("댓글작성 폼으로 ㄱㄱ");
	});
	
	
});