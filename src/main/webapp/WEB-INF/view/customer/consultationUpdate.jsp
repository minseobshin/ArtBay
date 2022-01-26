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
				<table>
					<tbody>
					<tr>
						<th>작성자</th>
						<td>
							<div class="form-group">
								${ vo.mid }
								<input type="hidden" name="mid" value="${ vo.mid }">
							</div>
						</td>
					</tr>
					<tr>
						<th>분류</th>
						<td>
							<div class="form-inline">
								<div class="form-group">
								<select id="qna_type" name="qna_type" class="w130 form-control material-ch" style="width: 130px;">
									<option value="" <c:if test="${ vo.qna_type == '' }">selected</c:if>>선택하세요</option>
								 	<option value="10" <c:if test="${ vo.qna_type == '10' }">selected</c:if>>회원가입/탈퇴</option>
									<option value="20" <c:if test="${ vo.qna_type == '20' }">selected</c:if>>물품문의</option>
									<option value="30" <c:if test="${ vo.qna_type == '30' }">selected</c:if>>입금/결제문의</option>
									<option value="40" <c:if test="${ vo.qna_type == '40' }">selected</c:if>>배송문의</option>
									<option value="50" <c:if test="${ vo.qna_type == '50' }">selected</c:if>>반품/취소/환불</option>
									<option value="80" <c:if test="${ vo.qna_type == '80' }">selected</c:if>>기타문의</option>
								</select>
								</div>	
							</div>	
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<div class="form-group">
								<input type="text" name="qna_title" id="qna_title" class="form-control width-md" value="${ vo.qna_title }">
							</div>	
						</td>
					</tr>					
					<tr>
						<th>문의내용</th>
						<td>
							<div class="form-group">
								<textarea name="qna_doc" id="qna_doc" class="form-control" rows="10">${ vo.qna_doc }</textarea>
							</div>	
						</td>
					</tr>
					<c:if test="${ not empty vo.attList }">
						<tr>
							<th>첨부파일</th>
							<td class="left" colspan="3">
								<ul>
									<c:forEach var="att" items="${ vo.attList }">
										<li><label style="padding-right: 20px;"><input type="checkbox" name="delFile" value="${ att.attFile }">삭제</label>${ att.attFile }</li>
									</c:forEach>
								</ul>								
							</td>
						</tr>					
					</c:if>	
					<tr>
						<th>공개여부</th>
						<td>
							<div class="form-inline">
								<label><input type="radio" name="qna_status" value="Y" <c:if test="${ vo.qna_status == 'Y' }">checked</c:if>>공개</label>
								<label><input type="radio" name="qna_status" value="N" <c:if test="${ vo.qna_status == 'N' }">checked</c:if>>비공개</label>
							</div>	
						</td>
					</tr>			
				</tbody></table>
				<!-- 목록이동 시 페이지 정보 -->				
				<input type="hidden" name="nowPage" value="${ page.nowPage }">
				<input type="hidden" name="findStr" value="${ page.findStr }">	
				<input type="hidden" name="findCol" value="${ page.findCol }">	
				<input type="hidden" name="findType" value="${ page.findType }">
				
				<!-- 입력한 비밀번호 -->
				<input type="hidden" name="qna_pwd">
				<input type="hidden" name="qna_num" value="${ vo.qna_num }">		
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
	                                    <input type="hidden" name="serial" value="${ vo.qna_num }">	<!-- 시리얼 번호 -->
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
				<c:choose>
					<c:when test="${ sessionScope.sv.injung == 'super' }">
						<a href="#none" id="btnQnaUpdateAdmin" class="btn btn-save">수정</a>
					</c:when>
					<c:otherwise>
						<a href="#none" id="btnQnaUpdate" class="btn btn-save">수정</a>	
					</c:otherwise>
				</c:choose>
				
				<a href="#none" id="btnQnaList" class="btn btn-save">목록</a>
			</div>

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

		
	</div>

</body>
</html>