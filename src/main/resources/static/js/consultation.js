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
				//$frm.submit();
				console.log(json.serial);						
			}
			else {
				alert("저장중 오류가 발생하였습니다.");
			}				
		});
	});
	
	//qna 문의 취소
	$("#btnQnaCancle").click(function() {
		
	});
	
	//비공개글 : 비밀번호 입력창 보이기
	$("input[type=radio][name=qna_status]").change(function() {
		if($(this).val() == "N") {
			$("#qna_pwd").show();
		} else {
			$("#qna_pwd").val("");
			$("#qna_pwd").hide(); 
		}
	});
});