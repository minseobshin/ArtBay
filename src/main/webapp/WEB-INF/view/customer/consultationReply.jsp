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


<div class = "applyform">
		<h1>1:1 상담문의</h1>
		<div class="bgImgCustomer"></div>
</div>
<div id="subContentsWrap">
		<div class="container mt40">
				<!-- 안내박스 -->
			<div class="boxBar">
				<ul class="list-default list-bul-blue">
					<li>FAQ 검색에서 원하는 내용을 검색하시면 즉시 답변을 얻으실 수 있습니다.</li>
					<li>물품문의는 판매자에게 해주시기바랍니다.</li>
					<li>비공개글은 마이페이지 작품문의내역에서 확인 가능합니다.</li>
				</ul>
			</div>
			
			<form name="frmQna" id="frmQna" method="POST" >
			<!-- 게시판 쓰기 -->
			<div class="tableDefault mt40">
				<table><tbody>
					<tr>
						<th>작성자</th>
						<td>
							<div class="form-group">
								${ vo.mid }
								<input type="hidden" name="mid" value="${ sessionScope.sv.mid }">
							</div>
						</td>
					</tr>
					<tr>
						<th>분류</th>
						<td>
							<div class="form-group">
								<c:if test="${ vo.qna_type == '10' }">회원가입/탈퇴</c:if>
								<c:if test="${ vo.qna_type == '20' }">물품문의</c:if>
								<c:if test="${ vo.qna_type == '30' }">입금/결제문의</c:if>
								<c:if test="${ vo.qna_type == '40' }">배송문의</c:if>
								<c:if test="${ vo.qna_type == '50' }">반품/취소/환불</c:if>
								<c:if test="${ vo.qna_type == '80' }">기타문의</c:if>
								<input type="hidden" name="qna_type" value="${ vo.qna_type }">
							</div>	
						</td>
					</tr>	
					<tr>
						<th>문의내용</th>
						<td>
							<div class="form-group" style="width: 100%; height: 200px; padding-top: 10px;">
								${ vo.qna_doc }
							</div>	
						</td>
					</tr>				
					<tr>
						<th>제목</th>
						<td>
							<div class="form-group">
								<input type="text" name="qna_title" id="qna_title" class="form-control width-md" value="[Re] ${ vo.qna_title }">
							</div>	
						</td>
					</tr>					
					<tr>
						<th>답변내용</th>
						<td>
							<div class="form-group">
								<textarea name="qna_doc" id="qna_doc" class="form-control" rows="10"></textarea>
							</div>	
						</td>
					</tr>
					<tr>
						<th>공개여부</th>
						<td>
							<c:if test="${ vo.qna_status == 'Y' }">공개</c:if>
							<c:if test="${ vo.qna_status == 'N' }">비공개</c:if>
							<input type="hidden" name="qna_status" value="${ vo.qna_status }">
						</td>
					</tr>
					<c:if test="${ sessionScope.sv.injung != 'super'}">
						<tr>
							<th>비밀번호</th>
							<td>
								<div class="form-inline">
									<input type="password" name="qna_pwd" id="qna_pwd" class="form-control" autocomplete="qna_pwd">
								</div>	
							</td>
						</tr>						
					</c:if>
				</tbody></table>
				<!-- 목록이동 시 페이지 정보 -->	
				<input type="hidden" name="nowPage" value="${ page.nowPage }">
				<input type="hidden" name="findStr" value="${ page.findStr }">	
				<input type="hidden" name="findCol" value="${ page.findCol }">	
				<input type="hidden" name="findType" value="${ page.findType }">
				
				<input type="hidden" name="grp" value="${ vo.grp }">
				<input type="hidden" name="seq" value="${ vo.seq }">
				<input type="hidden" name="deep" value="${ vo.deep }">
			</div>
			</form>
			
			<form name="frm_upload" id="frm_upload" method="post">
			<div class="tableDefault mt40"> 			
				<table>
					<tbody>
						<tr>
	                    	<th>파일첨부</th>
	                   		<td>
	                        	<div class="form-group">
	                        	</div>
	                            <div id="uploader" class="tui-file-uploader uploader-box">
	                                <div class="file-uploader tui-file-uploader" style="height: 34px; width: 270px;">
	                                </div>
	                                <label class="tui-btn tui-btn-upload" style="background-color: rgb(102, 102, 102); color: rgb(255, 255, 255); border: 1px solid gray; height: 28px; line-height: 28px; text-align: center; padding: 0px; width: 80px; display: flex; align-items: center; justify-content: center;">
	                                    <span class="tui-btn-txt" style="line-height: initial;">파일 추가</span>
	                                    <input type="file" name="attFile" multiple="multiple" class="tui-input-file">
	                                    <input type="hidden" name="serial">	<!-- 시리얼 번호 -->
	                                </label>
										<input type="hidden" name="nowPage" value="${ page.nowPage }">
										<input type="hidden" name="findStr" value="${ page.findStr }">	
										<input type="hidden" name="findCol" value="${ page.findCol }">	
										<input type="hidden" name="findType" value="${ page.findType }">	
	                            </div>
	                  		 </td>
	            	   </tr>
					</tbody>
				</table>
			</div>
 			</form>
 			
			<div class="btnWrap bwflex">
				<a href="#none" id="btnQnaReply" class="btn btn-save">저장</a>
				<a href="#none" id="btnQnaList" class="btn btn-save">목록</a>
			</div>


		</div>

		
	</div>

</body>
</html>