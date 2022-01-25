<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href="./css/application2.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>


<div class = "applyform">
	<h1>위탁안내</h1>
</div>
<div class="container">
    <div id="Howto">
        <div class="howtobtn" style="margin-top: 0px;">
            <ul>
                <li>
                    <a href="howtoHowtotest">경매 소개</a>
                    <div class="howto-subbtn">
                        <ul class="a1">
                            <li><a href="#">경매 취지</a></li>
                            <li><a href="#">온라인 경매</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="howtoBidIntrotest">응찰 안내</a>
                    <div class="howto-subbtn" >
                        <ul class="a2" >
                            <li><a href="#">회원 가입</a></li>
                            <!-- <li><a href="#">프리뷰</a></li> -->
                            <li><a href="#">응찰</a></li>
                            <li><a href="#">낙찰 결과 확인 및 결제</a></li>
                            <li><a href="#">배송, 설치 및 보관</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="howtoConsignGuidetest">위탁 안내</a>
                    <div class="howto-subbtn" >
                        <ul class="a3">
                            <li><a href="#">Why Art Bay?</a></li>
                            <li><a href="#">위탁 절차</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <div class="howto-desc" style="margin-top: 0px;">
            <div class="cos-guide">
                <div class="cosguide-01" id="step1">
                    <h2>Why Artbay?</h2>
                    <p>소장하신 예술품의 가치를 아트베이에서 확인하세요! 온라인 취미/예술품 경매 회사 아트베이가 작품 위탁을 도와드리겠습니다.</p>
                    <div>
                        <div class="img">
                            <img src="./img/calendar.jfif">
                        </div>
                        <div class="cont">
                            <h3>다양한 경매 플랫폼, 365일 경매 진행</h3>
                            <p>365일 언제나 참여할 수 있는 다양한 경매 플랫폼이 구축되어 있습니다.</p>
                        </div>
                    </div>
                    <div>
                        <div class="img">
                            <img src="./img/expert.png">
                        </div>
                        <div class="cont">
                            <h3>낮은 진입장벽</h3>
                            <p>일반인이나 아마추어들의 작품을 취급하기 때문에 누구나 쉽게 접근할 수 있습니다.</p>
                        </div>
                    </div>
                    <div>
                        <div class="img">
                            <img src="./img/marketing.jfif">
                        </div>
                        <div class="cont">
                            <h3>다양한 경매 플랫폼, 365일 경매 진행</h3>
                            <p>못할 풀밭에 위하여 이것이야말로 인생의 부패를 몸이 얼음에 얼마나 봄바람이다. 없으면, 장식하는 얼마나 실현에 찾아다녀도, 같은 피어나기 꾸며 것이다. 뛰노는 같지 피가 대고,  찾아 청춘 싶이 무엇을 아니다. 싹이 이 인간의 있을 힘차게 열매를 것이다. 위하여 피어나기 때까지 만천하의 끓는 교향악이다.</p>
                        </div>
                    </div>
                    
                </div>
                <div class="cosguide-02" id="step2">
                    <h2>위탁절차</h2>
                    <div class="cosproce-btn">
                        <ul>
                            <li class="active">
                                <strong>Step.1</strong>
                                <p>작품 문의</p>
                            </li>
                            <li>
                                <strong>Step.2</strong>
                                <p>위탁 상담 및 출고</p>
                            </li>
                            <li>
                                <strong>Step.3</strong>
                                <p>출품 및 전시</p>
                            </li>
                            <li>
                                <strong>Step.4</strong>
                                <p>대금 정산</p>
                            </li>
                        </ul>
                    </div>
                    <div class="cosproce-desc">
                        <div class="desc01">
                            <p>
                                소장하고 계신 있는 근현대 미술품, 해외 작품, 공예품, 쥬얼리 그 외의 각종 희귀자료나 물품 등의 경매 출품 가능 여부와 대략적인 가격에 대한 <span>상담을 원하시면 아래의 절차대로 진행해 주세요.</span>
                            </p>
                            <div class="desc01-sub">
                                <div>
                                    <h6>01. 홈페이지</h6>
                                    <p>
                                        아트베이 홈페이지의 문의사항에 문의를 해주시면 빠르게 도와드리겠습니다.
                                    </p>
                                </div>
                                <div>
                                    <h6>02. 이메일</h6>
                                    <p>
                                        <span>art@art-bay.com</span>으로 아래 항목을 포함하여 문의주세요.
                                    </p>
                                    <p>
                                        -  메일 제목에 ‘작품위탁’과 성명 기입 ※ 예시) 작품위탁_홍길동
                                    </p>
                                    <p>
                                        - 내용은 의뢰인의 <span>성명, 연락처, 작가 이름, 작품 제목, 사이즈/재료/제작연도, 소장 경위, 작품 사진</span> (전체 이미지, 서명 등 중요 부분 이미지)을 포함
                                    </p>
                                </div>
                                <div>
                                    <h6>03. 우편</h6>
                                    <p>
                                        아래의 주소로 위 이메일 요청 시와 같은 정보를 보내 주세요. 우편으로 접수된 사진은 반송되지 않습니다.
                                    </p>
                                    <p>
                                        <span>
                                            서울특별시 관악구 남부순환로 1822 서울대입구역
                                        </span>
                                    </p>
                                </div>
                            </div>
                            <div class="bot-desc">
                                <ul>
                                    <li>
                                        <div>
                                            <span>•</span>
                                        </div>
                                        <p>접수된 문의 내역은 분야별 스페셜리스트들의 내부 심사를 거친 후, 접수일로부터 7일 이내 담당자를 통해 개별적으로 연락을 드립니다.</p>
                                    </li>
                                    <li>
                                        <div>
                                            <span>•</span>
                                        </div>
                                        <p>소장하고 계신 물품에 관하여 판매 제한 사유(리세일 금지 약정 등)가 있는지 위탁 문의/신청 전에 확인 부탁드립니다. 고객님께서 물품을 위탁하시는 경우, 해당 물품에 관하여 제한 없이 소유권을 이전할 수 있다는 점을 스스로 진술/보증할 의무가 있습니다.</p>
                                    </li>
                                </ul>
                            </div>
                            <div class="cos-inquire-btn">
                                <!-- <a href="javascript:$.loginUtils.redirectCheck('/MyPage/ConsignRequest', '위탁 문의는 로그인이 필요합니다.');">위탁문의</a> -->
                                <a href="#">위탁문의</a>
                            </div>
                        </div>
                        <div class="desc02">
                            <p>출품이 가능한 경우, 아래와 같은 절차로 위탁이 진행됩니다.</p>
                            <div class="desc02-sub">
                                <div>
                                    <div class="desc02-icon">
                                        <img src="/img/desc02-icon@1x.png">
                                        <p>01. 담당자 배정</p>
                                    </div>
                                    <img src="/img/desc02arrow-ico@1x.png">
                                </div>
                                <div>
                                    <div class="desc02-icon">
                                        <img src="/img/desc02-icon02@1x.png">
                                        <p>02. 서면 심의 및 내부 감정</p>
                                    </div>
                                    <img src="/img/desc02arrow-ico@1x.png">
                                </div>
                                <div>
                                    <div class="desc02-icon">
                                        <img src="/img/desc02-icon03@1x.png">
                                        <p>03. 출품 희망가격 결정</p>
                                    </div>
                                    <img src="/img/desc02arrow-ico@1x.png">
                                </div>
                                <div>
                                    <div class="desc02-icon">
                                        <img src="/img/desc02-icon04@1x.png">
                                        <p>04. 위탁계약서 작성 및 계약</p>
                                    </div>
                                </div>
                            </div>
                            <ul>
                                <li>
                                    <p>경매 불가 작품은 의뢰인에게 다시 보내드립니다. (운송비 의뢰인 부담, 방문 회수 시 제외)</p>
                                </li>
                                <li>
                                    <p>작품의 내정가는 의뢰자와 합의 하에 결정되며, 합의가 되지 않을 경우 출품되지 않습니다.</p>
                                </li>
                            </ul>
                            <div class="cos-inquire-btn">
                                 <a href="#">위탁문의</a>
                            </div>
                        </div>
                        <div class="desc03">
                            <p>
                                위탁 절차가 끝난 작품은 적합한 경매에 출품되며, 경매 프리뷰 기간 동안 높은 가격에 판매될 수 있도록 전시와 다양한 홍보 활동이 이루어집니다.
                            </p>
                            <div class="desc03-sub">
                                <ul>
                                    <li>
                                        <img src="/img/cos-offline@1x.png">
                                        <h5>오프라인 전시</h5>
                                        <p>서울 아트베이 전시장</p>
                                    </li>
                                    <li>
                                        <img src="/img/cos-online@1x.png">
                                        <h5>온라인 전시</h5>
                                        <p>아트베이 홈페이지</p>
                                    </li>
                                    <li>
                                        <img src="/img/cos-channel@1x.png">
                                        <h5>홍보 채널</h5>
                                        <p>일간지 및 방송사, 아트베이 블로그,<br>인스타그램, 카카오 채널, 페이스북 등 SNS 채널</p>
                                    </li>
                                </ul>
                            </div>
                            <div class="cos-inquire-btn">
                                 <a href="#">위탁문의</a>
                            </div>
                        </div>
                        <div class="desc04">
                            <div>
                                <h4><span></span>위탁 대금</h4>
                                <p>낙찰 결과는 경매 마감 후 위탁자에게 안내드리며, 위탁대금은 낙찰자의 낙찰금액 정산 후 위탁자에게 지급됩니다.</p>
                                <div>
                                    <p><strong>위탁 대금 = 낙찰금액 - 위탁 수수료 - 기타 비용</strong> (발생할 경우)</p>
                                </div>
                            </div>
                            <div>
                                <ul>
                                    <li>
                                        <p>경매 불가 작품은 의뢰인에게 다시 보내드립니다. (운송비 의뢰인 부담, 방문 회수 시 제외)</p>
                                    </li>
                                    <li>
                                        <p>작품의 내정가는 의뢰자와 합의하에 결정되며, 합의가 되지 않을 경우 출품되지 않습니다.</p>
                                    </li>
                                </ul>
                            </div>
                        	<div class="cos-inquire-btn">
                                 <a href="#">위탁문의</a>
                            </div>
                        </div>
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
const howromargin4 = $(".cosguide-01").outerHeight(true);

