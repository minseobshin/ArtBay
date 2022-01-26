<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지작성</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel='stylesheet' type='text/css' href='../css/final_lsy.css'>
<script src='./js/final_lsy.js'></script>
<script>
$(function(){
	summer();
})
</script>

</head>
<body>
<div class = "applyform">
	<h1>공지사항</h1>
	<div class="bgImgCustomer"></div>
</div>

<div id='writeNotice'>

	<form name='frm_notice' id='frm_notice' method='post'>
			<label>제목</label>
			<input type='text' name='title' size='50' value='공지사항입니다.'>
			<label>작성일</label>
			<input type='date' name='not_date' readonly='readonly'/>
			
			<textarea id='summernote' rows="15" cols="120" name='doc'></textarea>
			
		<br/>
	</form>	
	<form name='frm_noticeUpload' id='frm_noticeUpload' method='post'>
		<label>파일 첨부 </label>
		<input type='file' name='attFile' multiple="multiple"/> 
		<input type='hidden' name='nowPage' value='${page.nowPage }'/>
		<input type='hidden' name='findStr' value='${page.findStr }'/>
		<input type='text' name='grp'/>
		
		<br/>
	</form>
	<div id='btnZone'>
		<input type='button' id='btnSaveNotice' value='저장'> 
		<input type='button' id='btnNoticeList' value='목록으로' >
	</div>

</div>
	<script>
		document.frm_notice.not_date.valueAsDate = new Date();
	</script>

</body>
</html>