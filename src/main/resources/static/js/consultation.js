function qna() {};
qna.page = function(nowPage) {
	$frm = $("#frmQna")[0];
	$frm.nowPage.value = nowPage;
	$frm.action = "qnaList";
	$frm.submit();
}

$(function()  {
	
	$("#btnSearch").click(function() {
		$frm = $("#frmQna")[0];
		$frm.action = "qnaList";
		$frm.nowPage.value = 1;
		$frm.submit();
	});
});