$(window).ready(function () {
    if (selectedMenu !== "" && $("#menu_" + selectedMenu.toLowerCase()).length > 0) {
        $("#menu_" + selectedMenu.toLowerCase()).click();
    }
});

$(window).scroll(function () {
    const wScroll = $(this).scrollTop();

    if (wScroll >= a3contents.eq(0).offset().top * 0.7) {
        a3btn.removeClass("active");
        a3btn.eq(0).addClass("active");
    }
    if (wScroll >= a3contents.eq(1).offset().top * 0.94) {
        a3btn.removeClass("active");
        a3btn.eq(1).addClass("active");
    }

    if (matchMedia("screen and (min-width: 1275px)").matches) {
        if (wScroll > howtobtnOffset) {
            howtobtn.addClass("fixed");
            $(".howto-desc").addClass("fixed");
        } else {
            howtobtn.removeClass("fixed");
            $(".howto-desc").removeClass("fixed");
        }

        if (wScroll > $(".bottom").offset().top * 0.82) {
            howtobtn.removeClass("fixed");
            $(".howto-desc").removeClass("fixed");
            howtobtn.css("margin-top", howromargin4 - howromargin2 + 900 + "px");

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
$('.a2 > li').click(function () {
    document.location.href = $(this).parents().parents().prev().attr('href');
});

$(".howtobtn > ul > li > div").hide();
$(".howtobtn > ul > li").eq(2).find('div').show(500);

$(window).resize(function () {
    if (matchMedia("screen and (max-width: 1275px)").matches) {
        $('.a1').css('display', 'none');
        $('.a2').css('display', 'none');
    } else {
        $('.a1').css('display', 'block');
        $('.a2').css('display', 'block');
    }
});

const a3btn = $('.a3 > li');
const a3btn1 = $('.a3 > li:first-child');
const a3btn2 = $('.a3 > li:last-child');
const a3contents = $(".cos-guide > div");

a3btn1.click(function (e) {
    e.preventDefalt;
    const a3sec1 = $(a3contents.eq(0));
    const a3secoffset1 = a3sec1.offset().top * 0.9;
    $("html, body").animate({ scrollTop: a3secoffset1 }, 800, "swing");
});

a3btn2.click(function (e) {
    e.preventDefalt;
    const a3sec2 = $(a3contents.eq(1));
    const a3secoffset2 = a3sec2.offset().top;
    $("html, body").animate({ scrollTop: a3secoffset2 }, 800, "swing");
});

</script>

<script type="text/javascript" src="./js/howto.js"></script>
</body>
</html>