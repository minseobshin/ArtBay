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
	
<!-- START KA-CONTAINER -->
<div class="ka-container ">

        <!-- START CONTENT WRAPPER -->
        <div class="ka-content-wrapper">
        
            <!-- START CONTENT SECTION -->
            <div class="content">

<style>
    input[type="text"] {
        width: 180px;
        height: 32px;
        line-height: normal;
        font-family: inherit;
        border: 1px solid #c4c4c4;
        border-radius: 0;
        outline-style: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        padding: 0.2em 0.2em;
    }
</style>
<div class = "applyform">
		<h1>미술품 경매 신청서</h1>
		<div class="bgImgAuction"></div>
</div>
<div class="container">
    <div id="consign-request-guide">
        <div class="consignguide-container">
            <div class="consignguide-content">
                <h4>
                    <img src="./img/precau-ico@1x.png" alt="Icon">
                    작품 경매 신청 전에 읽어주세요.
                </h4>
                <ul>
                    <li>
                        <div class="ellipse">
                            <span>•</span>
                        </div>
                        <p>경매 신청 시 즉시 경매가 시작되오니 수정, 삭제가 불가합니다.</p>
                    </li>
                    <li>
                        <div class="ellipse">
                            <span>•</span>
                        </div>
                        <p>꼭 자세히 확인 후 신청해 주시기 바랍니다.</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
 
    <div class="written-call-apply">
        <div>
            <h5>위탁인 정보</h5>
            <table class="apply-table">
                <tbody><tr>
                    <td>이름</td>
                    <td>${vo.irum}</td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>${vo.address}</td>
                </tr>
                <tr>
                    <td>휴대전화</td>
                    <td>${vo.phone}</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>${vo.email}</td>
                </tr>
            </tbody></table>
        </div>
        <div class="conapply-form">
            <h5>위탁작품 정보</h5>
<form name='frm_bay_insert' id='frm_bay_insert' method="post">
            <table class="apply-table">
                <tbody>
                <tr>
                    <td>작가명</td>
                    <td>
                        <div id="artist-area">
                            <input id="artist" name="artist" type="text" >
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="essential"><span>작품명</span></td>
                    <td>
                        <div>
                            <input id="artwork_name" name="artwork_name" class="apply-input" type="text" >
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>작품의 카테고리</td>
                    <td>
                        <div>
                            <select id="artwork_ctgr" name="artwork_ctgr" class="material-ch ctgr" >
                                <option value="">카테고리를 선택해 주세요.</option>
                                <option value="paint">그림</option>
<!--                                 <option value="photo">사진</option> -->
                                <option value="pottery">도자기</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>작품의 재료</td>
                    <td>
                        <div>
                            <select id="material" name="material" class="material-ch" >
                                <option value="">재료를 선택해 주세요.</option>
                                <option value="캔버스의 유채">캔버스의 유채</option>
                                <option value="종이에 채색">종이에 채색</option>
                                <option value="사진">사진</option>
                                <option value="판화">판화</option>
                                <option value="조각">조각</option>
                                <option value="도자기">도자기</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>작품의 크기 (cm)</td>
                    <td>
                        <div class="sizeinfo">
                            <div>
                                <input type="text" name="s_size01" id="s_size01" class="s_fld s_size01" placeholder="작품의 세로" numberonly="true">
                            </div>
                            <span>X</span>
                            <div>
                                <input type="text" name="s_size02" id="s_size02" class="s_fld s_size02" placeholder="작품의 가로" numberonly="true">
                            </div>
                            <span>X</span>
                            <div>
                                <input type="text" name="s_size03" id="s_size03" class="s_fld s_size03" placeholder="작품의 폭" numberonly="true">
                            </div>
                            <span>/</span>
                            <input type="text" id="ho" name="ho" class="size" numberonly="true">
                            <span>호</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>작품설명</td>
                    <td>
                        <div>
                            <textarea class="conapply-text" id="contents" name="contents" placeholder="작품에 대해서 가능한 많은 정보를 기입해 주세요. (예 : 소장 경로 또는 출처, 감정서 유무, 전시이력)"></textarea>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>기타</td>
                    <td>
                        <div>
                            <textarea class="conapply-text" id="etc" name="etc" placeholder="작품에 대한 보관 상태나 요구 사항 등을 기입해 주세요."></textarea>

                        </div>
                    </td>
                </tr>
                <tr>
                    <td>시작가</td>
                    <td>
                        <div>
                            <input type="text"  id="start_price" name="start_price" numberonly="true">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>즉시판매가</td>
                    <td>
                        <div>
     	        			<input type="text"  id="direct_price" name="direct_price" numberonly="true">
     	        			 <span>※ 즉시 판매를 원치 않을 때는 기입하지 마세요!</span>
                        </div>
                    </td>
                </tr>
            </tbody></table>
