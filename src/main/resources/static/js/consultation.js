function qna() {};

//상세 조회
qna.view = function(qna_num) {
	$frm = $("#frmQna")[0];
	$frm.qnaNum.value = qna_num;
	$frm.action = "qnaView";
	$frm.submit();
}

//페이지 이동
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
		$("#findType").val("");
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
		if($("#qna_type").val() == "") {
			alert("분류를 선택해주세요.");
			$("#qna_type").focus();
			return;
		}
		if($("#qna_title").val() == "") {
			alert("제목을 입력해주세요.");
			$("#qna_title").focus();
			return;
		}
		if($("#qna_doc").val() == "") {
			alert("문의내용을 입력해주세요.");
			$("#qna_doc").focus();
			return;
		}
		if($("#qna_pwd").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#qna_pwd").focus();
			return;
		}
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
			
	//qna 수정폼으로 이동
	$("#btnUpdateForm").click(function() {
		$frm = $("#frmQna")[0];		
		$frm.action = "qnaUpdateForm";
		$frm.submit();
	});
	
	//qna 문의 수정(암호확인)
	$("#btnQnaUpdate").click(function() {
		if($("#qna_type").val() == "") {
			alert("분류를 선택해주세요.");
			$("#qna_type").focus();
			return;
		}
		if($("#qna_title").val() == "") {
			alert("제목을 입력해주세요.");
			$("#qna_title").focus();
			return;
		}
		if($("#qna_doc").val() == "") {
			alert("문의내용을 입력해주세요.");
			$("#qna_doc").focus();
			return;
		}
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
				//비밀번호 세팅
				$frm = $("#frmQna")[0];
				$frm.qna_pwd.value = $("#enterPwd").val();				
				$param = $("#frmQna").serialize();
	
				$.post("qnaUpdate", $param, function(data) {			
					var json = JSON.parse(data);
					if(json.flag == "OK") {
						$frm = $("#frm_upload")[0];
						$frm.enctype = "multipart/form-data";
						$frm.action = "fileUp";
						$frm.submit();					
					}
					else {
						alert("저장중 오류가 발생하였습니다.");
						$("#btnQnaList").click();
					}				
				});
			}
		});
		
		//암호 취소
		$("#btnPwdCancel").click(function() {
			$('#pwd_check').css('display', 'none');
			$("#pwd_check div").css("color", "#000");
			$("#enterPwd").val("");
		});
	});
	
	//qna 수정(관리자)
	$("#btnQnaUpdateAdmin").click(function() {
		$frm = $("#frmQna")[0];
		$frm.mid.value = "admin";			
		$param = $("#frmQna").serialize();

		$.post("qnaUpdate", $param, function(data) {			
			var json = JSON.parse(data);
			if(json.flag == "OK") {
				$frm = $("#frm_upload")[0];
				$frm.enctype = "multipart/form-data";
				$frm.action = "fileUp";
				$frm.submit();					
			}
			else {
				alert("저장중 오류가 발생하였습니다.");
				$("#btnQnaList").click();
			}				
		});
	});
	
	//qna 삭제(암호확인)
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
	
	//qna 삭제(관리자)
	$("#btnQnaDeleteAdmin").click(function() {
		$frm = $("#frmQna")[0];
		$frm.mid.value = "admin";
		$frm.action = "qnaDelete";
		$frm.submit();
	});
	
	//qna 목록으로 이동
	$("#btnQnaList").click(function() {
		$frm = $("#frmQna")[0];
		$frm.action = "qnaList";	
		$frm.submit();
	});
	
	//qna 댓글폼으로 이동
	$("#btnReplyForm").click(function() {
		$frm = $("#frmQna")[0];		
		$frm.action = "qnaReplyForm";
		$frm.submit();
	});
	
	//qna 답글 저장
	$("#btnQnaReply").click(function() {
		if($("#qna_title").val() == "") {
			alert("제목을 입력해주세요.");
			$("#qna_title").focus();
			return;
		}
		if($("#qna_doc").val() == "") {
			alert("문의내용을 입력해주세요.");
			$("#qna_doc").focus();
			return;
		}
		if($("#qna_pwd").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#qna_pwd").focus();
			return;
		}
		$param = $("#frmQna").serialize();
		
		$.post("qnaReply", $param, function(data) {			
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
	
});