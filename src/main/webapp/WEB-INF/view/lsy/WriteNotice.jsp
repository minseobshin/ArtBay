<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지작성</title>
</head>
<body>
<div id='noticeView'>
	<form name='frm_writeNotice' method='post'>
		<h1>공지사항</h1>
		<div id='noticeWrite_sub'>
			<label>제목</label>
			<input type='text' name='subject' value='공지사항입니다.'>
			<div>
				<input type='text' name='notice_doc' >
			</div>	
		</div>	
		<input type='button' id='btnSaveNotice' value='저장'>
	</form>
</div>
</body>
</html>