</form>                
<form name="frm_upload" id="frm_upload" method="post">
	<table class="apply-table talbeline">
		<tbody>
	     <tr>
	         <td class="essential"><span>작품이미지</span></td>
	         <td>
	             <div>
	                 <div id="uploader" class="tui-file-uploader uploader-box">
	                     <div class="tui-file-uploader-area" id="file-div" style="min-height: 100px; width: 100%;">
	                     	 <ul class="tui-upload-lst tui-js-file-uploader-list-items" id="file-ul">
	                     	 <!--
	                     		<li class="tui-upload-item">
	                     			<span class="tui-filename-area">
	                     				<span class="tui-file-name">img3.jpg</span>
	                     			</span>
	                     			<button type="button" class="tui-btn-delete">Remove</button>
                     			</li>-->
                   			</ul> 
                   			
                   			
	                     </div>
	                     <div class="thumbnail">
	                      <label class="tui-btn tui-btn-upload m-t-5" style="background-color: rgb(102, 102, 102); color: rgb(255, 255, 255); border: 1px solid gray; height: 28px; line-height: 28px; text-align: center; padding: 0px; width: 100%; display: flex; align-items: center; justify-content: center;">
	                          <span class="tui-btn-txt" style="line-height: initial;">대표 이미지 추가</span>
	                          <input type="file" name="thumbnailFile" id="thumbnailFile" class="tui-input-file" >
	                      </label>
	                     </div>
	                     <div class="viewimg">
	                      <label class="tui-btn tui-btn-upload m-t-5" style="background-color: rgb(102, 102, 102); color: rgb(255, 255, 255); border: 1px solid gray; height: 28px; line-height: 28px; text-align: center; padding: 0px; width: 100%; display: flex; align-items: center; justify-content: center;">
	                          <span class="tui-btn-txt" style="line-height: initial;">상세 이미지 추가</span>
	                          <input type="file" name="addFile" id="addFile" class="tui-input-file" multiple="multiple">
	                      </label>
	                     </div>
                         <input type="hidden" name="lot">	
	                 </div>
	             </div>
	         </td>
	     </tr>
		</tbody>
	</table>
</form>
            <div class="apply-btn">
                <a id="btnCancle" href="main" onclick="">취소</a>
                <a id="Save" href="#" onclick="validate()">위탁 신청</a>
            </div>
        </div>
    </div>
</div>

	        <!-- END CONTENT SECTION -->
            </div>
        <!-- END CONTENT WRAPPER -->
        </div>
<!-- END KA-CONTAINER -->
</div>

<!--알림 모달창 -->
<div class="modals fade show" id="modal-common" >
	<div>
		<div>
			<div>
			    <img src="./img/warning-icon@1x.png" id="img-warning">
			    <h2>알림</h2>
				<span id="modal-message">작품명을 입력해 주세요.</span>
				<a href="#" class="btn-ok" onclick="modalOff($('#modal-common'))">확인</a>
			</div>
			<img src="./img/popup-close@1x.png" class="modal-close" onclick="modalOff($('#modal-common'))">
		</div>
	</div>
</div>
<!--알림 모달창 -->
<div class="modals fade show" id="modal-ctgr" >
	<div>
		<div>
			<div>
			    <img src="./img/warning-icon@1x.png" id="img-warning">
			    <h2>알림</h2>
				<span id="modal-message">카테고리를 선택해 주세요.</span>
				<a href="#" class="btn-ok" onclick="modalOff($('#modal-ctgr'))">확인</a>
			</div>
			<img src="./img/popup-close@1x.png" class="modal-close" onclick="modalOff($('#modal-ctgr'))">
		</div>
	</div>
</div>
<!--알림 모달창 -->
<div class="modals fade show" id="modal-price" >
	<div>
		<div>
			<div>
			    <img src="./img/warning-icon@1x.png" id="img-warning">
			    <h2>알림</h2>
				<span id="modal-message">즉시 판매 가격이 시작가격 보다 낮습니다.</span>
				<a href="#" class="btn-ok" onclick="modalOff($('#modal-price'))">확인</a>
			</div>
			<img src="./img/popup-close@1x.png" class="modal-close" onclick="modalOff($('#modal-price'))">
		</div>
	</div>
</div>
<!--알림 모달창 -->
<div class="modals fade show" id="modal-startprice" >
	<div>
		<div>
			<div>
			    <img src="./img/warning-icon@1x.png" id="img-warning">
			    <h2>알림</h2>
				<span id="modal-message">시작가를 입력해 주세요.</span>
				<a href="#" class="btn-ok" onclick="modalOff($('#modal-startprice'))">확인</a>
			</div>
			<img src="./img/popup-close@1x.png" class="modal-close" onclick="modalOff($('#modal-startprice'))">
		</div>
	</div>
</div>
<!--알림 모달창 -->
<div class="modals fade show" id="modal-size" >
	<div>
		<div>
			<div>
			    <img src="./img/warning-icon@1x.png" id="img-warning">
			    <h2>알림</h2>
				<span id="modal-message">작품의 크기를 모두 입력해 주세요.</span>
				<a href="#" class="btn-ok" onclick="modalOff($('#modal-size'))">확인</a>
			</div>
			<img src="./img/popup-close@1x.png" class="modal-close" onclick="modalOff($('#modal-size'))">
		</div>
	</div>
</div>


<!-- 위탁신청 -->
<div class="modals fade show" id="modal-warning" >
	<div>
		<div>
			<div>
			    <img src="/img/Error-icon@1x.png">
			    <h2 id="modal-warning-title">위탁신청</h2>
			    <span id="modal-warning-message">위탁 신청을 하시겠습니까?</span>
			    <div class="modal-btn">
			        <a href="#" onclick="modalOff($('#modal-warning'))">취소</a>
			    	<a id="btn-warning-confirm" >확인</a>
		        </div>
		    </div>
			<img src="./img/popup-close@1x.png" class="modal-close" onclick="modalOff($('#modal-warning'))">
		</div>
	</div>
</div>

</body>
</html>