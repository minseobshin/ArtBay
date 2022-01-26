/**
 * 2021-01. 곽은정
 */
function artbay(){}

//목록에서 작품 클릭 시 작품 상세 조회 페이지로 전환
artbay.view = function(lot){
	$frm = $("#frm_list")[0];
	$frm.lot.value = lot;
	$param = $("#frm_list").serialize();
	$.ajax({
		url: "/bidView",
		cache: false,
		type: "POST",
		data: $param,
		success: function(){
			window.location.href = "bidView?lot="+lot+"&nowPage="+$frm.nowPage.value;
		}
	})
}


//목록에서 페이지 전환
artbay.page = function(nowPage){
	$frm = $("#frm_list")[0];
	$frm.nowPage.value = nowPage;
	$frm.action = "bidList";
	$frm.submit();
}

//작품 상세 조회 하단에서 작가의 다른 작품 이미지 클릭 시 클릭한 작품 상세 조회 화면으로 페이지 전환
artbay.othersView = function(lot){
	$frm = $("#frm_view")[0];
	$("#othersLot").val(lot);
	$param = $("#frm_view").serialize();
	$.ajax({
		cache: false,
		type: "POST",
		data: $param,
		success: function(){
			window.location.href = "bidView?lot="+lot+"&nowPage="+$frm.nowPage.value;
		}
	})
}


//목록에서 카테고리별 작품 조회
function category(ctgr){	
	$frm = $("#frm_list")[0];
	$frm.findStr.value=ctgr;
	$param = $("#frm_list").serialize();
	const cnt = $(".page_combo2").val();
	$.ajax({
		url: "/bidList?cnt="+cnt,
		type: "POST",
		cache: false,
		async: true,
		data: $param,
		success: function(){
			search();
		}
	})
}

//즉시 구매
function directPurchase(){
	modalOn($('.direct_caution'));
	$param = $("#frm_view").serialize();
	$(".btnDirectApply").on("click", function(){
		$.ajax({
			url: "/bidDirect",
			type: "POST",
			cache: false,
			async: true,
			data: $param,
			success: function(){
				$(".bid_caution").css("display", "none");
				$(".applyResult").css("display", "block");
			}
		})
	})

}

//목록에서 작품명 또는 작가명으로 작품 검색
function search(){
	$frm = $("#frm_list")[0];
	$param = $("#frm_list").serialize();
	const sort = $(".page_combo1").val();
	const cnt = $(".page_combo2").val();
	const findStr = $("#findStr").val();
	$frm.action="/bidList";
	$frm.submit();
}

/* 원본 지킴이
function search(){
	$frm = $("#frm_list")[0];
	$param = $("#frm_list").serialize();
	const sort = $(".page_combo1").val();
	const cnt = $(".page_combo2").val();
	const findStr = $("#findStr").val()
	$.post({
		url: "/bidList",
		data: $param,
		type: "POST",
		cache: false,
		async: true,
		success: function(){
			window.location.href = "/bidList?cnt="+cnt+"&findStr="+$frm.findStr.value+"&nowPage="+$frm.nowPage.value+"&sort="+sort;
			if(findStr=="") {
				$(".selected_option_area").hide();
				$(".idle_selected_option_area").show();
			}
			$(this).parent().parent().parent().hide();
			var findStrAttach = $(`<div><span style="margin: 0;"> ${findStr} </span> <input class="btnSearchX" type="button" value="X" style="border: none; background-color: transparent;" /></div>`);
			$("#selected_findStr").html(findStrAttach);
		}
	})
}
*/

