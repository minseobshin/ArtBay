<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

	<div id="subContentsWrap">
		
		<div class="container">

			<!-- 꼭 읽어주세요 -->
			<div class="row mt30">
				<div class="mb5">
					<i class="fa fa-volume-up mr5" aria-hidden="true"></i><span class="fs16"><strong>꼭 읽어주세요!</strong></span>
				</div>				
				<ul id="read-txt" class="list-default collapse pl20">
					<li>FAQ 검색에서 원하는 내용을 검색하시면 즉시 답변을 얻으실 수 있습니다</li>
					<li>물품문의는 판매자에게 해주시기바랍니다.</li>
				</ul>
			</div>

			<!-- 조회 테이블 -->
			<form name="frmQna" id="frmQna" method="POST" >
				<div class="tableDefault table-vertical mb30 mt30">	
					<table>
						<tbody>
							<tr>
								<th>질문유형</th>
								<td>
									<div class="form-inline">
										 <select name="findType" id="findType" class="form-control material-ch" style="width: 130px;">
										 	<option value="" <c:if test="${ page.findType == '' }">selected</c:if>>선택하세요</option>
										 	<option value="10" <c:if test="${ page.findType == '10' }">selected</c:if>>회원가입/탈퇴</option>
											<option value="20" <c:if test="${ page.findType == '20' }">selected</c:if>>물품문의</option>
											<option value="30" <c:if test="${ page.findType == '30' }">selected</c:if>>입금/결제문의</option>
											<option value="40" <c:if test="${ page.findType == '40' }">selected</c:if>>배송문의</option>
											<option value="50" <c:if test="${ page.findType == '50' }">selected</c:if>>반품/취소/환불</option>
											<option value="80" <c:if test="${ page.findType == '80' }">selected</c:if>>기타문의</option> 
										</select>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>검색어</th>
								<td>
									<div class="form-inline">
										<div class="form-group">
											<select name="findCol" id="findCol" class="form-control material-ch"  style="width: 80px;">
												<option value="QNA_TITLE" <c:if test="${ page.findCol == 'QNA_TITLE' }">selected</c:if>>제목</option>
												<option value="MID" <c:if test="${ page.findCol == 'MID' }">selected</c:if>>등록자</option>
												<option value="QNA_DOC" <c:if test="${ page.findCol == 'QNA_DOC' }">selected</c:if>>내용</option>
											</select>
										</div>
										<div class="form-group mt5m">
											<input type="text" name="findStr" id="findStr" class="form-control" value="${ page.findStr }" onkeyup="">
											<input type="hidden" name="nowPage" class="form-control" value="${ page.nowPage }" onkeyup="">
											<input type="hidden" name="qnaNum" class="form-control">	<!-- 상세조회 위한 키 -->
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btnSearch">
					<input type="button" class="btn btn-search" id="btnSearch" value="검색">
					<input type="button" class="btn btn-search-delete" id="btnSearchCancle" value="검색삭제">	            	
				</div>
			</form>
			
			<!--// 조회 테이블 -->
			<div class="table-infoTop clearfix mt50">
				<div>TOTAL : <span>${ fn:length(list) }</span></div>
			</div>

			<div class="boardList">
				<ul class="bTitle">
					<li class="num">구분</li>
					<li>제목</li>
					<li class="status">공개여부</li>
					<li class="date">작성자</li>
					<li class="date">작성일</li>
				</ul>

				<div class="customer-basic">
					<c:choose>
						<c:when test="${ fn:length(list) > 0}">
							<c:forEach var="vo" items="${ list }">
								<ul class="bContent text-center clearFix">									
									<li class="sortation mb5m">
										<c:choose>
											<c:when test="${ vo.qna_type == '10' }">회원가입/탈퇴</c:when>
											<c:when test="${ vo.qna_type == '20' }">물품문의</c:when>
											<c:when test="${ vo.qna_type == '30' }">입금/결제문의</c:when>
											<c:when test="${ vo.qna_type == '40' }">배송문의</c:when>
											<c:when test="${ vo.qna_type == '50' }">반품/취소/환불</c:when>
											<c:when test="${ vo.qna_type == '80' }">기타문의</c:when>
										</c:choose>
									</li>
									<li class="text-left qnaTitle">
										<div onclick="qna.view(${ vo.qna_num })">
											<c:if test="${ vo.qna_num == vo.grp }">
												${ vo.qna_title }
											</c:if>
											<c:if test="${ vo.qna_num != vo.grp }">
												<c:forEach begin="0" end="${ vo.deep*6 }">&nbsp;</c:forEach>
												<img src="img/reply_arrow.png" width="20px" height="20px" style="vertical-align: middle"> ${ vo.qna_title }
											</c:if>
										</div>
									</li>
									<li class="status mobileNone">
										<c:if test="${ vo.qna_status == 'N'}">
											<img src="img/locked_pwd.png" width="20px" height="20px">
										</c:if>
									</li>
									<li class="date">
										<span class="visible-xs-inline-block">작성자 : </span>${ vo.mid }
									</li>
									<li class="date">
										<span class="visible-xs-inline-block">작성일 : </span>${ vo.qna_date }
									</li>
								</ul>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<ul class="bContent text-center clearFix">					
								<li class="text-center subject">검색된 내용이 없습니다.</li>
							</ul>					
						</c:otherwise>
					</c:choose>
				</div>

			</div>
			<div class="btnWrap view text-right clearFix mb0">
				<!-- 일반유저만 로그인했을 때 글쓰기 -->
				<c:if test="${ not empty sessionScope.sv && sessionScope.sv.injung != 'super'}">
					<a id="btnInsertForm" class="btn btn-Insert">글쓰기</a>
				</c:if>
			</div>
		</div>
 
		<!-- pagination -->
		<div class="pager">
			<ul class="pagination">
				<c:if test="${ page.startPage > 1 }">
					<li><a href="#none" onclick="qna.page(1)" style="letter-spacing:-3px;">&lt;&lt;</a></li>
					<li><a href="#none" onclick="qna.page(${ page.startPage-1 })" style="letter-spacing:-3px;">&lt;</a></li>
				</c:if>				
				
				<c:forEach var="i" begin="${ page.startPage }" end="${ page.endPage }">	
					<li class="active"><a href="#none" onclick="qna.page(${i})" class="${ (i == page.nowPage) ? 'selectedPage' : '' }">${ i }</a></li>
				</c:forEach>	
				
				<c:if test="${ page.endPage < page.totPage }">
					<li><a href="#none" onclick="qna.page(${ page.endPage+1 })" style="letter-spacing:-3px;">&gt;</a></li>
					<li><a href="#none" onclick="qna.page(${ page.totPage })" style="letter-spacing:-3px;">&gt;&gt;</a></li>				
				</c:if>
			</ul>
		</div><!--// pagination -->
	</div>


</body>
</html>