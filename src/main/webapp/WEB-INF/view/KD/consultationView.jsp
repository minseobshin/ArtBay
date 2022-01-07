<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href="./css/consultation.css">
<link rel='stylesheet' type='text/css' href="./css/basic.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/index.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="./js/application.js"></script>
</head>
<body>
<!-- 메뉴 네비게이션 -->
	<%@include file="../header.jsp" %>
<form name="frmBoard" method="POST">
	
	<!-- location -->
				<div class = "applyform">
					<h1>1:1상담문의</h1>
				</div>
	<!-- //location -->

	<div id="subContentsWrap" >
		
		<div class="container">
			<!-- 마이페이지 -->
			<!-- submenu -->

			<!-- 꼭 읽어주세요 -->
			<div class="tableDefault mt30">
				<table style="word-break:break-all;">
					<tbody><tr>
						<th>제목</th>
						<td>
							(기타문의) <strong>기타문의</strong>

						</td>
					</tr>
					<tr>
						<th>문의 내용</th>
						<td>
							<div class="boardConentsView">
								안녀하세요 문의 입니다. 
							</div>
							<p class="mt15 fcGray7">등록일 : 2022-01-06</p>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td class="left" colspan="3">
							
								<a href="./img/ff.png">ff.png</a> (635.84 KByte) <br>
								
									<img src="./img/ff.png" width="98%"><br>
								
								
						</td>
					</tr>
					<tr>
						<th>답변 내용</th>
						<td>
							<div class="boardConentsView">
								<p>안녕하세요. 아트베이 입니다.&nbsp;<br></p>
								<p><br></p>
								<p>문의 사항이 있으실 경우 보다 자세한 기재 부탁 드립니다.&nbsp;</p>
								<p><br></p>
								<p>문의가 번거로우시다면</p>
								<p>고객센터(02-000-0000)로 문의를 부탁드립니다.</p>
								<p>감사합니다.</p>
							</div>
							<p class="mt15 fcGray7">답변일 : 2022-01-06</p>
						</td>
					</tr>
				
				</tbody></table>
			</div>
			<div class="btnWrap view text-left clearFix">
				<a href="consultationList" onclick="" class="btn btn-gray2 btn-lg fs15">목록</a>
				<a href="consultationList" onclick="" class="btn btn-gray2 btn-lg fs15">삭제</a>
				
			</div>
		</div>

	</div>
</form>
<!-- 메인 푸터 -->
	<%@include file="../footer.jsp" %>
</body>
</html>