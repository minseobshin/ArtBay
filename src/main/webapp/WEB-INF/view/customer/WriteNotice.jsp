<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' type='text/css' href="../css/basic.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel='stylesheet' type='text/css' href='../css/final_lsy.css'>
<title>공지작성</title>
</head>
<body>
<div id='writeNotice'>
	<form name='frm_writeNotice' method='post'>
		<h1>공지사항 작성</h1>
		<div id='noticeWrite_container'>
			<label>제목</label>
			<input type='text' name='subject' size='50' value='공지사항입니다.'>
			<div>
				<textarea name='notice_doc' id='notice_doc' rows='20'></textarea>
			</div>	
		</div>
		<br/>
		<input type='button' id='btnSaveNotice' value='저장'> 
	</form>
</div>
</body>
<script src='./js/final_lsy.js'></script>
</html>