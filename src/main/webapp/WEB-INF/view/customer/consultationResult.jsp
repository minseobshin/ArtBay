<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href="./css/consultation.css">
<link rel='stylesheet' type='text/css' href="./css/basic.css">
<script src="js/consultation.js"></script>
</head>
<body>
	
	<!-- location -->
	<div class = "applyform">
		<h1>1:1 상담문의</h1>
	</div>
	<!-- //location -->
	
	<div id="qna_result_wrapper">
		<div class="qna_result_msg">
			${ msg }
		</div>
		
		<div class="btnWrap bwflex">
			<form name="frmQna" id="frmQna" method="POST">
				<a href="#none" id="btnQnaList" class="btn btn-save">목록</a><br>
				<input type="hidden" name="nowPage" value="${ page.nowPage }">
				<input type="hidden" name="findStr" value="${ page.findStr }">			
			</form>
		</div>
	</div>
</body>
</html>