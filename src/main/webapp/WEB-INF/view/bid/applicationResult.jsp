<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href="./css/application2.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="./js/application.js"></script>
</head>
<body>
	
	<!-- location -->
	<div class = "applyform">
		<h1>미술품 경매 신청</h1>
	</div>
	<!-- //location -->
	
	<div id="artwork_result_wrapper">
		<div class="artwork_result_msg">
			${ msg }
		</div>
		
		<form name="frmArtwork" id="frmArtwork" method="POST">
			<div class="apply-btn">
                <a id="btnArtworkList" href="#none">경매 리스트</a>
	        </div>
		</form>
	</div>
</body>
</html>