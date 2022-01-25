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
	<h1>경매소개</h1>
</div>

<div class="container">
    <div id="Howto">
        <div class="howtobtn ">
            <ul>
                <li class="">
                    <a href="howtoHowtotest">경매 소개</a>
                    <div class="howto-subbtn" >
                        <ul class="a1">
                            <li class=""><a href="#">경매 취지</a></li>
                            <li class=""><a href="#">온라인 경매</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="howtoBidIntrotest">응찰 안내</a>
                    <div class="howto-subbtn" style="display: none;">
                        <ul class="a2">
                            <li><a href="#b1">회원 가입</a></li>
                            <li><a href="#b2">프리뷰</a></li>
                            <li><a href="#b3">응찰</a></li>
                            <li><a href="#b4">낙찰 결과 확인 및 결제</a></li>
                            <li><a href="#b5">배송, 설치 및 보관</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="howtoConsignGuidetest">위탁 안내</a>
                    <div class="howto-subbtn" style="display: none;">
                        <ul class="a3" >
                            <li><a href="/ConsignGuide">Why Art Bay?</a></li>
                            <li><a href="/ConsignGuide">위탁 절차</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <div class="howto-desc " style="margin-top: 0px;">
            <div class="auc-intro">
            <div id="top">
                    <h2>경매 취지</h2>
                    <p>모든 사람들이 쉽게 좋은 퀄리티의 작품들을 착한 가격에 사고팔 수 있게 하기 위해 ArtBay 를 만들었습니다.</p>
                    <div>
                        <div class="auc-img01">
                            <img src="/img/img1.png" >
                        </div>
                        <div class="auc-desc">
                            <h4>
                                경매
                                <img src="/img/online-ico@1x.png" >
                            </h4>
                            <p>
                            	
                            </p>
                        </div>
                    </div>
                </div>
                <div id="bottom">
                    <h2>온라인 경매</h2>
                    <p>
                        온라인 경매는 아마추어의 미술품 경매와 합리적인 가격대의 작품을 선보입니다.<br>홈페이지에서 응찰이 가능하며 시공간 제약 없이 누구나 쉽게 미술품 경매에 참여할 수 있습니다.
                    </p>
                    
                    
                    <div>
                        <div>
                            <div class="img">
                                <img src="/img/aucimg.jpg">
                            </div>
                            <div>
                                <h4>
                                    온라인경매
                                    <img src="/img/online-ico@1x.png">
                                </h4>
                                <p class="desc">
                                    온라인 경매는 미술품 경매의 턱을 낮추어 누구나 쉽게 작품을 구입할 수 있는 기회를 제공합니다.
                                </p>
                                <p class="date">
                                    매주 월요일 시작 ~ 금주 금요일 마감 (1주 간격)
                                </p>
                                    <p class="check">
                                        <a href="bidList">진행 중인 경매의 출품작 확인하기 →</a>
                                    </p>
                            </div>
                        </div>
                        <div>
                            <div class="img">
                                <img src="/img/aucimg.jpg">
                            </div>
                            <div>
                                <h4>
                                    온라인경매 결과
                                    <img src="/img/online-ico@1x.png" >
                                </h4>
                                <p class="desc">
                                    경매가 끝난 작품들을 확인할수있습니다. 
                                </p>
                                <p class="date">
                                    매주 월요일 시작 ~ 금주 일요일 마감 (1주 간격) 결과
                                </p>
                                    <p class="check">
                                        <a href="bidResult">경매의 출품작 결과 확인하기 →</a>
                                    </p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div id="sns">
                    <p class="sns-tit">
                        <img src="/img/cal-ico@1x.png" alt="경매 일정 아이콘" >
                        경매 일정 확인?
                    </p>
                    <p class="sns-desc">
                        경매에 대한 일정들은 SNS을 통해 확인하실 수 있습니다.
                    </p>
                    <ul>
                        <li class="active">
                            <img src="/img/instagram.png" alt="인스타그램">
                            <a href="#">인스타그램</a>
                        </li>
                        <li>
                            <img src="/img/blog.png" alt="네이버 블로그">
                            <a href="#">네이버 블로그</a>
                        </li>
                        <li>
                            <img src="/img/plusfriendlogo.png" alt="카카오 플러스친구">
                            <a href="#">카카오 플러스친구</a>
                        </li>
                        <li>
                            <img src="/img/facebook.png" alt="페이스북 페이지">
                            <a href="#">페이스북 페이지</a>
                        </li>
                    </ul>
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
	const howromargin1 = $(".auc-intro").outerHeight(true);
	const howromargin2 = $('.howtobtn').height();
	
	$(window).ready(function() {
	    if (selectedMenu !== "" && $("#menu_" + selectedMenu.toLowerCase()).length > 0) {
	        $("#menu_" + selectedMenu.toLowerCase()).click();
	    }
	});
	
	$(window).scroll(function () {
	    const wScroll = $(this).scrollTop();
	    if (wScroll >= a1contents.eq(0).offset().top) {
	        nav.removeClass("active");
	        nav.eq(0).addClass("active");
	    }
	    if (wScroll >= a1contents.eq(1).offset().top * 0.9) {
	        nav.removeClass("active");
	        nav.eq(1).addClass("active");
	    }
	    if (matchMedia("screen and (min-width: 1275px)").matches) {
	        if (wScroll > howtobtnOffset) {
	            howtobtn.addClass("fixed");
	            $(".howto-desc").addClass("fixed");
	        } else {
	            howtobtn.removeClass("fixed");
	            $(".howto-desc").removeClass("fixed");
	        }
	
	        if (wScroll > $(".bottom").offset().top * 0.8) {
	            howtobtn.removeClass("fixed");
	            $(".howto-desc").removeClass("fixed");
	            howtobtn.css("margin-top", howromargin1 - howromargin2 + 200 + "px");
	
	        } else {
	            howtobtn.css("margin-top", "0px");
	        }
	    } else {
	        howtobtn.removeClass("fixed");
	        $(".howto-desc").removeClass("fixed");
	    }
	});
	
	$('.a2 > li').click(function () {
	    document.location.href = $(this).parents().parents().prev().attr('href');
	});
	$('.a3 > li').click(function () {
	    document.location.href = $(this).parents().parents().prev().attr('href');
	});
	$(".howtobtn > ul > li > div").hide();
	$(".howtobtn > ul > li").eq(0).find('div').show(500);
	
	$(window).resize(function () {
	    if (matchMedia("screen and (max-width: 1275px)").matches) {
	        $('.a2').css('display', 'none');
	        $('.a3').css('display', 'none');
	    } else {
	        $('.a2').css('display', 'block');
	        $('.a3').css('display', 'block');
	    }
	});
	
	const nav = $(".a1 > li");
	const nav1 = $(".a1 > li:first-child");
	const nav2 = $(".a1 > li:last-child");
	const a1contents = $(".auc-intro > div");
	
	nav1.click(function () {
	    const section = $(a1contents.eq(0));
	    const offset = section.offset().top * 0.93;
	    $("html, body").animate({ scrollTop: offset }, 600, "swing");
	});
	
	nav2.click(function () {
	    const section2 = $(a1contents.eq(1));
	    const offset2 = section2.offset().top * 0.95;
	    $("html, body").animate({ scrollTop: offset2 }, 500, "swing");
	});

</script>

<script type="text/javascript" src="./js/howto.js"></script>
</body>
</html>