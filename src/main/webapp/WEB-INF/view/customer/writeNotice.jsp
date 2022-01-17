<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지작성</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel='stylesheet' type='text/css' href="../css/basic.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel='stylesheet' type='text/css' href='../css/final_lsy.css'>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

</head>
<body>
<div id='writeNotice'>
		<h1>공지사항 작성</h1>
	<form name='frm_writeNotice' id='frm_writeNotice' method='post'>
		<div id='noticeWrite_container'>
			<label>제목</label>
			<input type='text' name='subject' size='50' value='공지사항입니다.'>
			<label>작성일</label>
			<input type='date' name='not_date' readonly='readonly'/>
			<div>
				<textarea id='notice_doc' rows="15" cols="120" name='doc'></textarea>
			</div>	
		</div>
		<br/>
	
	<input type='text' name='nowPage' value='${page.nowPage }'/>
	<input type='text' name='findStr' value='${page.findStr }'/>
	<br/>
	<div id='btnZone'>
		<input type='button' id='btnSaveNotice' value='저장'> 
		<input type='button' id='btnNoticeList' value='목록으로' >
	</div>
</form>
</div>
	<script>
		document.frm_writeNotice.not_date.valueAsDate = new Date();
	</script>
</body>
<script src='./js/final_lsy.js'></script>
</html>