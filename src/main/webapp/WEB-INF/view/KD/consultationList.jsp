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
	
<form name="frmBoard" method="POST" >
	<!-- location -->
	<div class = "applyform">
		<h1>1:1상담문의</h1>
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
			<div class="tableDefault table-vertical mb30 mt30">					
				<table>
					<tbody>
						<tr>
							<th>질문유형</th>
							<td>
								<div class="form-inline">
									 <select name="kind" id="kind" class="form-control material-ch" style="width: 130px;">
									 	<option>선택하세요</option>
									 	<option value="10">회원가입/탈퇴</option>
										<option value="20">물품문의</option>
										<option value="30">입금/결제문의</option>
										<option value="40">배송문의</option>
										<option value="50">반품/취소/환불</option>
										<option value="80">기타문의</option>
									</select>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>검색어</th>
							<td>
								<div class="form-inline">
									<div class="form-group">
										<select name="field" id="field" class="form-control material-ch"  style="width: 80px;">
											<option value="SA" selected="">제목</option>
											<option value="SB">등록자</option>
											<option value="SC">내용</option>
										</select>
									</div>
									<div class="form-group mt5m">
										<input type="text" id="qry" name="qry" class="form-control" value="" onkeyup="">
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btnSearch">
				<button class="btn btn-search" onclick="">검색</button>
            	<button class="btn btn-search-delete" onclick="">검색삭제</button>
			</div>
			<!--// 조회 테이블 -->
			<div class="table-infoTop clearfix mt50">
				<div class="pull-left fs15">
					<span class="fcBlue"><strong>나의 1:1 상담문의</strong></span>에 대해서 모두 <span class="fcBlue"><strong>7</strong></span>개가 검색되었습니다.
				</div>
			</div>

			<div class="boardList">
				<ul class="bTitle">
					<li class="num">구분</li>
					<li>제목</li>
					<li class="hit">답변여부</li>
					<li class="date">등록일</li>
					<li class="date">답변일</li>
				</ul>

				<div class="customer-basic">
					<ul class="bContent text-center clearFix">
						<li class="sortation mb5m">기타문의 <strong class=" visible-xs-inline-block ml10">답변중</strong></li>
						<li class="text-left subject"><a href="consultationView" onclick="" class="fcBlack collapsed">기타문의</a></li>
						<li class="hit mobileNone"><strong class="">답변완료</strong></li>
						<li class="date"><span class="visible-xs-inline-block">등록일 : </span>2022.01.06</li>
						<li class="date"><span class="visible-xs-inline-block">작성일 : </span>2022.01.06</li>
					</ul>
					<ul class="bContent text-center clearFix">
						<li class="sortation mb5m">기타문의 <strong class=" visible-xs-inline-block ml10">답변중</strong></li>
						<li class="text-left subject"><a href="consultationView" onclick="" class="fcBlack collapsed">기타문의</a></li>
						<li class="hit mobileNone"><strong class="">답변중</strong></li>
						<li class="date"><span class="visible-xs-inline-block">등록일 : </span>2022.01.06</li>
						<li class="date"><span class="visible-xs-inline-block">작성일 : </span></li>
					</ul>
					<ul class="bContent text-center clearFix">
						<li class="sortation mb5m">기타문의 <strong class=" visible-xs-inline-block ml10">답변중</strong></li>
						<li class="text-left subject"><a href="consultationView" onclick="" class="fcBlack collapsed">기타문의</a></li>
						<li class="hit mobileNone"><strong class="">답변중</strong></li>
						<li class="date"><span class="visible-xs-inline-block">등록일 : </span>2022.01.06</li>
						<li class="date"><span class="visible-xs-inline-block">작성일 : </span></li>
					</ul>
					<ul class="bContent text-center clearFix">
						<li class="sortation mb5m">기타문의 <strong class=" visible-xs-inline-block ml10">답변중</strong></li>
						<li class="text-left subject"><a href="consultationView" onclick="" class="fcBlack collapsed">기타문의</a></li>
						<li class="hit mobileNone"><strong class="">답변중</strong></li>
						<li class="date"><span class="visible-xs-inline-block">등록일 : </span>2022.01.06</li>
						<li class="date"><span class="visible-xs-inline-block">작성일 : </span></li>
					</ul>
					<ul class="bContent text-center clearFix">
						<li class="sortation mb5m">기타문의 <strong class=" visible-xs-inline-block ml10">답변중</strong></li>
						<li class="text-left subject"><a href="consultationView" onclick="" class="fcBlack collapsed">기타문의</a></li>
						<li class="hit mobileNone"><strong class="">답변중</strong></li>
						<li class="date"><span class="visible-xs-inline-block">등록일 : </span>2022.01.06</li>
						<li class="date"><span class="visible-xs-inline-block">작성일 : </span></li>
					</ul>
					<ul class="bContent text-center clearFix">
						<li class="sortation mb5m">기타문의 <strong class=" visible-xs-inline-block ml10">답변중</strong></li>
						<li class="text-left subject"><a href="consultationView" onclick="" class="fcBlack collapsed">기타문의</a></li>
						<li class="hit mobileNone"><strong class="">답변중</strong></li>
						<li class="date"><span class="visible-xs-inline-block">등록일 : </span>2022.01.06</li>
						<li class="date"><span class="visible-xs-inline-block">작성일 : </span></li>
					</ul>
					<ul class="bContent text-center clearFix">
						<li class="sortation mb5m">기타문의 <strong class=" visible-xs-inline-block ml10">답변중</strong></li>
						<li class="text-left subject"><a href="consultationView" onclick="" class="fcBlack collapsed">기타문의</a></li>
						<li class="hit mobileNone"><strong class="">답변중</strong></li>
						<li class="date"><span class="visible-xs-inline-block">등록일 : </span>2022.01.06</li>
						<li class="date"><span class="visible-xs-inline-block">작성일 : </span></li>
					</ul>
					<ul class="bContent text-center clearFix">
					
						<li class="text-center subject">검색된 내용이 없습니다.</li>
					</ul>
				</div>

			</div>
			<div class="btnWrap view text-right clearFix mb0">
					<a href="consultationInsert" onclick="" class="btn btn-Insert">글쓰기</a>
					<a href="application" onclick="" class="btn btn-Insert">경매 신청서</a>
			</div>
		</div>

		<!-- pagination -->
		<div class="pager">
			<ul class="pagination">
				<li><a href="#none" onclick="" style="letter-spacing:-3px;">&lt;&lt;</a></li>
				<li><a href="#none" onclick="" style="letter-spacing:-3px;">&lt;</a></li>
				<li class="active"><a href="#none">1</a></li>
				<li><a href="#none" onclick="" style="letter-spacing:-3px;">&gt;</a></li>
				<li><a href="#none" onclick="" style="letter-spacing:-3px;">&gt;&gt;</a></li>
			</ul>
		</div><!--// pagination -->
	</div>

</form>
<!-- 메인 푸터 -->
	<%@include file="../footer.jsp" %>
</body>
</html>