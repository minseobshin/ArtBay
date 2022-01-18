/**
 * 
 */
/*
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
*/


//howto 버튼 고정 스크립트
const howtoffset = $("#Howto").offset().top*0.89;
$(window).scroll(function(){
const wScroll = $(this).scrollTop();
    if (matchMedia("screen and (max-width: 1275px)").matches){
        if(wScroll > howtoffset){
            $(".howtobtn").addClass('pos');
            $("#Howto > .howto-desc").css({"margin-top":"95px"});
        }else{
            $(".howtobtn").removeClass('pos');
            $("#Howto > .howto-desc").css({"margin-top":"0px"});
        }
    } else {
        $(".howtobtn").removeClass('pos');
        $("#Howto > .howto-desc").css({"margin-top":"0px"});
    }
});


//위탁절차 탭메뉴
const cosproceBtn = $(".cosproce-btn > ul > li");
const cosproceCont = $(".cosproce-desc > div");      
cosproceCont.hide().eq(0).show();
cosproceBtn.click(function(e){
    e.preventDefault();
    const target = $(this);
    const index = target.index();
    cosproceBtn.removeClass("active");
    target.addClass("active");
    cosproceCont.css("display","none");
    cosproceCont.eq(index).css("display","block");
});

