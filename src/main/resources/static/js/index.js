$(function() {
	//메인 비주얼	
	setMainVisual();	
	
	//메인 배너
	setMainBanner();
	
	//맨위/맨아래 이동
	goTopBottom();
});

//메인 비주얼
function setMainVisual() {
	var w = $(window).width();
	var h;
	var total = $(".keyvisual_inner li").length;	//이미지 3개
	
	//초기값 세팅
	var current = 0;
	var distance = new Array();
	$(".key_control li").eq(current).addClass("active");
	
	for(var i=0; i<total; i++) {	//0 ~ 2
		distance.push(i*w);
	}
	
	//링크방지
	$(".keyvisual a, .key_control a").click(function(e) {
		e.preventDefault();				
	});
	
	//윈도우 크기 변경시 메인 비주얼 크기변경
	$(window).resize(function() {
		setTimeout(function() {
			w = $(window).width();
			h = $(".keyvisual_inner img").height();
				
			$(".keyvisual li").animate({width: w}, 0);
			$(".keyvisual").animate({height: h}, 0);
			
			distance = new Array();
			
			for(var i=0; i<total; i++) {	//0 ~ 2
				distance.push(i*w);
			}			
		}, 100);
	});
	$(window).trigger("resize");
	
	var interval = setInterval(rightMoving, 2500);
	
	function rightMoving() {
		$(".keyvisual li:first").clone().appendTo(".keyvisual ul");	//첫번째 이미지 복사해서 마지막에 추가
		$(".keyvisual ul").stop().animate( {marginLeft : "-=" + w + "px"}, 0 , function() {	//이미지 크기만큼 이동
			//첫번째 이미지 삭제
			$(".keyvisual ul").css( {marginLeft : "+=" + w + "px"} );				
			$(".keyvisual li:first").remove();			
		});
						
		if(current < total-1) {
			current++;
		} else {
			current = 0;
		}
		$(".key_control li").removeClass("active");
		$(".key_control li").eq(current).addClass("active");
			
		var arrayData = distance.pop();
		distance.unshift(arrayData);
	}
	
	function leftMoving() {
		$(".keyvisual li:last").clone().prependTo(".keyvisual ul");	//마지막 이미지 복사해서 맨앞에 추가
		
		$(".keyvisual ul").stop().animate( {marginLeft : "-=" + w + "px"}, 0, function() {
			//마지막 이미지 삭제
			$(".keyvisual ul").css( {marginLeft : "+=" + w + "px"} );
			$(".keyvisual li:last").remove();			
		});
				
		if(current > 0) {
			current--;
		} else {
			current = total-1;
		}
		$(".key_control li").removeClass("active");
		$(".key_control li").eq(current).addClass("active");
		
		var arrayData = distance.shift();
		distance.push(arrayData);
	}
	
	//마우스 올리면 정지 / 마우스 나가면 재생
	$(".key_control li, .control_btn .prev, .control_btn .next").hover(
		function() {
			clearInterval(interval);
		},
		function() {
			interval = setInterval(rightMoving, 2500);
		}
	);
	
	//버튼 < 클릭
	$(".control_btn .prev").click(function() {
		rightMoving();
	});	
	
	//버튼 > 클릭
	$(".control_btn .next").click(function() {
		leftMoving();
	});	
	
	//키 컨트롤 클릭
	$(".key_control li").click(function() {
		$(".key_control li").removeClass("active");
		$(this).addClass("active");
		
		var i = $(this).index();	//0 ~ 2
		var x = (-1)*distance[i];
		$(".keyvisual ul").stop().animate({marginLeft : x + "px"}, 300);
	});
}

//메인 배너
function setMainBanner() {
	var current = 0; 		//0 ~ 2 (div 3개)	
	var interval = setInterval(change, 5000);	//5초에 한번씩 배너 바꾸기
		
	//초기값 세팅
	$("#control" + current).addClass("on");
	
	//배너 바꾸기
	function change() {
		if(current == 2) {
			current = 0;
		} else {
			current++;
		}
		$("#control a").removeClass("on");
		$("#control"+current).addClass("on");		
		$(".moving div").css({display : "none"});
		$(".moving .banner"+current).css({display : "block"});
	}
	
	//이미지 순번 클릭
	$("#control a").each(function() {	
		$(this).hover(
			function() {	//마우스 올렸을 때
				clearInterval(interval);
			},
			function() {	//마우스 떼었을 때
				interval = setInterval(change, 5000);
			}
		);
		$(this).click(function(e) {	//마우스 클릭했을 때
			e.preventDefault(); 
			var index = $(this).parent("li").index();
			current = index;
			
			$("#control a").removeClass("on");
			$("#control"+current).addClass("on");		
			$(".moving div").css({display : "none"});
			$(".moving .banner"+current).css({display : "block"});
		});
	});
}

//맨위 / 맨아래로 이동 버튼
function goTopBottom() {
	$("#topBtn").click(function() {
        $("html").animate({scrollTop : 0}, 1000);
    });
 
    $("#bottomBtn").click(function() {
        $("html").animate({scrollTop : ($('footer').offset().top)}, 1000);
    });
}
