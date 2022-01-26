<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href="./css/consultation.css">
<link rel='stylesheet' type='text/css' href="./css/basic.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="js/consultation.js"></script>
</head>
<body>

	
	<!-- location -->
	<div class = "applyform">
		<h1>1:1 상담문의</h1>
	</div>
	<!-- //location -->

<div id="subContentsWrap" >
	<form name="frmQna" id="frmQna" method="POST">
		<div class="container">
			<!-- 마이페이지 -->
			<!-- submenu -->

			<!-- 꼭 읽어주세요 -->
			<div class="tableDefault mt30">
				<table style="word-break:break-all;">
					<tbody>
					<tr>
						<th>제목</th>
						<td>
							<strong>${ vo.qna_title }</strong>
						</td>
					</tr>
					<tr>
						<th>문의내용</th>
						<td>
							<div class="boardConentsView">
								${ vo.qna_doc }
							</div>
						</td>
					</tr>
					<c:if test="${ not empty vo.attList }">
						<tr>
							<th>첨부파일</th>
							<td class="left" colspan="3">
								<ul>
									<c:forEach var="att" items="${ vo.attList }">
										<li><a href="./upload/${ att.attFile }" download="${ att.attFile }">${ att.attFile }</a></li>
									</c:forEach>
								</ul>								
							</td>
						</tr>					
					</c:if>					
				</tbody></table>
			</div>
			<div class="btnWrap view clearFix">
				<!-- 관리자는 삭제/댓글/목록 가능 -->
				<!-- 내가 작성한 글만 수정/삭제/목록 가능 -->
				<!-- 다른사람이 작성한 글은 댓글/목록만 가능 -->
				<c:choose>
					<c:when test="${ sessionScope.sv.injung == 'super' }">
						<c:if test="${ sessionScope.sv.mid == vo.mid }">
							<a href="#none" id="btnUpdateForm" class="btn btn-gray2 btn-lg fs15">수정</a>
						</c:if>
						<a href="#none" id="btnQnaDeleteAdmin" class="btn btn-gray2 btn-lg fs15">삭제</a>
						<c:if test="${ sessionScope.sv.mid != vo.mid }">
							<a href="#none" id="btnReplyForm" class="btn btn-gray2 btn-lg fs15">댓글</a>	
						</c:if>
						<a href="#none" id="btnQnaList" class="btn btn-gray2 btn-lg fs15">목록</a>
					</c:when>
					<c:when test="${ sessionScope.sv.mid == vo.mid }">
						<a href="#none" id="btnUpdateForm" class="btn btn-gray2 btn-lg fs15">수정</a>
						<a href="#none" id="btnQnaDelete" class="btn btn-gray2 btn-lg fs15">삭제</a>
						<a href="#none" id="btnQnaList" class="btn btn-gray2 btn-lg fs15">목록</a>
					</c:when>
					<c:otherwise>
						<c:if test="${ sessionScope.sv.mid == vo.qna_top_mid }">
							<c:if test="${ vo.mid == 'admin' || vo.mid == 'chicken' }">
								<a href="#none" id="btnReplyForm" class="btn btn-gray2 btn-lg fs15">댓글</a>
							</c:if>
						</c:if>
						<a href="#none" id="btnQnaList" class="btn btn-gray2 btn-lg fs15">목록</a>	
					</c:otherwise>
				</c:choose>				
			</div>
		</div>
		
		<!-- 입력한 비밀번호 -->
		<input type="hidden" name="qna_pwd">
		
		<!-- 조회 조건 -->
		<input type="hidden" name="nowPage" value="${ page.nowPage }">
		<input type="hidden" name="findStr" value="${ page.findStr }">
		<input type="hidden" name="findCol" value="${ page.findCol }">
		<input type="hidden" name="findType" value="${ page.findType }">
		
		<input type="hidden" name="qna_num" value="${ vo.qna_num }">
		<input type="hidden" name="mid">
		<!-- 
		<input type="hidden" name="grp" value="${ vo.grp }">
		<input type="hidden" name="seq" value="${ vo.seq }">
		<input type="hidden" name="deep" value="${ vo.deep }">		
		<input type="hidden" name="qna_type" value="${ vo.qna_type }">
		<input type="hidden" name="qna_title" value="${ vo.qna_title }">
		<input type="hidden" name="qna_status" value="${ vo.qna_status }">
		 -->
	</form>			
	
	<!-- 비밀번호 입력창 -->
	<div id="pwd_check">
		<form name="frmPwdCheck" method="post">
			<div>비밀번호를 입력해주세요</div>
			<input type="password" name="enterPwd" id="enterPwd" autocomplete="enterPwd">
			<input type="button" value="확인" id="btnPwdOk">
			<input type="button" value="취소" id="btnPwdCancel">
		</form>
	</div>
</div>
</body>
</html>