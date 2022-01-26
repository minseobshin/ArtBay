<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel='stylesheet' type='text/css' href="./css/application2.css">
</head>
<body>
<div class = "applyform">
	<h1>응찰안내</h1>
	<div class="bgImgHowto"></div>
</div>
<div class="container">
    <div id="Howto">        
        <div class="howtobtn" style="margin-top: 0px;">
            <ul>
                <li>
                    <a href="howtoHowtotest">경매 소개</a>
                    <div class="howto-subbtn">
                        <ul class="a1">
                            <li><a href="">경매 취지</a></li>
                            <li><a href="">온라인 경매</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="howtoBidIntrotest">응찰 안내</a>
                    <div class="howto-subbtn" style="">
                        <ul class="a2">
                            <li class=""><a href="#">회원 가입</a></li>
                            <!-- <li class=""><a href="#">프리뷰</a></li> -->
                            <li class=""><a id="menu_bid" href="#">응찰</a></li>
                            <li class=""><a href="#">낙찰 결과 확인 및 결제</a></li>
                            <li class=""><a href="#">배송, 설치 및 보관</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="howtoConsignGuidetest">위탁 안내</a>
                    <div class="howto-subbtn">
                        <ul class="a3">
                            <li><a href="">Why K Auction?</a></li>
                            <li><a href="">위탁 절차</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <div class="howto-desc" style="margin-top: 0px;">
            <div class="bid-guide">
                <div id="step1">
                    <strong>Step.1</strong>
                    <h2>회원 가입</h2>
                    <p>
                        아트베이의 경매에 응찰하기 위해서 반드시 회원가입을 하셔야 합니다.<br>아트베이 회원은 홈페이지에서 지난 경매 결과 및 작품 이미지를 보실 수 있습니다.
                    </p>
                    <div class="step1-desc">
                        <div>
                            <div class="img">
                                <img src="/img/spongebob.png" >
                            </div>
                            <div>
                                <h6>전시장 방문 가입</h6>
                                <p>
                                    아트베이을 방문하여 회원가입이 가능합니다. 단, 경매 응찰을 위해서는 신분증 확인 등 본인인증 절차가 필요하며, 온라인을 통한 응찰이나 서면 응찰을 위해서는 현장 회원가입과 별도로 아트베이 홈페이지에서 회원가입과 본인인증이 필요합니다.
                                </p>
                            </div>
                        </div>
                        <div>
                            <div class="img">
                                <img src="/img/visit02.jpg" >
                            </div>
                            <div>
                                <h6>홈페이지 회원 가입</h6>
                                <p>
                                    홈페이지에 접속하여 약관 동의 후 가입이 가능하며, 본인인증 절차를 마친 고객에 한해서만 응찰 자격이 부여됩니다. 홈페이지에서 본인인증 절차를 마치고 가입한 고객의 경우, 온라인 응찰이 가능합니다.
                                </p>
                            </div>
                        </div>
                        <div>
                            <div class="img">
                                <img src="/img/spongebob.png" >
                            </div>
                            <div>
                                <h6>유료 회원 가입</h6>
                                <p>
                                    연회비 10만원의 유료회원에 가입하시면, 연 8회 발행되는 메이저 경매 도록을 받아보실 수 있습니다. 신청은 My Page &gt; 도록 신청 메뉴에서 가능합니다.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            <!--     <div>
                    <strong>Step.2</strong>
                    <h2>프리뷰</h2>
                    <p>
                        경매 출품작과 상세정보는 경매 기간 중 아트베이 홈페이지와 아트베이 전시장에서 확인하실 수 있습니다.<br>프리뷰(전시)는 무료이며, 작품 보증은 경매되는 시점을 기준으로 하므로, 경매 전 반드시 전시장을 방문하셔서 직접 작품의 컨디션을 확인하시고 응찰해 주시기를 권장합니다.
                    </p>
                    <div class="preview-img">
                        <div>
                            <img src="/img/spongebob.png" >
                        </div>
                        <div>
                            <img src="/img/spongebob.png" >
                        </div>
                    </div>
                </div> -->
                <div id="step2">
                    <strong>Step.2</strong>
                    <h2>응찰</h2>
                    
                    <!-- <div class="live-auc">
                        <h4>라이브 경매</h4>
                        <p>라이브경매는 서면(서류 및 온라인 신청), 전화, 현장 응찰로 진행되며 온라인 라이브 시스템을 통한 응찰도 가능합니다.</p>
                        <div class="liveauc-guide">
                            <div>
                                <div class="img">
                                    <img src="/img/spongebob.png" >
                                </div>
                                <div>
                                    <h6>서면 응찰</h6>
                                    <p>
                                        경매 전 원하는 작품의 응찰 최고 한도를 정해 제출하시면, 경매 당일 해당 작품의 다른 응찰에 대응하여 제출한 최고 한도까지 자동으로 응찰이 이뤄집니다. 서면 응찰자 중 동일한 금액이 있을 경우, 먼저 접수된 응찰이 우선순위를 가집니다. 서면 응찰 신청은 방문 접수 또는 아트베이 홈페이지에서 가능합니다.
                                    </p>
                                </div>
                            </div>
                            <div>
                                <div class="img">
                                    <img src="/img/spongebob.png" >
                                </div>
                                <div>
                                    <h6>현장 응찰</h6>
                                    <p>사전에 현장 응찰 신청을 하고, 경매 당일 직접 참석하여 패들을 부여받은 후 경매장에서 직접 응찰할 수 있습니다.</p>
                                </div>
                            </div>
                            <div>
                                <div class="img">
                                    <img src="/img/spongebob.png" >
                                </div>
                                <div>
                                    <h6>전화 응찰</h6>
                                    <p>사전에 전화응찰 신청을 하고, 경매 당일 담당 직원과 전화 통화를 통하여 실시간으로 대리 응찰을 진행할 수 있습니다.</p>
                                </div>
                            </div>
                            <div>
                                <div class="img">
                                    <img src="/img/spongebob.png" >
                                </div>
                                <div>
                                    <h6>온라인 라이브 응찰</h6>
                                    <p>
                                        홈페이지에서 사전 신청하여 온라인 패들 번호를 부여받은 후, 경매 당일 온라인 라이브경매 페이지에서 경매 진행 상황을 모니터링하며 응찰 버튼을 눌러 응찰할 수 있습니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div> -->
                    
                    <div class="online-auc">
                        <h4>온라인 경매</h4>
                        <p>
                            원하시는 작품의 현재가를 확인 후 최고 응찰가를 선택하여 응찰할 수 있습니다. 동일한 응찰금액이 있을 경우, 먼저 접수된 응찰이 우선순위를 가집니다.
                        </p>
                        <div class="sub-box beware">
                            <p>
                                <img src="/img/precau-ico@1x.png" >
                                응찰 유의사항
                            </p>
                            <ul>
                                <li>
                                    <p>
                                        낙찰 시에는 낙찰대금 외에 <span>낙찰 수수료</span> (부가세 별도) 및 낙찰자 비용 (있을 경우)이 부과됩니다.
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        <span>모든 경매는 응찰 후에 취소가 불가능</span>합니다. 특히, 온라인 라이브 응찰은 응찰하기 버튼을 누르는 동시에 즉시 시스템에 반영되어 취소가 절대 불가능하므로 유의 바랍니다.
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        기타 응찰 시 유의사항은 <a href="#">경매 약관</a>과 <a href="#">온라인 경매 약관</a>을 참고 바랍니다.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="step3">
                    <strong>Step.3</strong>
                    <h2>낙찰 결과 확인 및 결제</h2>
                    <div class="bid-01">
                        <h4>낙찰 결과 확인</h4>
                        <p>
                            낙찰자는 원칙적으로 낙찰을 철회할 수 없습니다. 부득이 철회를 하는 경우, 낙찰자는 아트베이과 사전에 서면 합의를 해야하며 낙찰일로부터 7일 이내에 서면에 의한 경매취소 의사표시와 낙찰가의 30%에 해당하는 금액을 납부하여야 합니다.
                        </p>
                        <div class="sub-box online-fee">
                            <p>낙찰 수수료 안내</p>
                            <ul>
                                <li>
                                    <p>
                                        낙찰자는 경매 후 7일 이내에 총 구매대금을 당사로 지불하셔야 합니다.
                                    </p>
                                </li>
                                <p>총 구매 대금 = 낙찰대금 + 낙찰 수수료 + 기타 비용 (발생 시)</p>
                                <li>
                                    <p>온라인 경매의 경우 낙찰 수수료는 낙찰가 구간에 따라 차등 적용됩니다.</p>
                                </li>
                            </ul>
                            <table class="bidtableb2">
                                <thead>
                                    <tr>
                                        <th scope="col">구분</th>
                                        <th scope="col">낙찰가 (원)</th>
                                        <th scope="col">수수료율 (부가세 포함)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td rowspan="2">온라인 경매</td>
                                        <td>1천만원 이하</td>
                                        <td>낙찰가 x 19.8%</td>
                                    </tr>
                                    <tr>
                                        <td>1천만원 초과</td>
                                        <td>1,000만원 x 19.8% + ( 낙찰가 - 1,000만원 ) x 16.5%</td>
                                    </tr>
                                </tbody>
                            </table>
                            <p class="exam">
                                예) 낙찰가 1,500만원인 경우<br>
                                온라인 경매 낙찰 수수료 = 1,000만원 * 19.8% + (1,500만원 - 1,000만원) * 16.5%
                            </p>
                        </div>
                    </div>
                    <div class="bid-02">
                        <h4>결제</h4>
                        <p>
                            구매대금은 현금, 자기 앞 수표, 계좌이체 등으로 지급하실 수 있으며, 낙찰수수료에 한해서는 신용카드로 결제하실 수 있습니다.<br>(단, 신용카드 결제 시 당사를 직접 방문하셔야 가능합니다)
                        </p>
                        <div class="sub-box">
                            <p>입금 안내</p>
                            <ul>
                                <li>
                                    <p>
                                        입금 계좌번호 : <span>하나은행 196-910005-07305 (주)아트베이</span>
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        이체 시 낙찰자와 송금계좌 예금주가 다른 경우, 반드시 입금 통장 표시에 낙찰자명 기재 부탁드립니다.
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        입금 관련 문의: 02-3333-4567
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="step4">
                    <strong>Step.4</strong>
                    <h2>배송, 설치 및 보관</h2>
                <div class="dilivery-01">
                    <h4>배송</h4>
                    <p>
                        온라인 경매 낙찰작은 7일 이내 직접 픽업하시기 바랍니다. 만약, 픽업이 불가능한 경우 배송을 요청할 수 있으며, 배송비는 아래와 같이 부과됩니다.
                    </p>
                    <div class="sub-box">
                        <p class="tit">배송비</p>
                        <table class="bidtableb3">
                            <tbody>
                                <tr>
                                    <th colspan="2">국내</th>
                                    <th colspan="2">해외</th>
                                </tr>
                                <tr>
                                    <td style="width: 25%;">서울</td>
                                    <td style="width: 25%;">5만원</td>
                                    <td colspan="2" rowspan="3" style="width: 50%;">별도 배송비</td>
                                </tr>
                                <tr>
                                    <td>수도권</td>
                                    <td>10만원</td>
                                </tr>
                                <tr>
                                    <td>그 외 국내지역</td>
                                    <td>15만원</td>
                                </tr>
                            </tbody>
                        </table>
                        <p>동일 경매에서 1점 초과 낙찰 시, 1만원씩 추가 (단, 동일한 일시/장소인 경우에 한함)</p>
                        <p>예) 서울 지역 3점 낙찰 : 5만원+1만원+1만원 = 7만원</p>
                    </div>
                    <ul>
                        <li>
                            <div>
                            </div>
                            <p>일부 물품의 경우는 택배 발송이 가능하며, 배송비는 5천원 (단, 제주 및 도서 산간지역의 경우 1만원) 입니다.</p>
                        </li>
                        <li>
                            <div>
                            </div>
                            <p>무게나 가격대에 따라 택배가 불가할 수 있습니다.</p>
                        </li>
                        <li>
                            <div>
                            </div>
                            <p>고가의 작품은 직접 픽업이 원칙입니다.</p>
                        </li>
                        <li>
                            <div>
                            </div>
                            <p>직접 픽업하시는 경우, 원하시는 날짜 하루 전 담당자와 픽업 일을 예약해 주시기 바랍니다. (주말의 경우 금요일, 연휴의 경우 연휴 하루 전)</p>
                        </li>
                        <li>
                            <div>
                            </div>
                            <p>일반 승용차 기준, 작품 전체 크기 90*120cm까지 적재 가능하므로 픽업전, 차량의 공간과 작품 크기를 꼭 확인해 주시기 바랍니다.</p>
                        </li>
                        <li>
                            <div>
                            </div>
                            <p>픽업 가능 시간 :  월 ~ 일  10:30am ~ 12pm, 2pm ~ 6pm</p>
                        </li>
                        <li>
                            <div>
                            </div>
                            <p>사전 예약 없이 방문 시 픽업 불가</p>
                        </li>
                        <li>
                            <div>
                            </div>
                            <p>배송 문의 02-3333-8888</p>
                        </li>
                    </ul>
                </div>
                    <div class="dilivery-02">
                        <h4>설치</h4>
                        <p>당사 낙찰 작품에 한하여 배송 시 설치를 함께 요청하실 수 있으며, 사전 예약이 필요합니다.</p>
                        <div class="sub-box">
                            <p>
                                <img src="/img/precau-ico@1x.png">
                                설치 유의사항
                            </p>
                            <ul>
                                <li>
                                    <p>
                                        80호 미만은 점당 3만원(추가 점당 1만원), 80호 이상은 점당 10만원 (추가 점당 2만원)의 비용이 발생합니다.
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        대리석, 콘크리트, 가벽, 레일 등 현장 난이도에 따라 비용이 추가될 수 있습니다.
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        예약 없이 요청하시는 경우, 배송일정에 따라 바로 설치를 해드리기 어려울 수 있습니다.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="dilivery-02">
                        <h4>보관</h4>
                        <p>
                            낙찰된 작품은 7일 이내 수령이 원칙입니다. 7일 경과 후 미수령 작품에 대해서는 입금여부와 무관하게 점 당 일 30,000원의 비용이 발생합니다.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="bottom"></div>
