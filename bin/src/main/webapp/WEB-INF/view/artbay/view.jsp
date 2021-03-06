<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" type="text/css" href="../css/artbay.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800">
<script src="js/index.js"></script>
<body>
<%-- <%@include file="../header.jsp" %> --%>
<form name="frm_view" id="frm_view" method="post">
	<div class="view_left">
		<div class="view_top">
			<p class="img"><img src="../img/spongebob.png" width=300 height=350/></p>
			<br/>
			<div class="view_sml_btn">
				<p id="like">β€οΈ</p>
				<p id="share">π</p>
				<p id="magnifier">π</p>
			</div>
		</div>
		<div class="work_info">
			<h3>μν μ λ³΄</h3>
			<div class="cont">
				<p> signed, titled and dated on the reverse<br/>Acrylic Frame </p>
			</div>
		</div>
	</div>
	<div class="view_right">
		<div class="right_work_info">	
			<div class="deadline_time">
				<span>λ¨μ μκ°</span>
				<span class="remainTime"></span>
			</div>	
			<div class="view_detail">
				<p class="painter"><span>μκ° μ΄λ¦</span></p>
				<p class="art_name">κ·Έλ¦Ό μ λͺ©</p>
				<p class="material">μ¬λ£</p>
				<p class="paintSize">μ¬μ΄μ¦</p>
			</div>
			<div class="view_price">
				<p>
					<strong>μΆμ κ°</strong>
						KRW 6,000,000~8,000,000
				</p>
				<p>
					<strong>μμκ°</strong>
						KRW 4,000,000
				</p>
				<p>
					<strong>νμ¬κ°</strong>
						KRW 9,000,000
				</p>
			</div>
			<div class="closing_hour">
				<span>λ§κ° μκ°</span>
				<span>01/04 - 04:00 PM</span>
			</div>
				<li class="right_modal_btn" id="right_modal_btn1" onclick="modalOn($('.rightmodal_m1'))">				
					<p><span>λμ°° μμλ£</span></p>
				</li>
				<li class="right_modal_btn" onclick="modalOn($('.rightmodal_m2'))">
					<p><span>μμ λ°°μ‘λΉ</span></p>
				</li>
				<li class="right_modal_btn" id="right_modal_btn3" onclick="modalOn($('.rightmodal_m3'))">
					<p><span>κ²½λ§€ νΈκ°ν</span></p>
				</li>
				<li class="right_modal_btn" onclick="modalOn($('.rightmodal_m4'))">
					<p><span>μ€μΉ λ° λ³΄κ΄</span></p>
				</li>
			<br/>
			<input type="button" class="btnBidStart" value="μμ°°νκΈ°" onclick="modalOn($('.bid_price'))"/>
		</div>
	<!-- λμ°° μμλ£ λͺ¨λ¬ -->
		<div class="rightmodal_m1" style="border:1px solid grey;">
			<div class="modal1" id="">
			<input type="button" value="X" onclick="modalOff($(this))" class="xBtn"/>
				<div class="modal_title">
					<p>&nbsp;λμ°° μμλ£ μλ΄</p>
				</div>
				<div class="modal_body">
					<table class="commission_rate">
							<tr>
								<th scope="col" class="bid">λμ°°κ° (μ)</th>
								<th scope="col" class="cm_rate">μμλ£μ¨ (VAT ν¬ν¨)</th>
							</tr>
						<tbody>
							<tr>
								<td>~ 10,000,000</td>
								<td> λμ°°κ°μ 19.8%</td>
							</tr>
							<tr>
								<td>10,000,001</td>
								<td>1,000λ§μ x 19.8% + (λμ°°κ°-1,000λ§μ) x 16.5%</td>
							</tr>
						</tbody>
					</table>
						<div class="exam">
							<p>μμ&#41; λμ°°κ° 5,000λ§μμΌ κ²½μ°</p>
							<p>λμ°° μμλ£ :</p>
							<p>198λ§μ + (5,000λ§μ - 1,000λ§μ) * 16.5% = 8,580,000μ</p>
							<p>μ΄ κ΅¬λ§€λκΈ :</p>
							<p>λμ°°κ° + λμ°°μμλ£ = 58,580,000μ</p>
						</div>
				</div>
			</div>
		</div>
		<!-- λ°°μ‘ λͺ¨λ¬ -->
		<div class="rightmodal_m2">
			<div class="modal2" id="modal">
			<input type="button" value="X" onclick="modalOff($(this))" class="xBtn"/>
				<div class="modal_title">
					<p>&nbsp;λ°°μ‘ κ΄λ ¨ μλ΄</p>
				</div>
				<div class="modal_body">
					<ul>
						<li> μ¨λΌμΈ κ²½λ§€μ λμ°°μμ μ§μ  ν½μμ΄ μμΉμ΄λ, λΆκ°λ₯ν κ²½μ° λ°°μ‘μ μμ²­ν  μ μμΌλ©°, μλμ κ°μ΄ λ°°μ‘λΉκ° λΆκ³Ό λ©λλ€.
							<div class="table">
								<table class="deliv_table">
									<tbody>
										<tr>
											<td colspan="2" class="deliv_th1">κ΅­λ΄</td>
											<td colspan="2" class="deliv_th2">ν΄μΈ</td>
										</tr>
										<tr>
											<td class="deliv_table_place">μμΈ</td>
											<td class="deliv_table_price">5λ§μ</td>
											<td class="deliv_table_extra" colspan="2" rowspan="3">λ³λ λ°°μ‘λΉ
										</tr>
										<tr>
											<td class="place">μλκΆ</td>
											<td>10λ§μ</td>
										</tr>
										<tr>
											<td class="place">κ·Έ μΈ κ΅­λ΄μ§μ­</td>
											<td>15λ§μ</td>
										</tr>
									</tbody>
								</table>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- κ²½λ§€ νΈκ°ν λͺ¨λ¬-->
		<div class="rightmodal_m3">
			<div class="modal3" id="modal">
			<input type="button" value="X" onclick="modalOff($(this))" class="xBtn"/>
				<div class="modal_title">
					<p>&nbsp;κ²½λ§€ νΈκ°ν μλ΄</p>
				</div>
				<div class="modal_body">
					<table class="bid_price_standard">
						<tr>
							<th scope="col" style="width: 60%;">νμ¬κ° κ΅¬κ° (μ)</th>
							<th scope="col" style="width: 40%;">νΈκ° λ¨μ (μ)</th>
						</tr>
						<tbody>
							<tr>
								<td>30λ§ λ―Έλ§</td>
								<td>20,000</td>
							</tr>
							<tr>
								<td>30λ§ μ΄μ ~ 100λ§ λ―Έλ§</td>
								<td>50,000</td>
							</tr>
							<tr>
								<td>100λ§ μ΄μ ~ 300λ§ λ―Έλ§</td>
								<td>100,000</td>
							</tr>
							<tr>
								<td>300λ§ μ΄μ ~ 500λ§ λ―Έλ§</td>
								<td>200,000</td>
							</tr>
							<tr>
								<td>500λ§ μ΄μ ~ 1,000λ§ λ―Έλ§</td>
								<td>500,000</td>
							</tr>
							<tr>
								<td>1,000λ§ μ΄μ ~ 3,000λ§ λ―Έλ§</td>
								<td>1,000,000</td>
							</tr>
							<tr>
								<td>3,000λ§ μ΄μ ~ 5,000λ§ λ―Έλ§</td>
								<td>2,000,000</td>
							</tr>
							<tr>
								<td>5,000λ§ μ΄μ ~ 2μ΅ λ―Έλ§</td>
								<td>5,000,000</td>
							</tr>
							<tr>
								<td>2μ΅ μ΄μ ~ 5μ΅ λ―Έλ§</td>
								<td>10,000,000</td>
							</tr>
							<tr>
								<td>5μ΅ μ΄μ</td>
								<td>20,000,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- μ€μΉ λ° λ³΄κ΄ λͺ¨λ¬-->
		<div class="rightmodal_m4">
			<div class="modal4" id="modal">
			<input type="button" value="X" onclick="modalOff($(this))" class="xBtn"/>
				<div class="modal_title">
					<p>&nbsp;μ€μΉ λ° λ³΄κ΄ μλ΄</p>
				</div>
				<div class="modal_body">
					<p>λΉμ¬ λμ°° μ νμ ννμ¬ λ°°μ‘ μ μ€μΉλ₯Ό ν¨κ» μμ²­νμ€ μ μμΌλ©°, μ¬μ  μμ½μ΄ νμν©λλ€.</p>
					<p>λμ°° λ° νλ§€ μ΄ν 7μΌ κ²½κ³Ό μ μκΈμ¬λΆμ λ¬΄κ΄νκ² μΌ 30,000μ/μ μ λΉμ©μ΄ λ°μν©λλ€.</p>
				</div>
			</div>
		</div>
		<!-- λ‘κ·ΈμΈ λͺ¨λ¬ -->
		<div class="login">
			<div class="modal_login" id="modal">
			<input type="button" value="X" onclick="modalOff($(this))" class="xBtn"/>
				<h3> LOGIN </h3>
				<input type="text" id="mid" placeholder="μμ΄λ" /><br/>		
				<input type="password" id="pwd" placeholder="λΉλ°λ²νΈ" /><br/>
				<p><span> λ‘κ·ΈμΈνμλ©΄ μμ°°μ΄ κ°λ₯ν©λλ€.</span></p>
				<div class="login_modal_btn">
					<div>
						<input type="checkbox" id="check_login" value="0" />
						<label for="check_login">λ‘κ·ΈμΈ μν μ μ§</label>
					</div>
					<div>
						<a href="/μμ΄λμ°ΎκΈ° μ£Όμ">μμ΄λ μ°ΎκΈ°</a>
						<a href="/λΉλ°λ²νΈμ°ΎκΈ° μ£Όμ">λΉλ°λ²νΈ μ°ΎκΈ°</a>
					</div>
					<button type="button">
						<span>λ‘κ·ΈμΈ</span>
					</button>
					<div class="bottom_join">
						<p>μμ§ μνΈλ² μ΄ νμμ΄ μλμΈμ?<a href="/νμκ°μ μ£Όμ">νμκ°μ</a></p>
					</div>
				</div>
			</div>
		</div>
		<!-- μμ°° μ μ μ¬ν­ -->
		<div class="bid_caution">
			<div class="bid_caution_modal" id="modal">
			<h2>&nbsp;μ¨λΌμΈ μμ°° μ μμ¬ν­</h2>
				<ul>
					<li>λμ°° μ λμ°°λκΈ μΈ κ΅¬λ§€ μμλ£(λΆκ°μΈ λ³λ) λ° λμ°°μ λΉμ©(μμ κ²½μ°)μ΄ λΆκ³Όλ©λλ€.</li>
					<li>λͺ¨λ  μμ°°μ μμ°°μκ° μ€λ¬Όμ νμΈν κ²μ μ μ λ‘ νλ©°, μ‘μλ μν μ»¨λμμ μ΄μ λ‘ μμ°° λλ λμ°°μ μ·¨μν  μ μμ΅λλ€.</li>
					<li>λμ°° ν μ·¨μνκ³ μ νλ κ²½μ°, λμ°°μλ λμ°°μ² νλΉλ‘ λμ°°κ°μ 30%μ ν΄λΉνλ κΈμ‘μ λ©λΆνμ¬μΌ νλ―λ‘ μ μ€νκ² μμ°°νμκΈ° λ°λλλ€.</li>
					<li>λ§κ° μ  30μ΄ λ΄μ μμ°°μ΄ μμ κ²½μ°, μλμΌλ‘ 30μ΄ μ°μ₯λ©λλ€.</li>
				</ul>
				
				<p>μ μμ°° μ μμ¬ν­μ νμΈνμμΌλ©°. λμνλ―λ‘ μμ°°μ μ μ²­ν©λλ€.</p>
				<div class="bidApplyBtn">
					<input type="button" class="btnBidCancel" value="μ·¨μ" />
					<input type="button" class="btnBidApply" value="λμ λ° μμ°°"/>
				</div>
			</div>
		</div>
		<!-- μμ°° μμ λͺ¨λ¬-->
		<div class="bid_price">
			<h2>μμ°°λ΄μ­</h2>
			<div class="btnBidList">
				<input type="button" value="X" onclick="modalOff($(this))" class="xBtn"/>
				<ul class="bid_price_choose">
					<li>μ μ²΄</li>
					<li>λ΄ μμ°°</li>
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
						<div>
							<strong>μμκ°</strong>
							<div>
								<strong>KRW 4,000,000</strong>
							</div>
						</div>
						<div>
							<strong>νμ¬κ°</strong>
							<div>
								<strong>KRW 11,000,000 (μμ°°νμ 20ν)</strong>
							</div>
						</div>
						<div>
							<strong>μμ°°κ°</strong>
							<select class="price_combo">
								<option value="10000">10,000</option>
								<option value="20000">20,000</option>
							</select>
							<br/>
							<strong>γ</strong>
							μ΅κ³  μμ°°κ°λ₯Ό μ ννμΈμ.
						</div>
					</div>
					<input type="button" class="btnBidApplyFinal" value="μμ°°νκΈ°"  onclick="modalOn($('.bid_caution'))"/>
				</div>
			</div>
		</div>
	</div>
	<div class="caution">
			<h3>Condition Report</h3>
			<div class="caution_inquiry">
				<li>μ€λ¬Όμ λ°λμ νμΈν ν μμ°° λ°λλλ€. μ€λ¬Όμ νμΈνμ§ μμ λ°μλλ λ¬Έμ μ λν μ±μμ μμ°°μμκ² μμ΅λλ€.</li>
				<li>κ³³μ΄ μ°λ¦¬μ μνμ¬ λ°©μ§νλ μ΄μ±μ κ°μ₯ λ£λλ€. μμ κ³Ό κ·Έλ€μ κ°μ§ κ²μ΄ μ² ννμλκ°? κ·Έλ€μ μΌμ μ΄ μ΄κ²μ μ°λ¦¬μ μνμ¬ κ°μ₯ μκ° μ¬λ§μ΄λ€. νΈκ³ , νΌμ΄λκΈ° μ κΈ°κ΄κ³Ό λ§μ΄λ€. μΉμ΄ λ³΄λ μ°Ύμλ€λλ, μλλ€. λμ€μ μ€λ©°λ€μ΄ λΈλνλ©° λ΄λ°λμ΄λ€. λ°λ»ν μ°λ¦¬ λ¬Όλ°©μ λ¬΄νν κ·Έλ¦¬νμλκ°? λ°μ§μ΄λ λ¨λ μ°½κ³΅μ μΈκ°μ΄ μ¬λμ νμ°¨κ² λμ, κ²μ΄λ€. μλνκ³ , μ­μ¬λ₯Ό μ¨κ° μμνλ©°, λμμ λμ€μ μΈλνκ² λ€λ νλΆνκ² νΌλ€. λ μΉ΄λ‘μ°λ μΌμκ³Ό μ΄ λκΉμ§ μ²­μΆμ λ°λ»ν λν μ°λ¦¬ λΏμ΄λ€.	μνμ¬ μ€μμ΄μ€λ κ°μ§μ μμ λΆμ΄ μΈμΈν κ΅ν₯μμ΄λ€. νΌλ μκΈμ΄λΌ κ±°μ μ κ·Έλ€μ μΈλνκ² λ€λ λΏμ΄λ€. μ¬λμ μΌλ§λ μ€μμ΄μ€λ λκΈ° μ°μΌμ κ·Έλ€μ μλκ°? λΆμ΄ μλ μ»€λ€λ μμΌλ΄? μ€λ©°λ€μ΄ λ΄λ°λμ λ¬Όλ°©μ κ²μ μΌλ§λ νΌκ° λ΄λ°λμ΄λ€. μ΄λ μΈκ°μ΄ μλ μμμ μμΌλ΄? κ³ νμ λ³΄μ΄λ λ€μ΄ λλ €λμ, μ΄μμΌλ©°, νμκΈ° λͺ¨λλΏμΌ κ²μ΄λ€. λͺ©μ¨μ κ³³μ΄ νμ°¨κ² κ²μ μ½λνλ€. νκ³  μμν νμ€λ₯΄κ³  μ¬λ§μ΄λ€. λ―ΈμΈμ μμ§μ΄ μ€μμ΄μ€λ μ€λ λ ν μ§λ, μ¬λμ νΌκ³ , ν¬λͺνλ μ² ννμλκ°? κ²μ κ½μ΄ νμ κ·Έκ²μ μμλκ³ , κ·Έλ¦¬νμλκ°? μ κ±°μ μ μΈμμ κ΅¬νμ§ κ·Έλ¦¬νμλκ°? μ©κ°νκ³  μΈκ°μ κ½μ΄ μμ κΈ°μλ©°, μ¬λ§μ΄λ€. κ·Έλ€μ μ°λ¦¬μ μ€λ©°λ€μ΄ νμ°¨κ² μ΄κ²μ΄λ€. μ»€λ€λ μ°λ¦¬λ νμΌλ©°, μ°Ύμ μΈκ°μ΄ λ°λ»ν λ¨κ±°μ΄μ§λΌ, λΈλμκ²μ λμ μλ¦λ€μ°λ? λ°λ»ν λ³΄λ μμΌλ©΄, μ²νλ₯Ό νμ¬λ μμ μλν μΌλ§λ λ­ μΉΌμ΄λ€. νΌμ΄λλ κ·Έκ²μ ν μ§λ, λ£λ μ²­μΆμ κ·Έλ€μκ² μ·μ λ§μ΄λ€. κ½ κ° λμ΄ λͺ¨λλΏμΌ κ°μ§μ κ΅°μκ³Ό κ²μ΄λ€. λ¬΄μμ κ°μ§ μ μΈ μ²­μΆμ μ°½κ³΅μ λ―Έλ¬ν μ²κ³ μ λ³΄λ°°λ₯Ό λ§μ΄λ€. μ°μΌμ λ―ΈμΈμ ν¬λ§μ μ¨κ° μλ μμΌλ΄? μλν νμ°¨κ² λ¬΄μμ μΈλνκ² λ€λ λ¬΄νν μ²­μΆμ μμμΌλ‘μ¨ κΈ΄μ§λΌ μ΄κ²μ΄λ€. κ²μ΄λ€.λ³΄λΌ, μΌμμ΄ μλ νμλ€.</li>

			</div>
	</div>
</form>
<%-- <%@include file="../footer.jsp" %> --%>
<script src="../js/artbay.js"></script>
</body>
</html>