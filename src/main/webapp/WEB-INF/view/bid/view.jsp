<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=2.0" >
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800">
<link rel="stylesheet" type="text/css" href="../css/artbay.css">
<script src="js/index.js"></script>
<body>
<form name="frm_view" id="frm_view" method="post">
	<div class="view_left">
		<div class="view_top">
			<c:forEach var="att" items="${vo.attList }">
				<p class="img">
					<img src="${vo.imgFile }" />
					<br/>
				</p>
			</c:forEach>
			<p class="thumbnail">
				<img src="../img/spongebob.png" width=300 height=350/>
			</p>
			<br/>
			<div class="view_sml_btn">
				<p id="like">❤️</p>
				<p id="share">🔗</p>
				<p id="magnifier">🔎</p>
			</div>
		</div>
		<div class="work_info">
			<h3>작품 정보</h3>
			<div class="cont">
				<p> signed, titled and dated on the reverse<br/>Acrylic Frame </p>
			</div>
		</div>
	</div>
	<div class="view_right">
		<div class="right_work_info">	
			<div class="deadline_time">
				<span>남은 시간</span>
				<span class="remainTime"></span>
			</div>	
			<div class="view_detail">
				<p class="painter"><span>작가 이름</span></p>
				<p class="art_name">그림 제목</p>
				<p class="material">재료</p>
				<p class="paintSize">사이즈</p>
			</div>
			<div class="view_price">
				<p>
					<strong>추정가</strong>
						KRW 6,000,000~8,000,000
				</p>
				<p>
					<strong>시작가</strong>
						KRW 4,000,000
				</p>
				<p>
					<strong>현재가</strong>
						KRW 9,000,000
				</p>
			</div>
			<div class="closing_hour">
				<span>마감 시간</span>
				<span>01/04 - 04:00 PM</span>
			</div>
				<li class="right_modal_btn" id="right_modal_btn1" onclick="modalOn($('.rightmodal_m1'))">				
					<p><span>낙찰 수수료</span></p>
				</li>
				<li class="right_modal_btn" onclick="modalOn($('.rightmodal_m2'))">
					<p><span>예상 배송비</span></p>
				</li>
				<li class="right_modal_btn" id="right_modal_btn3" onclick="modalOn($('.rightmodal_m3'))">
					<p><span>경매 호가표</span></p>
				</li>
				<li class="right_modal_btn" onclick="modalOn($('.rightmodal_m4'))">
					<p><span>설치 및 보관</span></p>
				</li>
			<br/>
			<input type="button" class="btnBidStart" value="응찰하기" onclick="modalOn($('.bid_price'))"/>
		</div>
	<!-- 낙찰 수수료 모달 -->
		<div class="rightmodal_m1" style="border:1px solid grey;">
			<div class="modal1" id="">
			<input type="button" value="X" onclick="modalOff($(this))" class="xBtn"/>
				<div class="modal_title">
					<p>&nbsp;낙찰 수수료 안내</p>
				</div>
				<div class="modal_body">
					<table class="commission_rate">
							<tr>
								<th scope="col" class="bid">낙찰가 (원)</th>
								<th scope="col" class="cm_rate">수수료율 (VAT 포함)</th>
							</tr>
						<tbody>
							<tr>
								<td>~ 10,000,000</td>
								<td> 낙찰가의 19.8%</td>
							</tr>
							<tr>
								<td>10,000,001</td>
								<td>1,000만원 x 19.8% + (낙찰가-1,000만원) x 16.5%</td>
							</tr>
						</tbody>
					</table>
						<div class="exam">
							<p>예시&#41; 낙찰가 5,000만원일 경우</p>
							<p>낙찰 수수료 :</p>
							<p>198만원 + (5,000만원 - 1,000만원) * 16.5% = 8,580,000원</p>
							<p>총 구매대금 :</p>
							<p>낙찰가 + 낙찰수수료 = 58,580,000원</p>
						</div>
				</div>
			</div>
		</div>
		<!-- 배송 모달 -->
		<div class="rightmodal_m2">
			<div class="modal2" id="modal">
			<input type="button" value="X" onclick="modalOff($(this))" class="xBtn"/>
				<div class="modal_title">
					<p>&nbsp;배송 관련 안내</p>
				</div>
				<div class="modal_body">
					<ul>
						<li> 온라인 경매의 낙찰작은 직접 픽업이 원칙이나, 불가능한 경우 배송을 요청할 수 있으며, 아래와 같이 배송비가 부과 됩니다.
							<div class="table">
								<table class="deliv_table">
									<tbody>
										<tr>
											<td colspan="2" class="deliv_th1">국내</td>
											<td colspan="2" class="deliv_th2">해외</td>
										</tr>
										<tr>
											<td class="deliv_table_place">서울</td>
											<td class="deliv_table_price">5만원</td>
											<td class="deliv_table_extra" colspan="2" rowspan="3">별도 배송비
										</tr>
										<tr>
											<td class="place">수도권</td>
											<td>10만원</td>
										</tr>
										<tr>
											<td class="place">그 외 국내지역</td>
											<td>15만원</td>
										</tr>
									</tbody>
								</table>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 경매 호가표 모달-->
		<div class="rightmodal_m3">
			<div class="modal3" id="modal">
			<input type="button" value="X" onclick="modalOff($(this))" class="xBtn"/>
				<div class="modal_title">
					<p>&nbsp;경매 호가표 안내</p>
				</div>
				<div class="modal_body">
					<table class="bid_price_standard">
						<tr>
							<th scope="col" style="width: 60%;">현재가 구간 (원)</th>
							<th scope="col" style="width: 40%;">호가 단위 (원)</th>
						</tr>
						<tbody>
							<tr>
								<td>30만 미만</td>
								<td>20,000</td>
							</tr>
							<tr>
								<td>30만 이상 ~ 100만 미만</td>
								<td>50,000</td>
							</tr>
							<tr>
								<td>100만 이상 ~ 300만 미만</td>
								<td>100,000</td>
							</tr>
							<tr>
								<td>300만 이상 ~ 500만 미만</td>
								<td>200,000</td>
							</tr>
							<tr>
								<td>500만 이상 ~ 1,000만 미만</td>
								<td>500,000</td>
							</tr>
							<tr>
								<td>1,000만 이상 ~ 3,000만 미만</td>
								<td>1,000,000</td>
							</tr>
							<tr>
								<td>3,000만 이상 ~ 5,000만 미만</td>
								<td>2,000,000</td>
							</tr>
							<tr>
								<td>5,000만 이상 ~ 2억 미만</td>
								<td>5,000,000</td>
							</tr>
							<tr>
								<td>2억 이상 ~ 5억 미만</td>
								<td>10,000,000</td>
							</tr>
							<tr>
								<td>5억 이상</td>
								<td>20,000,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 설치 및 보관 모달-->
		<div class="rightmodal_m4">
			<div class="modal4" id="modal">
			<input type="button" value="X" onclick="modalOff($(this))" class="xBtn"/>
				<div class="modal_title">
					<p>&nbsp;설치 및 보관 안내</p>
				</div>
				<div class="modal_body">
					<p>당사 낙찰 제품에 한하여 배송 시 설치를 함께 요청하실 수 있으며, 사전 예약이 필요합니다.</p>
					<p>낙찰 및 판매 이후 7일 경과 시 입금여부와 무관하게 일 30,000원/점의 비용이 발생합니다.</p>
				</div>
			</div>
		</div>
		<!-- 로그인 모달 -->
		<div class="login">
			<div class="modal_login" id="modal">
			<input type="button" value="X" onclick="modalOff($(this))" class="xBtn"/>
				<h3> LOGIN </h3>
				<input type="text" id="mid" placeholder="아이디" /><br/>		
				<input type="password" id="pwd" placeholder="비밀번호" /><br/>
				<p><span> 로그인하시면 응찰이 가능합니다.</span></p>
				<div class="login_modal_btn">
					<div>
						<input type="checkbox" id="check_login" value="0" />
						<label for="check_login">로그인 상태 유지</label>
					</div>
					<div>
						<a href="/아이디찾기 주소">아이디 찾기</a>
						<a href="/비밀번호찾기 주소">비밀번호 찾기</a>
					</div>
					<button type="button">
						<span>로그인</span>
					</button>
					<div class="bottom_join">
						<p>아직 아트베이 회원이 아니세요?<a href="/회원가입 주소">회원가입</a></p>
					</div>
				</div>
			</div>
		</div>
		<!-- 응찰 유의 사항 -->
		<div class="bid_caution">
			<div class="bid_caution_modal" id="modal">
			<h2>&nbsp;온라인 응찰 유의사항</h2>
				<ul>
					<li>낙찰 시 낙찰대금 외 구매 수수료(부가세 별도) 및 낙찰자 비용(있을 경우)이 부과됩니다.</li>
					<li>모든 응찰은 응찰자가 실물을 확인한 것을 전제로 하며, 액자나 작품 컨디션을 이유로 응찰 또는 낙찰을 취소할 수 없습니다.</li>
					<li>낙찰 후 취소하고자 하는 경우, 낙찰자는 낙찰철회비로 낙찰가의 30%에 해당하는 금액을 납부하여야 하므로 신중하게 응찰하시기 바랍니다.</li>
					<li>마감 전 30초 내의 응찰이 있을 경우, 자동으로 30초 연장됩니다.</li>
				</ul>
				
				<p>위 응찰 유의사항을 확인하였으며. 동의하므로 응찰을 신청합니다.</p>
				<div class="bidApplyBtn">
					<input type="button" class="btnBidCancel" value="취소" />
					<input type="button" class="btnBidApply" value="동의 및 응찰"/>
				</div>
			</div>
		</div>
		<!-- 응찰 시작 모달-->
		<div class="bid_price">
			<h2>응찰내역</h2>
			<div class="btnBidList">
				<input type="button" value="X" onclick="modalOff($(this))" class="xBtn"/>
				<ul class="bid_price_choose">
					<li>전체</li>
					<li>내 응찰</li>
				</ul>
			</div>
			<div class="bidList">
				<div class="bidHistory">
					<ul>
						<li>2021-12-25</li>
						<br/>
						<li>10:23:00</li>
						<li>4,400,000</li>
					</ul>
				</div>
				<div class="current_bid_price">
					<div class="my_choice">
						<div class="my_choice_left">
							<strong>시작가</strong><br/><br/>
							<strong>현재가</strong><br/><br/><br/>
							<strong>응찰가</strong><br/><br/>
						</div>
						<div class="my_choice_right">
							<strong>KRW 4,000,000</strong><br/><br/>
							<strong>KRW 11,000,000 <br/> (응찰횟수 20회)</strong><br/><br/>
							<select class="price_combo">
								<option value="10000">10,000</option>
								<option value="20000">20,000</option>
							</select><br/><br/>
							최고 응찰가를 선택하세요.<br/><br/>
						</div>
						<!-- 
						<div>
							<strong>시작가</strong>
							<div>
								<strong>KRW 4,000,000</strong>
							</div>
						</div>
						<div>
							<strong>현재가</strong>
							<div>
								<strong>KRW 11,000,000 (응찰횟수 20회)</strong>
							</div>
						</div>
						<div>
							<strong>응찰가</strong>
							<select class="price_combo">
								<option value="10000">10,000</option>
								<option value="20000">20,000</option>
							</select>
							<br/>
							<strong>　</strong>
							최고 응찰가를 선택하세요.
						</div>
						 -->
					</div>
				</div>
			<input type="button" class="btnBidApplyFinal" value="응찰하기"  onclick="modalOn($('.bid_caution'))"/>
			</div>
		</div>
	</div>
	<div class="caution">
			<h3>Condition Report</h3>
			<div class="caution_inquiry">
				<li>실물을 반드시 확인한 후 응찰 바랍니다. 실물을 확인하지 않아 발생되는 문제에 대한 책임은 응찰자에게 있습니다.</li>
				<li>곳이 우리의 위하여 방지하는 이성은 가장 듣는다. 자신과 그들은 가진 것이 철환하였는가? 그들은 얼음 살 이것을 우리의 위하여 가장 예가 사막이다. 트고, 피어나기 수 기관과 말이다. 싹이 보는 찾아다녀도, 아니다. 대중을 스며들어 노래하며 봄바람이다. 따뜻한 우리 물방아 무한한 그리하였는가? 반짝이는 남는 창공에 인간이 사랑의 힘차게 때에, 것이다. 원대하고, 역사를 온갖 생생하며, 낙원을 대중을 인도하겠다는 풍부하게 피다. 날카로우나 얼음과 살 때까지 청춘의 따뜻한 대한 우리 뿐이다.	위하여 오아이스도 가지에 속에 불어 쓸쓸한 교향악이다. 피는 소금이라 거선의 그들은 인도하겠다는 뿐이다. 사람은 얼마나 오아이스도 두기 산야에 그들의 있는가? 불어 있는 커다란 있으랴? 스며들어 봄바람을 물방아 것은 얼마나 피가 봄바람이다. 어디 인간이 않는 속에서 있으랴? 고행을 보이는 들어 되려니와, 살았으며, 품었기 모래뿐일 것이다. 목숨을 곳이 힘차게 것은 약동하다. 품고 영원히 타오르고 사막이다. 미인을 원질이 오아이스도 설레는 할지니, 사랑의 피고, 투명하되 철환하였는가? 것은 꽃이 품에 그것은 속잎나고, 그리하였는가? 수 거선의 인생에 구하지 그리하였는가? 용감하고 인간의 꽃이 있을 기쁘며, 사막이다. 그들의 우리의 스며들어 힘차게 이것이다. 커다란 우리는 품으며, 찾아 인간이 따뜻한 뜨거운지라, 노년에게서 끝에 아름다우냐? 따뜻한 보는 없으면, 천하를 하여도 속에 아니한 얼마나 뭇 칼이다. 피어나는 그것을 할지니, 넣는 청춘을 그들에게 옷을 말이다. 꽃 갑 눈이 모래뿐일 가지에 군영과 것이다. 무엇을 같지 전인 청춘을 창공에 미묘한 천고에 보배를 말이다. 산야에 미인을 희망의 온갖 있는 있으랴? 아니한 힘차게 무엇을 인도하겠다는 무한한 청춘의 있음으로써 긴지라 이것이다. 것이다.보라, 얼음이 않는 힘있다.</li>

			</div>
	</div>
	<div id="hiddenZone">
			<input type="text" id="findStr" value="${page.findStr }"/>
			<input type="text" name="nowPage" value="${page.nowPage }"/>
			<input type="text" name="lot" id="lot" value="${vo.lot }"/>
		</div>
</form>
<script src="../js/artbay.js"></script>
</body>
</html>