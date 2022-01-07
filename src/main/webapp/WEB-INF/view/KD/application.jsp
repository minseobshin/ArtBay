<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href="./css/application.css">
<link rel='stylesheet' type='text/css' href="./css/basic.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/index.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
<!-- 메뉴 네비게이션 -->
	<%@include file="../header.jsp" %>
	
<form name='frm_bay_insert' id='frm_bay_insert' method="post">
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
</div>
<div class="container">
    <div id="consign-request-guide">
        <div class="consignguide-container">
            <div class="consignguide-content">
                <h4>
                    <img src="./img/precau-ico@1x.png" alt="Icon">
                    소장품 위탁 전에 읽어주세요.
                </h4>
                <ul>
                    <li>
                        <div class="ellipse">
                            <span>•</span>
                        </div>
                        <p>경매 위탁시 주의사항 드드드드드드드드드드드드드드드드드드드드드드드드드드드드드드드드</p>
                    </li>
                    <li>
                        <div class="ellipse">
                            <span>•</span>
                        </div>
                        <p>여러가지 전달사항</p>
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
                    <td>홍길동</td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td> 서울 관악구</td>
                </tr>
                <tr>
                    <td>휴대전화</td>
                    <td>010-2222-3333</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>test@naver.com</td>
                </tr>
            </tbody></table>
        </div>
        <div class="conapply-form">
            <h5>위탁작품 정보</h5>
            <table class="apply-table">
                <tbody><tr>
                    <td>작가명</td>
                    <td>
                        <div id="artist-area">
                            <input id="artist" type="text" >
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="essential"><span>작품명</span></td>
                    <td>
                        <div>
                            <input id="title" class="apply-input" type="text" >
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>작품의 재료</td>
                    <td>
                        <div>
                            <select id="material-code" class="material-ch" >
                                <option value="">재료를 선택해 주세요.</option>
                                <option value="001">캔버스의 유채</option>
                                <option value="002">종이에 채색</option>
                                <option value="003">사진</option>
                                <option value="004">판화</option>
                                <option value="005">조각</option>
                                <option value="006">도자기</option>
                            </select>
                            <input type="text">
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
                            <input type="text" id="ho" class="size" numberonly="true">
                            <span>호</span>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td>제작시기</td>
                    <td>
                        <div>
                            <input type="text" id="make-date" >
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>작품설명</td>
                    <td>
                        <div>
                            <textarea class="conapply-text" id="desc"  placeholder="작품에 대해서 가능한 많은 정보를 기입해 주세요. (예 : 소장 경로 또는 출처, 감정서 유무, 전시이력)"></textarea>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>기타</td>
                    <td>
                        <div>
                            <textarea class="conapply-text" id="etc"  placeholder="작품에 대한 보관 상태나 요구 사항 등을 기입해 주세요."></textarea>

                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="essential"><span>작품이미지</span></td>
                    <td>
                        <div>
                            <div id="uploader" class="tui-file-uploader uploader-box">
                                <div class="tui-file-uploader-area" style="min-height: 100px; width: 100%;">
                                </div>
                                <label class="tui-btn tui-btn-upload m-t-5" style="background-color: rgb(102, 102, 102); color: rgb(255, 255, 255); border: 1px solid gray; height: 28px; line-height: 28px; text-align: center; padding: 0px; width: 80px; display: flex; align-items: center; justify-content: center;">
                                    <span class="tui-btn-txt" style="line-height: initial;">파일 추가</span>
                                    <input type="file" name="userfile[]" class="tui-input-file">
                                </label>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>시작가</td>
                    <td>
                        <div>
                            <input type="text"  id="price-desired"  numberonly="true">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>즉시판매가</td>
                    <td>
                        <div>
     	        			<input type="text"  id="price-desired"  numberonly="true">
     	        			 <span>※ 즉시 판매를 원치 않을 때는 기입하지 마세요!</span>
                        </div>
                    </td>
                </tr>
            </tbody></table>
            <div class="apply-btn">
                <a href="consultationList" onclick="">취소</a>
                <a href="#" onclick="validate()">위탁 신청</a>
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
<div class="modal fade show" id="modal-common" >
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


<!-- 위탁신청 -->
<div class="modal fade show" id="modal-warning" >
	<div>
		<div>
			<div>
			    <img src="/img/Error-icon@1x.png">
			    <h2 id="modal-warning-title">위탁신청</h2>
			    <span id="modal-warning-message">위탁 신청을 하시겠습니까?</span>
			    <div class="modal-btn">
			        <a href="#" onclick="modalOff($('#modal-warning'))">취소</a>
			    	<a id="btn-warning-confirm" href="consultationList" onclick="">확인</a>
		        </div>
		    </div>
			<img src="./img/popup-close@1x.png" class="modal-close" onclick="modalOff($('#modal-warning'))">
		</div>
	</div>
</div>
</form>
<!-- 메인 푸터 -->
	<%@include file="../footer.jsp" %>
</body>
<script type="text/javascript" src="./js/application.js"></script>
</html>