/*
function off(){
	//모달을 띄웠을 때 반투명 바탕을 눌렀을 때 모달이 사라지도록
	$(window).on("click", function(event) {
		console.log(event.target.class)
		if (event.target.class != "thumbnailHiddenDiv") {
          $(".thumbnailHidden").hide();
       }
    });
}
*/

 $(function(){
	switch($("#findStr").val()){
		case "":
		$.ajax({
			success:function(){
				$("#navAll").addClass("orangeLi");
				$("#navPaint").removeClass("orangeLi");
				$("#navPottery").removeClass("orangeLi");
				$(".selected_option_area").hide();
				$(".idle_selected_option_area").show();
			}
		})
		break;
		
		case "paint":
		$.ajax({
			success: function(){
				$("#navAll").removeClass("orangeLi");
				$("#navPaint").addClass("orangeLi");
				$("#navPottery").removeClass("orangeLi");
				$(".selected_option_area").hide();
				$(".idle_selected_option_area").show();
			}
		})
		$("#findStr").val("");
		break;
		
		
		case "pottery":
		$.ajax({
			success: function(){
				$("#navAll").removeClass("orangeLi");
				$("#navPaint").removeClass("orangeLi");
				$("#navPottery").addClass("orangeLi");
				$(".selected_option_area").hide();
				$(".idle_selected_option_area").show();
			}
		})
		$("#findStr").val("");
		break;	
	}
	
	//상세 조회 화면에서 최종 동의 및 응찰 버튼 클릭하면 응찰하도록
	$(".btnBidApply").on("click", function(){
		$frm = $("#frm_view")[0];
		$param = $("#frm_view").serialize();
		$.post({
		url: "/bidApplied",
		data: $param,
		type: "POST",
		cache: false,
		async: true,
		success: function(){
			$(".bid_caution").css("display", "none");
			$(".applyResult").css("display", "block");
			}
		})	
	})
	
	
	//응찰하기에서 전체를 누르면 전체 내역, 내 응찰을 누르면 내 응찰 내역 확인
	$(".bidHistoryAll").on("click", function(){
		$(".bidHistory").css("display", "block");
		$(".bidHistoryAll").css("font-weight", "bolder");
		$(".bidHistoryMy").css("font-weight", "normal");
		$(".bidMyHistory").css("display", "none");
	});
	$(".bidHistoryMy").on("click", function(){
		$(".bidHistory").css("display", "none");
		$(".bidHistoryAll").css("font-weight", "normal");
		$(".bidHistoryMy").css("font-weight", "bolder");
		$(".bidMyHistory").css("display", "block");			

	});
	
	//상세 조회 화면 : 작품의 전체 응찰 기록 조회
	if($(".btnSearchX")){
	$.ajax({
			url:"/bidList",
			success: $(".btnSearchX").on("click", function(){
				$("#findStr").val("")
				window.location.href = "/bidList";
				$(this).parent().parent().parent().remove();
				$("#selected_findStr").html("");
		})
		})
	}
	
	//오른쪽 응찰내역 div 위치가 일정 위치에 다다르면 scroll을 멈추도록
	if($(window).width()>1300){
	$(window).scroll(function(){
   		$(".view_right").css("top", Math.max(0, 150 - $(this).scrollTop()));

   		if ($(window).scrollTop() > 900) {
            $(".view_right").css({
                position: 'fixed',
                top: Math.max(900-$(this).scrollTop())
            });
        } else {
		if($(window).width()<1300){
	            $(".view_right").css({
	                display: 'block',
	                position: 'static'
	            });
	        }
		}
	});
		
	}

	$frm = $("#frm_list")[0];

	/*원본 지킴이
	$("#navAll").on("click", function(){
		$("#navAll").addClass("orangeLi");
		$("#navPaint").removeClass("orangeLi");
		$("#navPottery").removeClass("orangeLi");
		$(".selected_option_area").hide();
		$(".idle_selected_option_area").show();
	})
	
	$("#navPaint").on("click", function(){
		$("#navAll").removeClass("orangeLi");
		$("#navPaint").addClass("orangeLi");
		$("#navPottery").removeClass("orangeLi");
		$(".selected_option_area").hide();
		$(".idle_selected_option_area").show();
	})
	
	$("#navPottery").on("click", function(){
		$("#navAll").removeClass("orangeLi");
		$("#navPaint").removeClass("orangeLi");
		$("#navPottery").addClass("orangeLi");
		$(".selected_option_area").hide();
		$(".idle_selected_option_area").show();
	})
	*/
	
	
	$("#modalOffBtn").click(function(){
		$(this).parent().parent().hide();
	})
	
	$(".btnBidCancel").click(function(){
		$(".btnBidCancel").parent().parent().parent().hide();
		location.reload();
	})
	
	 if(matchMedia("screen and (max-width: 1300px)").matches){
		$(".bidHistoryList ul").remove();
		$(".bidList .bidHistory").remove();
	}
	
	//창의 width가 1300px 이상이 되면 특정 div들이 사라지도록
	$(window).resize(function(){
		if($(window).width()>=1300){
			$(".bidHistoryList ul").remove();
			$(".bidList .bidHistory").remove();
		}
		location.reload();
	})
	
	if($(window).width()<1300){
		$(window).on("resize", function(){
			$(".bid_price").hide();
		})
	}
	
	$('.howtobtn>ul>li').hover(function() {
		$(this).children('div').css("display", "block");
		$(this).children('div').fadeIn();
	}, function() {
		$(this).children('div').fadeOut('slow');
	});
	
	$(".selected_findStr input").on("click", function(){
		$(this).parent().parent().parent().hide();
		$(".idle_selected_option_area").show();
		search();
	})
	
	
})
//버튼을 누르면 url 복사. 아직 완벽히 구현되지 않음.
function clip(modal){
	var url = window.document.location.href;
	$(".pastedUrl").val(url);
	modal.show();
}

/*howto화면 버튼 누르면 하위 메뉴 등장*/
function subMenuOn(e){
	e.preventDefault();
	$(".howtobtn .active div ul").stop().slideDown();
}

function modalOn(modal){
	modal.show();
}

function modalOff(modal){
	modal.parent().parent().hide();
}

//대표 이미지 변경
function thumbnailChange(src){
	$("#thumbnail_img").attr("src", src);
	$("#thumbnailHiddenImg").attr("src", src);
}

//이미지 확대
function thumbnailMagnify(src, div){
	div.show();
	$(".thumbnailHiddenImg").attr("src", src);
	/*
	if($(".thumbnailHidden").css("display")=="none"){
		console.log("뭔데")
	}else{
		console.log("됨")
		$(window).on("click", function(event) {
			console.log("됨!!")
			console.log(event.target.attr("class"))
	    });
	}*/
}