</div>
<script>

    const selectedMenu = "";

    const howtobtn = $(".howtobtn");
    const howtobtnOffset = howtobtn.offset().top;
    const howromargin2 = $('.howtobtn').height();
    const howromargin3 = $(".bid-guide").outerHeight(true);

    $(window).ready(function () {
        if (selectedMenu !== "" && $("#menu_" + selectedMenu.toLowerCase()).length > 0) {
            $("#menu_" + selectedMenu.toLowerCase()).click();
        }
    });

    $(window).scroll(function () {
        const wScroll = $(this).scrollTop();

        if (wScroll >= a2contents.eq(0).offset().top * 0.8) {
            a2btn.removeClass("active");
            a2btn.eq(0).addClass("active");
        }

        if (wScroll >= a2contents.eq(1).offset().top * 0.85) {
            a2btn.eq(0).removeClass("active");
            a2btn.eq(1).addClass("active");
        }

        if (wScroll >= a2contents.eq(2).offset().top * 0.91) {
            a2btn.eq(1).removeClass("active");
            a2btn.eq(2).addClass("active");
        }

        if (wScroll >= a2contents.eq(3).offset().top * 0.94) {
            a2btn.eq(2).removeClass("active");
            a2btn.eq(3).addClass("active");
        }

      /*   if (wScroll >= a2contents.eq(4).offset().top * 0.96) {
            a2btn.eq(3).removeClass("active");
            a2btn.eq(4).addClass("active");
        } */

        if (matchMedia("screen and (min-width: 1275px)").matches) {
            if (wScroll > howtobtnOffset) {
                howtobtn.addClass("fixed");
                $(".howto-desc").addClass("fixed");
            } else {
                howtobtn.removeClass("fixed");
                $(".howto-desc").removeClass("fixed");
            }

            if (wScroll > $(".bottom").offset().top * 0.91) {
                howtobtn.removeClass("fixed");
                $(".howto-desc").removeClass("fixed");
                howtobtn.css("margin-top", howromargin3 - howromargin2 + 90 + "px");
            } else {
                howtobtn.css("margin-top", "0px");
            }
        } else {
            howtobtn.removeClass("fixed");
            $(".howto-desc").removeClass("fixed");
        }
    });

    $('.a1 > li').click(function () {
        document.location.href = $(this).parents().parents().prev().attr('href');
    });

    $('.a3 > li').click(function () {
        document.location.href = $(this).parents().parents().prev().attr('href');
    });

    $(".howtobtn > ul > li > div").hide();
    $(".howtobtn > ul > li").eq(1).find('div').show(500);

    $(window).resize(function () {
        if (matchMedia("screen and (max-width: 1275px)").matches) {
            $('.a1').css('display', 'none');
            $('.a3').css('display', 'none');
        } else {
            $('.a1').css('display', 'block');
            $('.a3').css('display', 'block');
        }
    });

    const a2btn = $(".a2 > li");
    const a2btn1 = $(".a2 > li:first-child");
    const a2btn2 = $(".a2 > li:nth-child(2)");
    const a2btn3 = $(".a2 > li:nth-child(3)");
    const a2btn4 = $(".a2 > li:nth-child(4)");
    const a2btn5 = $(".a2 > li:last-child");
    const a2contents = $(".bid-guide > div");

    a2btn1.click(function () {
        const a2sec1 = $(a2contents.eq(0));
        const a2offset1 = a2sec1.offset().top * 0.93;
        $("html, body").animate({ scrollTop: a2offset1 }, 700, "swing");
    });

    a2btn2.click(function () {
        const a2sec2 = $(a2contents.eq(1));
        const a2offset2 = a2sec2.offset().top * 0.97;
        $("html, body").animate({ scrollTop: a2offset2 }, 750, "swing");
    });

    a2btn3.click(function () {
        const a2sec3 = $(a2contents.eq(2));
        const a2offset3 = a2sec3.offset().top * 0.97;
        $("html, body").animate({ scrollTop: a2offset3 }, 600, "swing");
    });

    a2btn4.click(function () {
        const a2sec4 = $(a2contents.eq(3));
        const a2offset4 = a2sec4.offset().top * 0.98;
        $("html, body").animate({ scrollTop: a2offset4 }, 850, "swing");
    });

    a2btn5.click(function () {
        const a2sec5 = $(a2contents.eq(4));
        const a2offset5 = a2sec5.offset().top * 0.998;
        $("html, body").animate({ scrollTop: a2offset5 }, 800, "swing");
    });

</script>

<script src="../js/howto.js"></script>
</body>
</html>