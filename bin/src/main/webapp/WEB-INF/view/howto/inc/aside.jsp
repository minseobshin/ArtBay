<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/guide_side.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<div id="Howto">
        <div class="howtobtn">
            <ul>
                <li>
                    <a href="/howtoHowto">경매 소개</a>
                     <div class="howto-subbtn">
	                    <ul>
		                    <li><a href="/howtoHowto#top">라이브 경매</a></li>
		                    <li><a href="/howtoHowto#bottom">온라인 경매</a></li>
	               		</ul>
	               	</div>
                </li>
                <li>
                    <a href="/howtoBidIntro">응찰 안내</a>
                    <div class="howto-subbtn">
                        <ul class="a2" >
                            <li><a href="/howtoBidIntro#b1">회원 가입</a></li>
                            <li><a href="/howtoBidIntro#b2">프리뷰</a></li>
                            <li><a href="/howtoBidIntro#b3">응찰</a></li>
                            <li><a href="/howtoBidIntro#b4">낙찰 결과 확인 및 결제</a></li>
                            <li><a href="/howtoBidIntro#b5">배송, 설치 및 보관</a></li>
                        </ul>
                    </div>
                </li>
                <li class="active">
                    <a href="/howtoConsignGuide">위탁 안내</a>
                    <div class="howto-subbtn">
                        <ul class="a3">
                            <li class="active"><a href="/howtoConsignGuide#intro">Why K Auction?</a></li>
                            <li><a id="menu_consign" href="/howtoConsignGuide#consignGuide">위탁 절차</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
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

        if (wScroll >= a2contents.eq(4).offset().top * 0.96) {
            a2btn.eq(3).removeClass("active");
            a2btn.eq(4).addClass("active");
        }

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